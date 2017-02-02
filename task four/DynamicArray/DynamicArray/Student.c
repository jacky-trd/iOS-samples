//
//  Student.c
//  DynamicArray
//
//  Created by 谭瑞东 on 2017/2/2.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#include "Student.h"

//Function to create a student with the given number
Student *studentCreate(int studentNumber){
    Student *instance = malloc(sizeof(Student));
    
    //Increase the retainCount
    OBJECT_RETAIN(instance);
    
    instance->_studentNumber = studentNumber;
    return instance;
}

//Function to destroy the student and free the memory
void studentDestroy(Student *stu){
    OBJECT_RELEASE(stu);
}

//Function to return the student number
int studentGetNumber(Student *stu){
    return stu->_studentNumber;
}
