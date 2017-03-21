//
//  SingerView.m
//  SingerLayout
//
//  Created by 谭瑞东 on 2017/2/18.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "SingerView.h"

@implementation SingerView

- (IBAction)download:(UIButton *)sender {
    
    //according to the requirement, we disable the button after downloading
    sender.enabled = NO;
    
    //initialize the download information label
    UILabel *lableTip = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    //calculate the position
    CGPoint centerPoint = CGPointMake(self.superview.center.x, CGRectGetMaxY(self.superview.frame)-50);
    lableTip.center = centerPoint;
    
    lableTip.backgroundColor = [UIColor grayColor];
    lableTip.alpha = 1;
    lableTip.text = @"下载完成";
    lableTip.textAlignment = NSTextAlignmentCenter;
    [self.superview addSubview:lableTip];
    
    //animation of the download information
    [UIView animateWithDuration:2.0 animations:^{
        lableTip.alpha = 0;
    } completion:^(BOOL finished){
        [lableTip removeFromSuperview];
    }];
}

+(instancetype)initFromXib
{
    //get the singer view from xib and return
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"SingerCell" owner:nil options:nil];
    SingerView *viewFromXib = [arr firstObject];
    return  viewFromXib;
}

-(void) setSModel:(SingerModel *)sModel
{
    if(_sModel != sModel)
    {
        _sModel = sModel;
        
        //show singer picture based on the given model
        self.imgSingerPic.image = [UIImage imageNamed:_sModel.pic];
        
        //show the song name based on the given model
        self.labelSongName.text = _sModel.songname;
    }
}

@end
