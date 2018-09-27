//
//  LSBattery.m
//  仿苹果电池图标
//
//  Created by lsq on 2018/9/20.
//  Copyright © 2018年 jsx. All rights reserved.
//

#import "LSBattery.h"

@interface LSBattery() {
    CGFloat w;
    CGFloat lineW;
    UIView *batteryView;
    UILabel *batteryLabel;

}

@end

@implementation LSBattery


- (instancetype)init{
    if (self = [super init]) {
        [self draw];
    }
    return self;
}

- (void)draw{
    //电池的宽度
    w = 40;
    //电池的x的坐标
    CGFloat x = 0;
    //电池的y的坐标
    CGFloat y = 0;
    //电池的线宽
    lineW = 1.5;
    //电池的高度
    CGFloat h = 15;
    
    //画电池
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x, y, w, h) cornerRadius:2];
    CAShapeLayer *batteryLayer = [CAShapeLayer layer];
    batteryLayer.lineWidth = lineW;
    batteryLayer.strokeColor = [UIColor grayColor].CGColor;
    batteryLayer.fillColor = [UIColor clearColor].CGColor;
    batteryLayer.path = [path1 CGPath];
    [self.layer addSublayer:batteryLayer];
    
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    [path2 addArcWithCenter:CGPointMake(x+w+2, y+h/2)
                     radius:h/4.8
                 startAngle:M_PI*1.5
                   endAngle:M_PI*0.5
                  clockwise:YES];
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.path = [path2 CGPath];
    layer2.fillColor = [UIColor grayColor].CGColor;
    [self.layer addSublayer:layer2];

    
    //绘制进度
    batteryView = [[UIView alloc]initWithFrame:CGRectMake(x+lineW,y+lineW, 0, h-lineW*2)];
    batteryView.layer.cornerRadius = 2;
    batteryView.backgroundColor = [UIColor colorWithRed:0.324 green:0.941 blue:0.413 alpha:1.000];
    [self addSubview:batteryView];
    
    
    
}

- (void)runProgress:(NSInteger)progressValue{
    
    [UIView animateWithDuration:0.6 animations:^{
        CGRect frame = self->batteryView.frame;
        frame.size.width = (progressValue*(self->w-self->lineW*2))/100;
        self->batteryView.frame  = frame;
        
        if (progressValue < 20) {
            self->batteryView.backgroundColor = [UIColor redColor];
        }else if (progressValue >= 20 && progressValue < 30){
            self->batteryView.backgroundColor = [UIColor yellowColor];
        }else{
            self->batteryView.backgroundColor = [UIColor colorWithRed:0.324 green:0.941 blue:0.413 alpha:1.000];
        }
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
