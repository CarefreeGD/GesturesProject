//
//  ScrollViewController.m
//  Gestures
//
//  Created by guoduo on 2017/6/20.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pan;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 3003);
    
    NSLog(@"%@\n%@",self.scrollView.gestureRecognizers,self.scrollView.gestureRecognizers.lastObject.superclass);
    [self.pan requireGestureRecognizerToFail:self.scrollView.gestureRecognizers.lastObject];
}

- (void)didClickButton:(UIButton *)button {
    
}
- (IBAction)pan:(id)sender {
    
    printf("%s %s \n" , __func__ , [[NSDate date].description substringWithRange:NSMakeRange(11, 8)].UTF8String);
}



@end
