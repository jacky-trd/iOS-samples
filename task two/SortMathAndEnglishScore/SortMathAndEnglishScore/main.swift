//
//  任务三作业二：构造对象并按要求进行排序
//
//  main.swift
//  SortMathAndEnglishScore
//
//  Created by 谭瑞东 on 2017/1/22.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

import Foundation

//获取随机分数
func randomScore()->Int{
    return Int(arc4random())%100
}

//初始化学生数组
var studentsArray:[Student] = [Student]()
for i in 0...9{
    var studentInstance:Student = Student(name: "A\(i)", mathScore: randomScore(), englishScore: randomScore())
    //计算平均分
    studentInstance.calcAverageScore()
    studentsArray.append(studentInstance)
}

//排序函数
func sort(arr:[Student])->[Student]{
    var innerArray = arr
    //冒泡排序
    for i in 0...innerArray.count-2{
        for j in 0...innerArray.count-i-2{
            if(innerArray[j].averageScore > innerArray[j+1].averageScore){
                let tempValue = innerArray[j]
                innerArray[j] = innerArray[j+1]
                innerArray[j+1] = tempValue
            }
        }
    }
    return innerArray
}

//调用排序函数
var sortedStudentArray = sort(arr: studentsArray)

//打印结果
for i in 0...sortedStudentArray.count-1{
    print("第\(sortedStudentArray.count-i)名：\(sortedStudentArray[i].name)，数学得分：\(sortedStudentArray[i].mathScore)，英语得分：\(sortedStudentArray[i].englishScore)，平均分：\(sortedStudentArray[i].averageScore)")
}
