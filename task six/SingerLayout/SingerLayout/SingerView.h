//
//  SingerView.h
//  SingerLayout
//
//  Created by 谭瑞东 on 2017/2/18.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingerModel.h"

@interface SingerView : UIView

//singer picture
@property (weak, nonatomic) IBOutlet UIImageView *imgSingerPic;

//song name
@property (weak, nonatomic) IBOutlet UILabel *labelSongName;

//download button
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;

//singer model
@property (strong, nonatomic) SingerModel *sModel;

//create singer view instance
+(instancetype)initFromXib;

@end
