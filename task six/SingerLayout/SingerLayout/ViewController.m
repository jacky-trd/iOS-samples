//
//  ViewController.m
//  SingerLayout
//
//  Created by 谭瑞东 on 2017/2/18.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"
#import "SingerModel.h"
#import "SingerView.h"

//the distance from top status bar
#define TopMargin 40

//the distance between every row
#define YMargin 25

//the width of every singer frame
#define ViewWidth 80

//the height of every singer frame
#define ViewHeight 100

//total singers number
#define SingersNumber 9

//columns number for every row
#define Column 2

@interface ViewController ()

//the array of all singers
@property(nonatomic,strong)NSMutableArray *arrayOfAllSingers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //calculate the distance between every column
    int iXMargin = (self.view.frame.size.width - (ViewWidth * Column))/(Column + 1);
    
    //loop every singer and show the picture, song name and download button
    for(int i = 0; i < SingersNumber; i++)
    {
        //validation
        if(i < self.arrayOfAllSingers.count)
        {
            //get the singer model
            SingerModel *singer = self.arrayOfAllSingers[i];
            
            //calculate the position of the singer frame
            int iCurrentColumn = i%Column;
            int iCurrentRow = i/Column;
            
            int x = iXMargin + (ViewWidth + iXMargin) * iCurrentColumn;
            int y = TopMargin + (ViewHeight + YMargin) * iCurrentRow;
        
            //show the singer frame
            SingerView *sView = [SingerView initFromXib];
            sView.frame = CGRectMake(x, y, ViewWidth, ViewHeight);
            sView.sModel = singer;
            [self.view addSubview:sView];
        }
    }
}

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

@end
