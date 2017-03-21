//
//  WaterFallFlowLayout.h
//  WaterFall
//
//  Created by 谭瑞东 on 2017/3/20.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterFallFlowLayout : UICollectionViewFlowLayout

//this delegate will point to viewController
@property (nonatomic,assign) id<UICollectionViewDelegateFlowLayout> delegate;

//total cell count
@property (nonatomic, assign) NSInteger cellCount;

//the arry of every column height
@property (nonatomic, strong) NSMutableArray *colArray;

//key is the cell frame; and value is the indexPath
@property (nonatomic, strong) NSMutableDictionary *attributeDict;

@end
