//
//  WaterFallFlowLayout.m
//  WaterFall
//
//  Created by 谭瑞东 on 2017/3/20.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "WaterFallFlowLayout.h"

//the column count
CGFloat const colCount = 3;

@implementation WaterFallFlowLayout

#pragma mark - prepareLayout before display the cells
-(void)prepareLayout{
    [super prepareLayout];
    
    //during prepare layout, the objects and parameters can be initialized
    _colArray = [NSMutableArray array];
    _attributeDict = [NSMutableDictionary dictionary];

    //the delegate points to viewcontroller
    self.delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    
    //get image cell number, if zero, return
    _cellCount = [self.collectionView numberOfItemsInSection:0];
    if(_cellCount == 0){
        return;
    }
    
    //initially, all the column are zero distance from top
    float top = 0;
    for(int i = 0; i < colCount; i++){
        [_colArray addObject:[NSNumber numberWithFloat:top]];
    }
    
    //now, begin to calculate the column height (_colArray) and the item frames (_attributeDict)
    for(int i = 0; i<_cellCount; i++){
        [self layoutItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
    }
}

#pragma mark - calculate the column height (_colArray) and the item frames (_attributeDict)
-(void)layoutItemAtIndexPath:(NSIndexPath*)indexPath{
    
    //get the insets of the collection view
    UIEdgeInsets edgeInsets = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.row];
    
    //get the image size at indexPath
    CGSize itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    
    //get the shortest column (the new image will be placed in the shortest column)
    float col = 0;
    float shortHeight = [[_colArray objectAtIndex:col] floatValue];
    for(int i = 0; i < _colArray.count; i++){
        float height = [[_colArray objectAtIndex:i] floatValue];
        if(height < shortHeight){
            shortHeight = height;
            col = i;
        }
    }
    
    //calculate the frame for the item
    float top = [[_colArray objectAtIndex:col] floatValue];
    CGRect frame = CGRectMake(edgeInsets.left + col * (edgeInsets.left + itemSize.width), top + edgeInsets.top, itemSize.width, itemSize.height);
    
    //add the top distance value into array for the selected shortest column
    [_colArray replaceObjectAtIndex:col withObject:[NSNumber numberWithFloat:top + edgeInsets.top + itemSize.height]];
    
    //add the frame into dictionary
    [_attributeDict setObject:indexPath forKey:NSStringFromCGRect(frame)];
}

#pragma mark - get the collection view size
-(CGSize)collectionViewContentSize{
    
    CGSize size = self.collectionView.frame.size;
    
    //find the max height between all columns
    float maxHeight = [[_colArray objectAtIndex:0]floatValue];
    for(int i = 0; i < _colArray.count; i++){
        float colHeight = [[_colArray objectAtIndex:i] floatValue];
        if(colHeight > maxHeight){
            maxHeight = colHeight;
        }
    }
    
    //get the final content size
    size.height = maxHeight;
    return  size;
}

#pragma mark - return all the item frames which intersect with the given rect
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *muArr = [NSMutableArray array];
    
    //find the indexPath array which intersects with the given rect
    NSArray *indexPaths = [self indexPathsOfItem:rect];
    
    //find all the frames for the indexPath array
    for(NSIndexPath *indexPath in indexPaths){
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [muArr addObject:attribute];
    }
    
    return muArr;
}

#pragma mark - return the indexPath array which intersects with the given rect
-(NSArray*) indexPathsOfItem:(CGRect)rect{
    
    NSMutableArray *array = [NSMutableArray array];
    
    for(NSString *rectStr in _attributeDict){
        CGRect cellRect = CGRectFromString(rectStr);
        
        //if the cell intersects with the given rect, put it into the array
        if(CGRectIntersectsRect(cellRect, rect)){
            NSIndexPath *indexPath = _attributeDict[rectStr];
            [array addObject:indexPath];
        }
    }
    return array;
}

#pragma mark - return all the frames for the indexPath
-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //initialize the attribute for the cell
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    for(NSString *rectStr in _attributeDict)
    {
        if(_attributeDict[rectStr] == indexPath)
        {
            //set the frame
            attributes.frame = CGRectFromString(rectStr);
        }
    }
    
    return attributes;
}

@end
