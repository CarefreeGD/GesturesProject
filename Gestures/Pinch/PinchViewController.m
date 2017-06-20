//
//  PinchViewController.m
//  Gestures
//
//  Created by guoduo on 2017/6/20.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGAffineTransform rotationTransform;
@property (nonatomic, assign) CGAffineTransform pinchTransform;

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)rotationGesture:(UIRotationGestureRecognizer *)gestureRecognizer {
    UIView *view  = [gestureRecognizer view];
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformRotate(view.transform, gestureRecognizer.rotation);
        gestureRecognizer.rotation = 0;
    }
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded || gestureRecognizer.state == UIGestureRecognizerStateFailed || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
        [UIView animateWithDuration:0.3 animations:^{
            view.transform = CGAffineTransformIdentity;
        }];
    }
}

- (IBAction)Pinch:(UIPinchGestureRecognizer *)sender {
    [self statusLog:sender log:NSStringFromClass([sender class])];
    
}
- (void)statusLog:(UIPinchGestureRecognizer *)gesture log:(NSString *)string{
    
    UIView *view = [gesture view];
    switch (gesture.state) {
            //识别器接收到触摸并识别出是它的手势时处于这个状态。响应方法将在下个循环步骤中被调用
        case UIGestureRecognizerStateBegan:
            printf("------------------------手势开始------------------------\n");
            printf("%s - Began \n",string.UTF8String);
            break;
            
        case UIGestureRecognizerStateChanged:{
            printf("%s - Changed - %f \n",string.UTF8String,gesture.scale);
            
            //扩大、缩小倍数
            view.transform = CGAffineTransformScale(view.transform,gesture.scale, gesture.scale);
            gesture.scale = 1;
            break;
        }
            
            //识别器在识别到作为当前手势结束信号的触摸时处于这个状态。响应方法将在下个循环步骤中被调用 并且 识别器将重置为possible状态
        case UIGestureRecognizerStateEnded:{
            printf("%s - Ended \n",string.UTF8String);
            [UIView animateWithDuration:0.3 animations:^{
                view.transform = CGAffineTransformIdentity;
            }];
            printf("------------------------手势正常结束---------------------\n\n");
            break;
        }
            //识别器处于取消状态.响应方法将在下个循环步骤中被调用 并且 识别器将重置为possible状态
        case UIGestureRecognizerStateCancelled:
            printf("%s - Cancelled \n",string.UTF8String);
            printf("------------------------手势取消------------------------\n\n");
            break;
            
            //识别器接收到不能识别为它的手势的一系列触摸。响应方法不会被调用 并且 识别器将重置为possible状态
        case UIGestureRecognizerStateFailed:
            printf("%s - Failed \n",string.UTF8String);
            printf("------------------------识别失败------------------------\n");
            break;
            
            //识别器未识别出手势，但可能会接收到触摸时处于这个状态。这是默认状态。
        case UIGestureRecognizerStatePossible:
            printf("%s - Possible \n",string.UTF8String);
            break;
            
        default:
            break;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {

    return YES;
}

@end
