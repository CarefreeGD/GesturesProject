//
//  SwipeViewController.m
//  Gestures
//
//  Created by guoduo on 2017/6/20.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipe;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swipe.direction =  UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionLeft ;
    
    self.swipe.direction = UISwipeGestureRecognizerDirectionDown;
    
}
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"%@",sender);
}
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
