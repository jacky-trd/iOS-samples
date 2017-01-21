//
//  该文件用于创建Student结构体
//
//  student.swift
//  SortMathAndEnglishScore
//
//  Created by 谭瑞东 on 2017/1/22.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

import Foundation

struct Student {
    //构造函数
    init(name:String,mathScore:Int,englishScore:Int) {
        self.name = name
        self.mathScore = mathScore
        self.englishScore = englishScore
        self.averageScore = 0.0
    }
    
    //姓名
    var name:String
    //数学分
    var mathScore:Int
    //英语分
    var englishScore:Int
    //平均分
    var averageScore:Float
    
    //计算平均分
    mutating func calcAverageScore()->(){
        averageScore = Float(mathScore + englishScore)/2
    }
}
