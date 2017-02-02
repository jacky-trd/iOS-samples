//
//  Object.c
//  DynamicArray
//
//  Created by 谭瑞东 on 2017/2/2.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#include "Object.h"

//Function to increase the retainCount
void objectRetain(Object *obj){
    obj->_retainCount++;
}

//Function to reduce the retainCount
void objectRelease(Object *obj){
    obj->_retainCount--;
    
    //If the retainCount is less or equal to zero, free it
    if(obj->_retainCount <= 0){
        free(obj);
        obj = NULL;
    }
}

//Function to return the retainCount
int objectGetRetainCount(Object *obj){
    return obj->_retainCount;
}
