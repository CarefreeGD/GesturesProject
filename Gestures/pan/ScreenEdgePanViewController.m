//
//  ScreenEdgePanViewController.m
//  Gestures
//
//  Created by guoduo on 2017/6/20.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "ScreenEdgePanViewController.h"

@interface ScreenEdgePanViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ScreenEdgePanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)ScreenEdgePanInView:(UIScreenEdgePanGestureRecognizer *)gesture {
    //当前被触摸的view
    UIView *view = [self.view hitTest:[gesture locationInView:gesture.view]
                            withEvent:nil];
    if(UIGestureRecognizerStateBegan == gesture.state ||
       UIGestureRecognizerStateChanged == gesture.state)
    {
        CGPoint translation = [gesture translationInView:gesture.view];
        [UIView animateWithDuration:0.5 animations:^{
            view.center = CGPointMake(self.view.center.x + translation.x, view.center.y);
            NSLog(@"%@",NSStringFromCGPoint(view.center));
        }];
    }
    else//取消，失败，结束的时候返回原处
    {
        [UIView animateWithDuration:0.5 animations:^{
            view.center = CGPointMake(self.view.center.x, view.center.y);
        }];
    }
    printf("%s",__func__);
}
- (IBAction)screenEdgePanInSubView:(id)sender {
    printf("%s",__func__);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

@end
