//
//  ViewController.m
//  UIButtonExample
//
//  Created by 谭瑞东 on 2017/2/4.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//the button to display different images
@property (weak, nonatomic) IBOutlet UIButton *imageButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeImage:(UIButton *)sender {
    
    NSString *title = sender.titleLabel.text;
    if([title isEqualToString:@"选中状态"]) {
        //set the button hightlighted and enabled
        [self.imageButton setEnabled:YES];
        [self.imageButton setSelected:YES];
    } else if ([title isEqualToString:@"禁用状态"]) {
        //set the button unhightlighted and disable
        [self.imageButton setEnabled:NO];
        [self.imageButton setSelected:NO];
    } else if ([title isEqualToString:@"普通状态"]) {
        //set the button unhightlighted and enabled
        [self.imageButton setSelected:NO];
        [self.imageButton setEnabled:YES];
    }
}

@end
