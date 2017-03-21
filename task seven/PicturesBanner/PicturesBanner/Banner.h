//
//  Banner.h
//  PicturesBanner
//
//  Created by 谭瑞东 on 2017/3/6.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Banner : UIView<UIScrollViewDelegate>

//Timer interval
@property(nonatomic,assign) CGFloat interval;

//Initialize and get a banner instance
+(instancetype)BannerWithPictures:(NSMutableArray*)pictures AndFrame:(CGRect)frame;

@end
