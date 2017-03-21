//
//  Shop.h
//  MeiTuan
//
//  Created by 谭瑞东 on 2017/3/9.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

//shop icon
@property(nonatomic,copy)NSString *icon;
//shop name
@property(nonatomic,copy)NSString *name;
//shop rank
@property(nonatomic,assign)NSNumber *rank;
//shop sales
@property(nonatomic,assign)NSNumber *sales;
//the threshold for delivery
@property(nonatomic,assign)NSNumber *deliveryThreshold;
//the delivery cost
@property(nonatomic,assign)NSNumber *deliveryCost;
//the average delivery time
@property(nonatomic,assign)NSNumber *deliveryTime;
//the shop distance
@property(nonatomic,assign)NSNumber *distance;

//object level init
-(instancetype)initWithDict:(NSDictionary*)dict;
//class level init
+(instancetype)ShopWithDict:(NSDictionary*)dict;

@end
