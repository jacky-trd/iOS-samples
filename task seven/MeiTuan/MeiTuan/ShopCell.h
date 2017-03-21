//
//  ShopCell.h
//  MeiTuan
//
//  Created by 谭瑞东 on 2017/3/9.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shop.h"

@interface ShopCell : UITableViewCell

//create shop cell instance
+(instancetype)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath AndId:(NSString*)id AndPath:(NSString*)path AndModel:(Shop*)model;

@end
