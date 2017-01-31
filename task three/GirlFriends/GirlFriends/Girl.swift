//
//  Girl.swift
//  GirlFriends
//
//  Created by 谭瑞东 on 2017/1/22.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

import Foundation

// 女朋友类，定义女朋友的属性和约会方法
public class Girl : NSObject{
    
    override init() {
        //随机生成两个大写字母的名字
        _name = String.init(format: "%C%C", 65 + arc4random()%26, 65 + arc4random()%26)
        //随机生成介于18到30岁的年龄
        _age = Int(arc4random()%13) + 18
    }
    
    public func date()->String{
        var date:String!
        //随机生成女朋友是否愿意约会
        if(arc4random()%2 == 0){
            date = "同意"
        } else {
            date = "不同意"
        }
        
        return date
    }
    
    //重写自描述函数
    public override var description: String{
        return "名字是：\(_name), 年龄是：\(_age)"
    }
    
    //名字
    private var _name:String
    //年龄
    private var _age:Int
}
