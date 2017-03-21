//
//  ViewController.m
//  MeiTuan
//
//  Created by 谭瑞东 on 2017/3/8.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"
#import "ShopCell.h"
#import "Shop.h"

@interface ViewController ()<UITableViewDataSource>

//UITableView to list the shops
@property(nonatomic, strong)UITableView *tblView;
//shop model array from plist
@property(nonatomic,copy)NSArray *shopArray;

@end

@implementation ViewController

#pragma mark Lazy initialization of shop array from plist
-(NSArray*)shopArray{
    
    if(!_shopArray){
        
        //get plist with given path
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"shops.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:plistPath];
        
        //convert all the shops from dictionary to model
        NSMutableArray* shops = [NSMutableArray array];
        
        for(NSDictionary* dict in arr)
        {
            Shop* model = [Shop ShopWithDict:dict];
            [shops addObject:model];
        }
        _shopArray = shops;
    }
    
    return _shopArray;
}

#pragma mark Lazy initialization of UITableView
-(UITableView*)tblView
{
    if(!_tblView){
        
        _tblView = [[UITableView alloc] initWithFrame:self.view.frame];
        _tblView.dataSource = self;
        
        [self.view addSubview:_tblView];
    }

    return _tblView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //trigger UITableView initialization
    [self tblView];
    
    //trigger to load shop models
    [self shopArray];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.shopArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //create the shop cell
    return [ShopCell tableView:tableView cellForRowAtIndexPath:indexPath AndId:@"cellResource" AndPath:@"ShopCell" AndModel:self.shopArray[indexPath.row]];
}

-(BOOL)prefersStatusBarHidden{
    //hide status bar
    return YES;
}

@end
