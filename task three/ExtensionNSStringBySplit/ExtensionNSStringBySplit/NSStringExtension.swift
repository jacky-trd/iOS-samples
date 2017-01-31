//
//  NSStringExtension.swift
//  ExtensionNSStringBySplit
//
//  Created by 谭瑞东 on 2017/1/22.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

import Foundation

//NSString的Split函数扩展
extension NSString{
    func split(splitStr: NSString)-> [NSString]{
        
        //初始化最终输出的结果
        var strArray:[NSString] = [NSString]()
        //截断字符串的起点
        var startLocation:Int = 0
        
        for i in 0...self.length-1{
            //由于用于截断的字符串可能不一定是一个字符，如果第一个字符相等需要继续向后面比较
            if(self.character(at: i) == splitStr.character(at: 0)){
                var match:Bool = true
                for j in 0...splitStr.length-1{
                    //如果有一个字符不相等，则不截断
                    if(self.character(at: i+j) != splitStr.character(at: j)){
                        match = false
                        break;
                    }
                }
                //如果所有字符都相等，则截断
                if(match)
                {
                    strArray.append(self.substring(with: NSRange(location: startLocation, length: i - startLocation)) as NSString)
                    //重新设置下一次的起点
                    startLocation = i + splitStr.length
                }
            }
        }
        
        //添加最后一部分字符串
        if(startLocation != self.length - 1)
        {
            strArray.append(self.substring(from: startLocation) as NSString)
        }
    
        return strArray
    }
}
