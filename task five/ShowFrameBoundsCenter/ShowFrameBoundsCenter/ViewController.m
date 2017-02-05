//
//  ViewController.m
//  ShowFrameBoundsCenter
//
//  Created by 谭瑞东 on 2017/2/4.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//five views
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Display the frame, bounds and center of green view
    [self printView:self.greenView viewName:@"greenView"];
    
    //Display the frame, bounds and center of blue view
    [self printView:self.blueView viewName:@"blueView"];
    
    //Display the frame, bounds and center of red view
    [self printView:self.redView viewName:@"redView"];
    
    //Display the frame, bounds and center of white view
    [self printView:self.whiteView viewName:@"whiteView"];
    
    //Display the frame bounds and center of yellow view
    [self printView:self.yellowView viewName:@"yellowView"];
}

//Function to display the frame, bounds and center of the given view
- (void)printView:(UIView *) view viewName:(NSString *) name{
    NSLog(@"%@:\nframe = %@\nbounds = %@\ncenter = %@\n", name, NSStringFromCGRect(view.frame),NSStringFromCGRect(view.bounds),NSStringFromCGPoint(view.center));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
