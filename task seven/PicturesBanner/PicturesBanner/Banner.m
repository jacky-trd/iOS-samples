//
//  Banner.m
//  PicturesBanner
//
//  Created by 谭瑞东 on 2017/3/6.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//



#import "Banner.h"

@interface Banner ()

//the scrollview to display the pictures
@property(nonatomic, strong) UIScrollView *displayer;
//bottom page control
@property(nonatomic, strong) IBOutlet UIPageControl *page;
//timer to auto display pictures
@property(nonatomic, strong) NSTimer *timerForScroll;

//input picture amounts
@property(nonatomic, assign) int picNumber;
//input view frame
@property(nonatomic, assign) CGRect viewFrame;

@end

@implementation Banner

#pragma mark Generate a Banner instance
+(instancetype)BannerWithPictures:(NSArray*)pictures AndFrame:(CGRect)frame{
    //initialize the UIView
    Banner *banner = [[super alloc] initWithFrame:frame];
    
    if(banner){
        //preparation
        [banner setPicNumber:(int)pictures.count];
        [banner setViewFrame:frame];
        
        //initialize the UIScrollView and load pictures
        [banner loadPictures:pictures];
        //initialize the UIPageControl
        [banner page];
        
        //start from the second picture(the first one is actually same as the last one)
        banner.displayer.contentOffset = CGPointMake(frame.size.width, 0);
    }
    
    return banner;
}

#pragma mark Lazy initialization for the UIScrollView
-(UIScrollView*) displayer {
    if(!_displayer)
    {
        //set UIScrollView Settings
        _displayer = [[UIScrollView alloc] initWithFrame:self.viewFrame];
        _displayer.contentSize = CGSizeMake(self.viewFrame.size.width * self.picNumber, self.viewFrame.size.height);
        _displayer.showsHorizontalScrollIndicator = NO;
        _displayer.pagingEnabled = YES;
        _displayer.delegate = self;
        
        //add the UIScrollView to Banner
        [self addSubview:_displayer];
    }
    
    return _displayer;
}

#pragma mark Load Pictures with the input picture name array
-(void) loadPictures:(NSArray*)pictures {
    
    NSString *strPicName = nil;
    for(int i = 0; i < pictures.count; i++){
        
        //initialize UIImageView with given frame
        CGRect frame = CGRectMake(self.viewFrame.size.width * i, 0, self.viewFrame.size.width, self.viewFrame.size.height);
        UIImageView *ivImage = [[UIImageView alloc] initWithFrame:frame];
        
        //get the picture name and load the picture
        strPicName = [NSString stringWithFormat:@"%@", pictures[i]];
        ivImage.image = [UIImage imageNamed:strPicName];
        
        //add the UIImageView to UIScrollView
        [self.displayer addSubview:ivImage];
    }
}

#pragma mark Lazy initialization for the UIPageControl
-(UIPageControl*) page{
    if(!_page)
    {
        //set UIPageControl settings
        _page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.viewFrame.size.height * 0.85, self.viewFrame.size.width, 40)];
        _page.numberOfPages = self.picNumber - 2;
        _page.pageIndicatorTintColor = [UIColor grayColor];
        _page.currentPageIndicatorTintColor = [UIColor orangeColor];
        [self addSubview:_page];
        [self bringSubviewToFront:_page];
    }
    
    return _page;
}

-(void)setInterval:(CGFloat)interval{
    
    [self stopTimer];
    
    _interval = interval;
    
    [self startTimer];
}

#pragma mark Start the timer and begin to scroll
-(void)startTimer{
    
    if(self.timerForScroll == nil){
        
        self.timerForScroll = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(scrollToNextPicture) userInfo:nil repeats:YES];
    }
}

#pragma mark Stop the timer
-(void)stopTimer{
    
    if(self.timerForScroll != nil){
        
        [self.timerForScroll invalidate];
        self.timerForScroll = nil;
    }
}

#pragma mark Calculate the offset of next picture
-(void) scrollToNextPicture {
    
    //get current offset
    int offset = self.displayer.contentOffset.x;
    //calculate next offset
    offset += self.viewFrame.size.width;
    
    [self.displayer setContentOffset:CGPointMake(offset, 0) animated:YES];
}

#pragma mark Sync the UIPageControl
-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
    
    int offset = self.displayer.contentOffset.x;
    if(offset == self.viewFrame.size.width * (self.picNumber - 1)){
        
        //if comes to the last one, we go to the second one for smoothly loop
        offset = self.viewFrame.size.width;
        self.displayer.contentOffset = CGPointMake(offset, 0);
        
        //sync the page control with scrollview
        self.page.currentPage = 0;
    }
    else if(offset == 0){
        
        //if comes to the first one, we go to the last second one for smoothly loop
        offset = self.viewFrame.size.width * (self.picNumber - 2);
        self.displayer.contentOffset = CGPointMake(offset, 0);
        
        //sync the page control with scrollview
        self.page.currentPage = self.picNumber - 3;
    }
    else{
        
        //sync the page control with scrollview
        self.page.currentPage = (self.displayer.contentOffset.x - self.viewFrame.size.width) / self.viewFrame.size.width;;
    }
}

#pragma mark For manually drag, stop the timer
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    //disable timer when user manually drags the pictures
    [self stopTimer];
}

#pragma mark After manually drag, start the timer again
-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    //start the timer again after user drags the pictures
    [self startTimer];
}

@end
