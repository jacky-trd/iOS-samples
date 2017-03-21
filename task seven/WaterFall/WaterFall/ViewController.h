//
//  ViewController.h
//  WaterFall
//
//  Created by 谭瑞东 on 2017/3/20.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

//the collection view to display the water fall
@property(nonatomic,strong) UICollectionView *collectionView;

@end

