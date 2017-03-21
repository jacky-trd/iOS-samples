//
//  WaterFallCollectionViewCell.m
//  WaterFall
//
//  Created by 谭瑞东 on 2017/3/20.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "WaterFallCollectionViewCell.h"

@implementation WaterFallCollectionViewCell

#pragma mark - set image property
-(void) setImage:(UIImage *)image{

    //if the image is new, save it
    if(_image != image){
        _image = image;
    }
    
    //drawRect will be invoded automatically
    [self setNeedsDisplay];
}

#pragma mark - draw the image. triggered by setNeedsDisplay.
-(void)drawRect:(CGRect)rect{
    
    //draw the picture
    float newHeight = _image.size.height / _image.size.width * 100;
    [_image drawInRect:CGRectMake(0, 0, 100, newHeight)];
}

@end
