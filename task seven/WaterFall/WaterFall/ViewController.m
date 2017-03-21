//
//  ViewController.m
//  WaterFall
//
//  Created by 谭瑞东 on 2017/3/20.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"
#import "WaterFallFlowLayout.h"
#import "WaterFallCollectionViewCell.h"

//Image Count
CGFloat const kImgCount = 17;

//Cell Resource Identifier
static NSString *identifier = @"collectionViewCell";

@interface ViewController ()

//the image array
@property(nonatomic,strong) NSArray *imgArr;

@end

@implementation ViewController

#pragma mark - lazy initialization of the iamge array
-(NSArray*)imgArr
{
    if(!_imgArr)
    {
        NSMutableArray *muArr = [NSMutableArray array];
        
        //loop and get the images
        for(int i = 1; i <= kImgCount; i++)
        {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i]];
            [muArr addObject:img];
        }
        _imgArr = muArr;
    }
    
    return _imgArr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //get the layout instance
    WaterFallFlowLayout *flowLayout = [[WaterFallFlowLayout alloc] init];
    
    //get the collection view instance
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor yellowColor];
    
    //set delegate flow layout
    self.collectionView.delegate = self;
    
    //set datasource
    self.collectionView.dataSource = self;
    
    //register cell
    [self.collectionView registerClass:[WaterFallCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    //add the collection view to view
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionView dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return the total number of items is actually the array length
    return self.imgArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //get the cell instance
    WaterFallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //if we did not find any cell in the resource pool, create one
    if(!cell)
    {
        cell = [[WaterFallCollectionViewCell alloc] init];
    }
    
    //add the image to the cell and draw it
    cell.image = self.imgArr[indexPath.item];
    
    return cell;
}

#pragma mark - UICollectionView delegate flowLayout 
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //get the image for index path
    UIImage *img = self.imgArr[indexPath.item];
    
    //based on the width, calculate the height
    float height = [self imgHeight:img.size.height width:img.size.width];
    
    return CGSizeMake(100, height);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets edgeInsets = {5,5,5,5};
    return edgeInsets;
}

#pragma mark - calculate the corresponding height based on the width
-(float)imgHeight:(float)height width:(float)width
{
    float newHeight = height/width * 100;
    return newHeight;
}

@end
