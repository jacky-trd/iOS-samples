//
//  ViewController.m
//  AutoLayoutByCoding
//
//  Created by 谭瑞东 on 2017/2/16.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create the red view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    //create the green view
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    //create the cyan view
    UIView *cyanView = [[UIView alloc] init];
    cyanView.backgroundColor = [UIColor cyanColor];
    [redView addSubview:cyanView];
    
    //disable the auto size
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    cyanView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //the horizontal constraint of red view and green view
    //1,margin left and right are 20
    //2,same width
    //3,top and bottom alignment
    NSArray *hConstraintBetweenRedAndGreen = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-20-[greenView(==redView)]-20-|" options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:nil views:@{@"redView":redView, @"greenView":greenView}];
    [self.view addConstraints:hConstraintBetweenRedAndGreen];
    
    //the vertical constraint of red view
    //1,margin top is 40
    //2,height is 200
    NSArray *vConstraintOfRed = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[redView(200)]" options:0 metrics:nil views:@{@"redView":redView}];
    [self.view addConstraints:vConstraintOfRed];
    
    //the horizontal constraint of cyan view
    //1,margin left is 0
    NSArray *hConstraintOfCyan = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cyanView]" options:0 metrics:nil views:@{@"cyanView":cyanView}];
    [redView addConstraints:hConstraintOfCyan];
    
    //the vertical constraint of cyan view
    //1,margin top is 0
    NSArray *vConstraintOfCyan = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[cyanView]" options:0 metrics:nil views:@{@"cyanView":cyanView}];
    [redView addConstraints:vConstraintOfCyan];
    
    //the width constraint of cyan view
    //1,width is half of red view
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:cyanView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [redView addConstraint:widthConstraint];
    
    //the height constraint of cyan view
    //1,height is half of the red view
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:cyanView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    [redView addConstraint:heightConstraint];
}

@end
