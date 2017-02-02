//
//  Student.h
//  DynamicArray
//
//  Created by 谭瑞东 on 2017/2/2.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#ifndef Student_h
#define Student_h

#include <stdio.h>
#include <stdlib.h>
#include "Object.h"

typedef struct{
    int _retainCount;
    int _studentNumber;
} Student;

//Function to create a student with the given number
Student *studentCreate(int studentNumber);

//Function to return the student number
int studentGetNumber(Student *stu);

//Function to destroy the student and free the memory
void studentDestroy(Student *stu);

#endif /* Student_h */
