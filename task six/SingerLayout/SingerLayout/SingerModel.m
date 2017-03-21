//
//  SingerModel.m
//  SingerBrowser
//
//  Created by 谭瑞东 on 2017/2/15.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "SingerModel.h"

@implementation SingerModel

-(instancetype)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    
    if(self)
    {
        //kvc
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)singerModelWithDict:(NSDictionary*)dict
{
    return [[SingerModel alloc] initWithDict:dict];
}

@end
