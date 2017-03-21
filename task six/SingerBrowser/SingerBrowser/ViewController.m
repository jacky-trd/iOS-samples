//
//  ViewController.m
//  SingerBrowser
//
//  Created by 谭瑞东 on 2017/2/15.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"
#import "SingerModel.h"

@interface ViewController ()

//the array of all singers
@property(nonatomic,strong)NSMutableArray *arrayOfAllSingers;

//title control to show the singer's name and index
@property(nonatomic,strong)UILabel *lTitle;

//imageview control to show the singer's picture
@property(nonatomic,strong)UIImageView *ivImage;

//button to show the previous picture
@property(nonatomic,strong)UIButton *btnBack;

//button to show the next picture
@property(nonatomic,strong)UIButton *btnNext;

//the index of current picture
@property(nonatomic, assign)int iCurrentPictureIndex;

@end

@implementation ViewController

#pragma mark lazy initialization of singers' array
-(NSMutableArray*)arrayOfAllSingers
{
    if(!_arrayOfAllSingers)
    {
        //read contents from the plist file
        _arrayOfAllSingers = [NSMutableArray array];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"singers.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
        
        //create the array of the singers models
        for(NSDictionary *dict in array)
        {
            SingerModel *model = [SingerModel singerModelWithDict:dict];
            [_arrayOfAllSingers addObject:model];
        }
    }
    
    return _arrayOfAllSingers;
}

#pragma mark lazy initialization of the title control
-(UILabel*)lTitle
{
    if(!_lTitle)
    {
        //calculate the title position based on the image position
        _lTitle = [[UILabel alloc] initWithFrame:CGRectMake(
                                    CGRectGetMinX(self.ivImage.frame),
                                    CGRectGetMinY(self.ivImage.frame) - 40,
                                    200, 30)];
        
        _lTitle.backgroundColor = [UIColor redColor];
        _lTitle.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_lTitle];
    }
    
    return _lTitle;
}

#pragma mark lazy initialization of the imageview control
-(UIImageView*)ivImage
{
    if(!_ivImage)
    {
        _ivImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _ivImage.backgroundColor = [UIColor redColor];
        
        //position the image on the center
        _ivImage.center = self.view.center;
        [self.view addSubview:_ivImage];
    }
    
    return _ivImage;
}

#pragma mark lazy initialization of the back button
-(UIButton*)btnBack
{
    if(!_btnBack)
    {
        //calculate the button position based on the image position
        _btnBack = [[UIButton alloc] initWithFrame:CGRectMake(
                                    CGRectGetMinX(self.ivImage.frame),
                                    CGRectGetMaxY(self.ivImage.frame) + 20,
                                    85, 30)];
        
        _btnBack.backgroundColor = [UIColor blueColor];
        [_btnBack setTitle:@"上一张" forState:UIControlStateNormal];
        [_btnBack addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btnBack];
    }
    
    return _btnBack;
}

#pragma mark lazy initialization of the next button
-(UIButton*)btnNext
{
    if(!_btnNext)
    {
        //calculate the button position based on the image position
        _btnNext = [[UIButton alloc] initWithFrame:CGRectMake(
                                    CGRectGetMaxX(self.ivImage.frame) - 85,
                                    CGRectGetMaxY(self.ivImage.frame) + 20,
                                    85, 30)];
        
        _btnNext.backgroundColor = [UIColor blueColor];
        [_btnNext setTitle:@"下一张" forState:UIControlStateNormal];
        [_btnNext addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btnNext];
    }
    
    return _btnNext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //show the first image
    [self showCurrentPage:0];
}

#pragma mark show previous picture
-(void)goBack
{
    //only show the previous image when the index is larger than 0
    if(self.iCurrentPictureIndex > 0)
    {
        [self showCurrentPage:--self.iCurrentPictureIndex];
    }
}

#pragma mark show next picture
-(void)goNext
{
    //only show the next image when the index is less than self.arrayOfAllSingers.count - 1
    if(self.iCurrentPictureIndex < self.arrayOfAllSingers.count - 1)
    {
        [self showCurrentPage:++self.iCurrentPictureIndex];
    }
}

#pragma mark show current picture
-(void)showCurrentPage:(int)iPage
{
    //make sure the index is within the array bounds
    if((iPage >= 0)&&(iPage < self.arrayOfAllSingers.count))
    {
        //get the singer model
        SingerModel *model = self.arrayOfAllSingers[iPage];
        
        //show title
        NSString *strTitle = [NSString stringWithFormat:@"%@ %d/%lu", model.name, iPage + 1, (unsigned long)self.arrayOfAllSingers.count];
        self.lTitle.text = strTitle;
        
        //show singer picture
        self.ivImage.image = [UIImage imageNamed:model.pic];
        
        //enable/disable the buttons
        if(iPage == 0)
        {
            [self disableButton:self.btnBack];
        }
        else
        {
            [self enableButton:self.btnBack];
        }
        
        if(iPage == self.arrayOfAllSingers.count - 1)
        {
            [self disableButton:self.btnNext];

        }
        else
        {
            [self enableButton:self.btnNext];
        }
    }
}

#pragma mark disable the given button
-(void)disableButton:(UIButton*)btn
{
    btn.enabled = NO;
    btn.backgroundColor = [UIColor grayColor];
}

#pragma mark enable the given button
-(void)enableButton:(UIButton*)btn
{
    btn.enabled = YES;
    btn.backgroundColor = [UIColor blueColor];
}

@end
