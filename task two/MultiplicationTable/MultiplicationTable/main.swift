//
//  任务二作业一：打印九九乘法表
//
//  main.swift
//  MultiplicationTable
//
//  Created by 谭瑞东 on 2017/1/21.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

import Foundation

//外层循环对应乘法符号右侧的操作数
for i in 1...9{
    //内层循环代表乘法符号左侧操作数
    for j in 1...i{
        //打印乘法表，不换行
        print("\(j)x\(i)=\(i*j)",terminator:" ")
    }
    //打印换行
    print("")
}
