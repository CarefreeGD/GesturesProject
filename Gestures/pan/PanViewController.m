//
//  PanViewController.m
//  Gestures
//
//  Created by guoduo on 2017/6/20.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController () <UIGestureRecognizerDelegate>

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)pan:(UIPanGestureRecognizer *)gestureRecognizer {
    UIView *view = [gestureRecognizer view]; // 这个view是手势所属的view，也就是增加手势的那个view
    
    
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
            NSLog(@"======UIGestureRecognizerStateBegan");
            break;
        }
        case UIGestureRecognizerStateChanged:{
            NSLog(@"======UIGestureRecognizerStateChanged");
            
            
            CGPoint translation = [gestureRecognizer translationInView:self.view];
            view.center = CGPointMake(gestureRecognizer.view.center.x + translation.x, gestureRecognizer.view.center.y + translation.y);
            [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];// 俩种方法，重置手势状态，保存view初始坐标值
            break;
        }
        case UIGestureRecognizerStateCancelled:{
            NSLog(@"======UIGestureRecognizerStateCancelled");
            break;
        }
        case UIGestureRecognizerStateFailed:{
            NSLog(@"======UIGestureRecognizerStateFailed");
            break;
        }
        case UIGestureRecognizerStatePossible:{
            NSLog(@"======UIGestureRecognizerStatePossible");
            break;
        }
        case UIGestureRecognizerStateEnded:{ // UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded
            
            NSLog(@"======UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized");
            
            __block CGPoint velocity = [gestureRecognizer velocityInView:self.view];// 分别得出x，y轴方向的速度向量长度（velocity代表按照当前速度，每秒可移动的像素个数，分xy轴两个方向）
            
            
            __block CGFloat coefficient = 0.997;
            
            NSTimer *timer = [NSTimer timerWithTimeInterval:0.001 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                CGFloat x = view.frame.origin.x;
                CGFloat y = view.frame.origin.y;
                
                if (x < 0 || x > [UIScreen mainScreen].bounds.size.width - view.bounds.size.width) {
                    velocity = CGPointMake(velocity.x * -1, velocity.y);
                }
                
                if (y > [UIScreen mainScreen].bounds.size.height - view.bounds.size.height || y < 0) {
                    velocity = CGPointMake(velocity.x, velocity.y * -1);
                }
                
                x += (velocity.x / 1000.0);
                y += (velocity.y / 1000.0);
                
                velocity = CGPointMake(velocity.x * coefficient, velocity.y * coefficient);
                
                if (ABS(velocity.x) < 0.01 && ABS(velocity.y) < 0.01) {
                    [timer setFireDate:[NSDate distantFuture]];
                }
                
                view.frame = CGRectMake(x, y, view.frame.size.width, view.frame.size.height);
                
            }];
            
            [timer setFireDate:[NSDate distantPast]];
            [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
            
            break;
        }
        default:{
            NSLog(@"======Unknow gestureRecognizer");
            break;
        }
    }
}

@end
