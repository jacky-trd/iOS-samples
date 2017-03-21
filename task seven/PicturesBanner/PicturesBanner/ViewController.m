//
//  ViewController.m
//  PicturesBanner
//
//  Created by 谭瑞东 on 2017/3/5.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"
#import "Banner.h"

//pictures count
#define kPicCount 5
//scroll interval
#define dblInterval 2.0

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //generate a picture name array
    NSMutableArray *pictures = [self generatePicturesArray];
    
    //get a banner instance with picture name array and frame
    Banner *banner = [Banner BannerWithPictures:pictures AndFrame:self.view.bounds];
    //Banner *banner = [Banner BannerWithPictures:pictures AndFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:banner];
    
    //set interval and begin to scroll
    [banner setInterval:dblInterval];
}

#pragma mark Generate a picture name array
-(NSMutableArray*)generatePicturesArray{

    NSMutableArray *pictures = [NSMutableArray array];
    
    //Add the last picture to top to smoothly loop
    [pictures addObject:[NSString stringWithFormat:@"%d.jpg", kPicCount]];
    
    for(int i = 0; i < kPicCount; i++)
    {
        [pictures addObject:[NSString stringWithFormat:@"%d.jpg", i + 1]];
    }
    
    //Add the first picture to end to smoothly loop
    [pictures addObject:[NSString stringWithFormat:@"%d.jpg", 1]];
    
    return pictures;
}

@end
