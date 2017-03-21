//
//  ShopCell.m
//  MeiTuan
//
//  Created by 谭瑞东 on 2017/3/9.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ShopCell.h"

@interface ShopCell()

//shop icon
@property (weak, nonatomic) IBOutlet UIImageView *icon;
//shop image
@property (weak, nonatomic) IBOutlet UILabel *name;
//first star of the rank
@property (weak, nonatomic) IBOutlet UIImageView *firstStar;
//second star of the rank
@property (weak, nonatomic) IBOutlet UIImageView *secondStar;
//third star of the rank
@property (weak, nonatomic) IBOutlet UIImageView *thirdStar;
//fourth star of the rank
@property (weak, nonatomic) IBOutlet UIImageView *fourthStar;
//fifth star of the rank
@property (weak, nonatomic) IBOutlet UIImageView *fifthStar;
//shop sales
@property (weak, nonatomic) IBOutlet UILabel *sales;
//shop detail info
@property (weak, nonatomic) IBOutlet UILabel *info;
//shop distance
@property (weak, nonatomic) IBOutlet UILabel *distance;

//the loaded shop model
@property (nonatomic,strong) Shop *model;

@end

@implementation ShopCell

#pragma mark Create shop cell instance
+(instancetype)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath AndId:(NSString*)strId AndPath:(NSString*)path AndModel:(Shop*)model{
    
    //try to get cell from resouce pool
    ShopCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    
    //if doesn't exist, create one
    if(!cell){
        
        cell = [[[NSBundle mainBundle] loadNibNamed:path owner:nil options:nil]firstObject];
        
        //set model
        cell.model = model;
    }

    return cell;
}

-(void)setModel:(Shop *)model{
    
    //save model
    _model = model;
    
    //set shop icon
    self.icon.image = [UIImage imageNamed:model.icon];
    
    //set shop name
    self.name.text = model.name;
    
    //determine if the first star should be highlighted
    if([model.rank  intValue] > 1){
        self.firstStar.image = [UIImage imageNamed:@"starhighlighted.png"];
    }
    else{
        self.firstStar.image = [UIImage imageNamed:@"star.png"];
    }
    
    //determine if the second star should be highlighted
    if([model.rank  intValue] > 2){
        self.secondStar.image = [UIImage imageNamed:@"starhighlighted.png"];
    }
    else{
        self.secondStar.image = [UIImage imageNamed:@"star.png"];
    }
    
    //determine if the third star should be highlighted
    if([model.rank  intValue] > 3){
        self.thirdStar.image = [UIImage imageNamed:@"starhighlighted.png"];
    }
    else{
        self.thirdStar.image = [UIImage imageNamed:@"star.png"];
    }
    
    //determine if the fourth star should be highlighted
    if([model.rank  intValue] > 4){
        self.fourthStar.image = [UIImage imageNamed:@"starhighlighted.png"];
    }
    else{
        self.fourthStar.image = [UIImage imageNamed:@"star.png"];
    }
    
    //determine if the fifth star should be highlighted
    if([model.rank  intValue] == 5){
        self.fifthStar.image = [UIImage imageNamed:@"starhighlighted.png"];
    }
    else{
        self.fifthStar.image = [UIImage imageNamed:@"star.png"];
    }
    
    //set shop sales
    self.sales.text = [NSString stringWithFormat:@"已售%@份", model.sales];
    
    //set shop detai info
    self.info.text = [NSString stringWithFormat:@"起送%@元|配送%@元|平均%@分钟", model.deliveryThreshold, model.deliveryCost, model.deliveryTime];
    
    //set shop distance
    self.distance.text = [NSString stringWithFormat:@"%@米",model.distance];
}

@end
