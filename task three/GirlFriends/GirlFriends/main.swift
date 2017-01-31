//
// 任务三作业一：创建100个女朋友
//
//  main.swift
//  GirlFriends
//
//  Created by 谭瑞东 on 2017/1/22.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

import Foundation

//随机生成100个女朋友
for i in 0...99{
    var girlFriend = Girl()
    //输出女朋友信息
    print("第\(i+1)个女友信息:", terminator: " ")
    print(girlFriend)
    print("她\(girlFriend.date())与你约会。")
}
