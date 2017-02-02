//
//  main.m
//  DynamicArray
//
//  Created by 谭瑞东 on 2017/2/2.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Array.h"
#import "Object.h"
#import "Student.h"

//Function to display all the student numbers inside the array
void displayArray(Array *arr){
    for(int i = 0; i < arrayGetLength(arr); i++){
        printf("%d\n", ((Student*)arrayGetValueByIndex(arr, i))->_studentNumber);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //A constant value to indicate how many students will be created
        const int students = 40;
        
        //Create an empty array
        Array *arr = arrayCreate();
        
        //Create students and put them into the array
        for(int i = 0; i < students; i++){
            arrayAdd(arr, (Object*)studentCreate(i));
        }
        
        //Display the result
        printf("The student numbers are:\n");
        displayArray(arr);
        
        //Change the 5th student
        arrayChangeAtIndex(arr, 5, (Object*)studentCreate(100));
        
        //Display the result
        printf("The student numbers after change are:\n");
        displayArray(arr);
        
        //Remove the 5th student
        arrayRemoveAtIndex(arr, 5);
        
        //Display the result
        printf("The student numbers after removal are:\n");
        displayArray(arr);
        
        //Destroy the array
        arrayDestroy(arr);
    }
    
    return 0;
}
