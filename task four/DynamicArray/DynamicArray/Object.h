//
//  Object.h
//  DynamicArray
//
//  Created by 谭瑞东 on 2017/2/2.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#ifndef Object_h
#define Object_h

#include <stdio.h>
#include <stdlib.h>

#define OBJECT_RETAIN(obj) objectRetain((Object*)obj)
#define OBJECT_RELEASE(obj) objectRelease((Object*)obj)
#define OBJECT_RETAIN_COUNT(obj) objectGetRetainCount((Object*)obj)

typedef struct{
    int _retainCount;
} Object;

//Function to increase the retainCount
void objectRetain(Object *obj);

//Function to reduce the retainCount
void objectRelease(Object *obj);

//Function to return the retainCount
int objectGetRetainCount(Object *obj);

#endif /* Object_h */
