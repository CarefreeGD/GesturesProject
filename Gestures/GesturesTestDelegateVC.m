//
//  GesturesTestDelegateVC.m
//  Gestures
//
//  Created by guoduo on 2017/6/19.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "GesturesTestDelegateVC.h"

@interface GesturesTestDelegateVC ()
@property (weak, nonatomic) IBOutlet UIView *A;
@property (weak, nonatomic) IBOutlet UIView *B;
@property (weak, nonatomic) IBOutlet UIView *C;
@property (weak, nonatomic) IBOutlet UIView *D;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapInVC;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapInViewC;

@end

@implementation GesturesTestDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self.tapInViewC requireGestureRecognizerToFail:self.tapInVC]; //当代理方法与该方法同时实现，该方法有效
}

- (IBAction)tapInViewA:(id)sender {
    
    printf("%s \n",__func__);
}

- (IBAction)tapInViewB:(id)sender {
    
    printf("%s \n",__func__);
}

- (IBAction)tapInViewD:(id)sender {
    
    printf("%s \n",__func__);
}

- (IBAction)tapInViewC:(id)sender {
    
    printf("%s \n",__func__);
}
- (IBAction)tapInVCView:(id)sender {
    printf("%s \n",__func__);
}

- (IBAction)panInDView:(id)sender {
    printf("%s \n",__func__);
}
- (IBAction)panInAView:(id)sender {
    printf("%s \n",__func__);
}
- (IBAction)panInBView:(id)sender {
    printf("%s \n",__func__);
}
- (IBAction)swipeInBView:(id)sender {
    printf("%s \n",__func__);
}


//开始进行手势识别时调用的方法，返回NO则结束识别，不再触发手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    if (gestureRecognizer.view == self.view) {
//        gestureRecognizer.view.userInteractionEnabled = YES;
//        return NO;
//    }
    if (gestureRecognizer == self.tapInViewC) {
        return NO;
    }
    return YES;
}

//是否支持多手势触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥 是否允许多个手势识别器共同识别，一个控件的手势识别后是否阻断手势识别继续向下传播，默认返回NO；如果为YES，响应者链上层对象触发手势识别后，如果下层对象也添加了手势并成功识别也会继续执行，否则上层对象识别后则不再继续传播
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return NO;
    //返回YES 不设置优先级的情况下，俩个或多个冲突的手势会同时执行,且其下层视图相同手势会全部执行，设置优先级按照优先级执行
    
    /** 返回NO pan 与 swipe ，swipe在屏幕手指接触时间很短情况下发生
     longPress 与 pan ， 默认情况，移动范围不超过allowableMovement属性值，满足前置点按次数，满足前置时间，则为longPress，超过范围立即调用Pan，或当不满足numberOfTapsRequired属性时，发生移动则调用pan。
     */
}

// 这个方法返回YES，第一个手势和第二个互斥时，第一个会失效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0) {
    if(gestureRecognizer == self.tapInVC && otherGestureRecognizer == self.tapInViewC) {
        return YES;
    }
    return NO;
    
}

//-----俩个方法解决同一个冲突，↑ 方法有效 （当↑ 方法返回yes时，同一个冲突不再走↓ 方法）


//这个方法返回YES，第一个和第二个互斥时，第二个会失效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0) {
    if(gestureRecognizer == self.tapInVC && otherGestureRecognizer == self.tapInViewC) {
        return YES;
    }
    return NO;
}

//手指触摸屏幕后回调的方法，返回NO则不再进行手势识别，方法触发等 此方法在window对象在有触摸事件发生时，调用gesture recognizer的touchesBegan:withEvent:方法之前调用，如果返回NO,则gesture recognizer不会看到此触摸事件。(默认情况下为YES)
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (gestureRecognizer == self.tapInVC) {
        return YES;
    }
    return YES;
}

@end
