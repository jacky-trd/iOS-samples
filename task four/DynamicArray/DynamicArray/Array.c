//
//  Array.c
//  DynamicArray
//
//  Created by 谭瑞东 on 2017/2/2.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#include "Array.h"

//Funtion to allocate a memory with the given capacity
static AnyPointer *allocMemoryByCapacity(int capacity){
    
    int bytesCapacity = sizeof(AnyPointer) * capacity;
    AnyPointer *mem = malloc(bytesCapacity);
    
    //initial the memory with '\0';
    memset(mem, '\0', bytesCapacity);
    
    return mem;
}

//Function to create an empty array
Array *arrayCreate(){
    
    Array *arr = malloc(sizeof(Array));
    
    //Initialize the array
    arr->_length = 0;
    arr->_capacity = 32;
    arr->_values = allocMemoryByCapacity(arr->_capacity);
    
    return arr;
}

//Function to destroy the array and free the memory
void arrayDestroy(Array *arr){
    
    //First we will reduce the retainCount of all the array elements
    for(int i = 0; i < arr->_length; i++){
        OBJECT_RELEASE(arrayGetValueByIndex(arr, i));
    }
    
    //Then free the memory and set pointer to NULL
    free(arr->_values);
    free(arr);
    arr = NULL;
}

//Function to get the array length
int arrayGetLength(Array *arr){
    return arr->_length;
}

//Function to add a new element into the array
void arrayAdd(Array *arr, AnyPointer value){
    
    //First we will check if the array has already been full of elements
    if(arr->_length >= arr->_capacity){
        //If so, we will make the capacity two times larger
        arr->_capacity *= 2;
        AnyPointer *oldValues = arr->_values;
        arr->_values = allocMemoryByCapacity(arr->_capacity);
        memcpy(arr->_values, oldValues, arr->_length * sizeof(AnyPointer));
        free(oldValues);
        oldValues = NULL;
    }
    
    arr->_values[arr->_length] = value;
    arr->_length++;
    
    //Increase the retainCount
    OBJECT_RETAIN(value);
}

//Function to remove an element at the given index
void arrayRemoveAtIndex(Array *arr, int index){
    
    //First we will check if the given index is out of the bounds
    if((index < 0)||(index > arr->_length)){
        printf("The input index of %d is out of the bounds!", index);
    }
    
    //Reduce the retainCount of the removed element
    OBJECT_RELEASE(arrayGetValueByIndex(arr, index));
    
    //Begin to remove the element
    arr->_length--;
    for(int i = index; i < arr->_length; i++){
        arrayChangeAtIndex(arr, i, arrayGetValueByIndex(arr, i + 1));
    }
}

//Function to change an element at the given index
void arrayChangeAtIndex(Array *arr, int index, AnyPointer value){
    
    //First we will check if the given index is out of the bounds
    if((index < 0)||(index > arr->_length)){
        printf("The input index of %d is out of the bounds!", index);
    }
    
    //Reduce the retainCount of the old element
    OBJECT_RELEASE(arrayGetValueByIndex(arr, index));
    //Increase the retainCount of the new element
    OBJECT_RETAIN(value);
    
    arr->_values[index] = value;
    
}

//Query the element at the given index
AnyPointer arrayGetValueByIndex(Array *arr, int index){
    
    //First we will check if the given index is out of the bounds
    if((index < 0)||(index > arr->_length)){
        printf("The input index of %d is out of the bounds!", index);
    }
    
    return arr->_values[index];
}
