//
//  CustomGesture.m
//  Gestures
//
//  Created by guoduo on 2017/6/20.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "CustomGesture.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface CustomGesture()



@property (nonatomic, strong) NSMutableArray *touchesArray;
@property (nonatomic, strong) NSMutableArray *pathArray;
@property (nonatomic, strong) NSMutableArray *layerArray;



@end

@implementation CustomGesture

- (NSMutableArray *)touchesArray {
    if (!_touchesArray) {
        _touchesArray = [NSMutableArray array];
    }
    return _touchesArray;
}
- (NSMutableArray *)pathArray {
    if (!_pathArray) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}
- (NSMutableArray *)layerArray {
    if (!_layerArray) {
        _layerArray = [NSMutableArray array];
    }
    return _layerArray;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint beginPoint = [touch locationInView:self.view];
        CAShapeLayer *layer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:beginPoint];
        layer.path = path.CGPath;
        [self.view.layer addSublayer:layer];
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.strokeColor = [UIColor blackColor].CGColor;
        
        [self.touchesArray addObject:touch];
        [self.pathArray addObject:path];
        [self.layerArray addObject:layer];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        for (UITouch *beforeTouch in self.touchesArray) {
            if (touch == beforeTouch) {
                NSInteger index = [self.touchesArray indexOfObject:beforeTouch];
                
                CGPoint nowPoint = [touch locationInView:self.view];
                UIBezierPath *path = self.pathArray[index];
                CAShapeLayer *layer = self.layerArray[index];
                [path addLineToPoint:nowPoint];
                layer.path = path.CGPath;
            }
        }
    }
}


- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
}



@end
