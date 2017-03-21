//
//  Shop.m
//  MeiTuan
//
//  Created by 谭瑞东 on 2017/3/9.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "Shop.h"

@implementation Shop

#pragma mark object level init
-(instancetype)initWithDict:(NSDictionary*)dict{
    self = [super init];
    
    if(self){
        //KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

#pragma mark class level init
+(instancetype)ShopWithDict:(NSDictionary*)dict{
    return [[Shop alloc] initWithDict:dict];
}

@end
