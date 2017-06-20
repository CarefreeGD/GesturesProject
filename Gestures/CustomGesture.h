//
//  CustomGesture.h
//  Gestures
//
//  Created by guoduo on 2017/6/20.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    DirectionUnknown = 0,
    DirectionLeft,
    DirectionRight
} Direction;

@interface CustomGesture : UIGestureRecognizer

@property (assign) int tickleCount;
@property (assign) CGPoint curTickleStart;
@property (assign) Direction lastDirection;
@end
