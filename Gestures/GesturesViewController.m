//
//  GesturesViewController.m
//  Gestures
//
//  Created by guoduo on 2017/6/19.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "GesturesViewController.h"

@interface GesturesViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pan;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPress;

@end

@implementation GesturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //解决在图片上滑动时拖动手势和轻扫手势的冲突
    [self.pan requireGestureRecognizerToFail:self.swipeDown];
    
    
    
    //解决拖动和长按手势之间的冲突
    
//    self.longPress.minimumPressDuration = 2;
    
//    self.longPress.numberOfTapsRequired = 2;//该属性规定当2次点击，第二次点击不放开时，符合条件，触发longPress
    
//    self.longPress.allowableMovement = 100.f;//该属性的作用是在begin调用前，你可以移动的范围，超出范围，不调用longPress
    
//    [self.longPress requireGestureRecognizerToFail:self.pan];//会以是否移动进行区分（移动：pan）。不移动情况下，放手后调用begin，end ps:正常情况下，以minimumPressDuration属性决定begin开始调用
    
//    [self.pan requireGestureRecognizerToFail:self.longPress];//默认情况，移动范围不超过allowableMovement属性值，满足前置点按次数，满足前置时间，则为longPress，超过范围立即调用Pan，或当不满足numberOfTapsRequired属性时，发生移动则调用pan
    
    
    
    //问题 双击，调用三次 模拟器不为焦点时，加俩次点击，调用三次，模拟器为焦点时，正常调用
    
}

- (IBAction)gestureRecognizer:(id)sender {
    [self statusLog:sender log:NSStringFromClass([sender class])];
}

- (IBAction)swipeGestureRecognizerRight:(id)sender {
    [self statusLog:sender log:[NSStringFromClass([sender class]) stringByAppendingString:@"- Right"]];
}

- (IBAction)swipeGestureRecognizerLeft:(id)sender {
    [self statusLog:sender log:[NSStringFromClass([sender class]) stringByAppendingString:@"- Left"]];
}

- (IBAction)swipeGestureRecognizerDown:(id)sender {
    [self statusLog:sender log:[NSStringFromClass([sender class]) stringByAppendingString:@"- Down"]];
}

- (IBAction)swipeGestureRecognizerUp:(id)sender {
    [self statusLog:sender log:[NSStringFromClass([sender class]) stringByAppendingString:@"- Up"]];
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

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
    
    //返回YES 不设置优先级的情况下，俩个或多个冲突的手势会同时执行，设置优先级按照优先级执行
    
    /** 返回NO pan 与 swipe ，swipe在屏幕手指接触时间很短情况下发生
     longPress 与 pan ， 默认情况，移动范围不超过allowableMovement属性值，满足前置点按次数，满足前置时间，则为longPress，超过范围立即调用Pan，或当不满足numberOfTapsRequired属性时，发生移动则调用pan。
     */
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {//实现该方法时，tap点击target会调用begin状态
//    
//    printf("--------gestureRecognizer----------------手势开始------------------------\n");
//    printf("%s - Began \n",NSStringFromClass([gestureRecognizer class]).UTF8String);
//    return YES;// 手势开始方法 在手势 target 方法之前调用，返回NO时，target 方法不调用，手势状态为UIGestureRecognizerStatePossible
//}


- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
