//
//  ViewController.m
//  Calculator
//
//  Created by 谭瑞东 on 2017/2/4.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//Text Field control to input the first number
@property (weak, nonatomic) IBOutlet UITextField *firstNumberInput;
//Text Field control to input the second number
@property (weak, nonatomic) IBOutlet UITextField *senondNumberInput;
//Label control to display the calculated result
@property (weak, nonatomic) IBOutlet UILabel *resultOutput;

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

//Function to do the add, minus, multiply and divide operations
- (IBAction)doCalculation:(UIButton *)sender {
    //Get the two input numbers
    NSString *firstNumberString = self.firstNumberInput.text;
    NSString *secondNumberString = self.senondNumberInput.text;
    
    //check if user inputs two numbers
    if(([firstNumberString isEqualToString:@""]) || ([secondNumberString isEqualToString:@""])){
        self.resultOutput.text = @"请输入两个数字用于计算";
        return;
    }
    
    float fResult = 0.0;
    switch (sender.tag) {
        case 10:
            //Add
            fResult = [firstNumberString floatValue] + [secondNumberString floatValue];
            break;
        case 20:
            //Minus
            fResult = [firstNumberString floatValue] - [secondNumberString floatValue];
            break;
        case 30:
            //Multiply
            fResult = [firstNumberString floatValue] * [secondNumberString floatValue];
            break;
        case 40:
            //Divide
            //Since the "0" does not always exactly equals to "0" in memory, we compare with 1e-6
            if(([secondNumberString floatValue] > -1e-6) && ([secondNumberString floatValue] < 1e-6)){
                self.resultOutput.text = @"除数不能为零";
                return;
            } else {
                fResult = [firstNumberString floatValue] / [secondNumberString floatValue];
            }
            break;
        default:
            break;
    }
    
    //Display the result
    self.resultOutput.text = [NSString stringWithFormat:@"%.2f", fResult];
}

@end
