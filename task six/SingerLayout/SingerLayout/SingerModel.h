//
//  SingerModel.h
//  SingerBrowser
//
//  Created by 谭瑞东 on 2017/2/15.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingerModel : NSObject

//singer's name
@property(nonatomic,copy)NSString *name;

//singer's song name
@property(nonatomic,copy)NSString *songname;

//singer's picture
@property(nonatomic,copy)NSString *pic;

-(instancetype)initWithDict:(NSDictionary*)dict;

+(instancetype)singerModelWithDict:(NSDictionary*)dict;

@end
