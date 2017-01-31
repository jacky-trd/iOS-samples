//
//  任务三作业二：为NSString类添加split功能
//
//  main.swift
//  ExtensionNSStringBySplit
//
//  Created by 谭瑞东 on 2017/1/22.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

import Foundation

//初始化一个字符串
let longString:NSString = "This is a very long long long string!"

//用空格进行截断，并输出结果
let strArray:[NSString] = longString.split(splitStr: " ")
print(strArray)

//用long进行截断，并输出结果
let anotherStrArray:[NSString] = longString.split(splitStr: "long")
print(anotherStrArray)
