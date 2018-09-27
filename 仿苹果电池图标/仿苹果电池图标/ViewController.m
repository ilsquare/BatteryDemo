//
//  ViewController.m
//  仿苹果电池图标
//
//  Created by 赖双全 on 2018/9/27.
//  Copyright © 2018 lsq. All rights reserved.
//

#import "ViewController.h"
#import "LSBattery.h"

@interface ViewController ()
@property (nonatomic, strong) LSBattery *batteryView;     // 电池图标

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    self.batteryView = [[LSBattery alloc] init];
    [self.view addSubview:self.batteryView];
    self.batteryView.frame = CGRectMake(20, 15, 40, 15);
    self.batteryView.center = self.view.center;
    [self.batteryView runProgress:19];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((self.view.frame.size.width-40)/2, self.view.frame.size.height-20-100, 40, 20);
    [button setTitle:@"点击" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];

}

- (void)action:(UIButton*)sender{
    float value = arc4random()%+100;
    [self.batteryView runProgress:value];
    
}




@end
