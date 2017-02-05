//
//  ViewController.m
//  UIControlsExample
//
//  Created by 谭瑞东 on 2017/2/4.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Initialize all controls states
    [self initAllControls];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeImageOpacity:(UISlider *)sender {
    
    //set image opacity
    [self setOpacity];
}

- (IBAction)setSliderAvailability:(UISwitch *)sender {
    
    //set slider availability
    [self setAvailability];
}

//Function to initialize all controls states
- (void) initAllControls{
    
    //initialize image opacity
    [self setOpacity];
    //initialize slider availability
    [self setAvailability];
}

//Function to set image opacity
- (void) setOpacity{
    
    float opacity = self.mySlider.value;
    
    //here we need to map [1,99] to [0,1]
    self.myImage.alpha = (opacity - 1)/99;
}

//Function to set slider availability
- (void) setAvailability{
    
    if(self.mySwitch.isOn){
        self.mySlider.enabled = YES;
    } else {
        self.mySlider.enabled = NO;
    }
}

@end
