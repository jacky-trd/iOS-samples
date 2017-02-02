//
//  Array.h
//  DynamicArray
//
//  Created by 谭瑞东 on 2017/2/2.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#ifndef Array_h
#define Array_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Object.h"

typedef Object* AnyPointer;

typedef struct{
    int _length;
    int _capacity;
    AnyPointer *_values;
}Array;

//Function to create an empty array
Array *arrayCreate();

//Function to destroy the array and free the memory
void arrayDestroy(Array *arr);

//Function to return the array length
int arrayGetLength(Array *arr);

//Function to add a new element into the array
void arrayAdd(Array *arr, AnyPointer value);

//Function to remove an element at the given index
void arrayRemoveAtIndex(Array *arr, int index);

//Function to change an element at the given index
void arrayChangeAtIndex(Array *arr, int index, AnyPointer value);

//Function to query an element at the given index
AnyPointer arrayGetValueByIndex(Array *arr, int index);

#endif /* Array_h */
