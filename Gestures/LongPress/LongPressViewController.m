//
//  LongPressViewController.m
//  Gestures
//
//  Created by guoduo on 2017/6/20.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()

@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPress;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap;

@end

@implementation LongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //解决拖动和长按手势之间的冲突

    self.longPress.minimumPressDuration = 2;

    self.longPress.numberOfTapsRequired = 2;//该属性规定当2次点击，第二次点击不放开时，符合条件，触发longPress

    self.longPress.allowableMovement = 100.f;//该属性的作用是在begin调用前，你可以移动的范围，超出范围，不调用longPress
    
    self.tap.numberOfTapsRequired = 2;//点击几次触发tap
    
}


- (IBAction)gestureRecognizer:(id)sender {
    [self statusLog:sender log:NSStringFromClass([sender class])];
}

- (void)statusLog:(UIGestureRecognizer *)gesture log:(NSString *)string{
    
    switch (gesture.state) {
            //识别器接收到触摸并识别出是它的手势时处于这个状态。响应方法将在下个循环步骤中被调用
        case UIGestureRecognizerStateBegan:
            printf("------------------------手势开始------------------------\n");
            printf("%s - Began \n",string.UTF8String);
            break;
            
        case UIGestureRecognizerStateChanged:
            printf("%s - Changed \n",string.UTF8String);
            break;
            
            //识别器在识别到作为当前手势结束信号的触摸时处于这个状态。响应方法将在下个循环步骤中被调用 并且 识别器将重置为possible状态
        case UIGestureRecognizerStateEnded:
            printf("%s - Ended \n",string.UTF8String);
            printf("------------------------手势正常结束---------------------\n\n");
            break;
            
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


@end
