//
//  ViewController.m
//  Gestures
//
//  Created by guoduo on 2017/6/19.
//  Copyright © 2017年 guoduo. All rights reserved.
//

#import "ViewController.h"
#import "GesturesViewController.h"
#import "GesturesTestDelegateVC.h"
#import "PanViewController.h"
#import "SwipeViewController.h"
#import "LongPressViewController.h"
#import "ScreenEdgePanViewController.h"
#import "PinchViewController.h"
#import "CustomGestureViewController.h"
#import "ScrollViewController.h"

typedef enum : NSUInteger {
    VCTypePan,
    VCTypeSwipe,
    VCTypeLongPress,
    VCTypeScreenEdgePan,
    VCTypePinch,
    VCTypeCustomGesture,
    VCTypeScrollerView,
    VCTypeCount
} VCType;


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return VCTypeCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case VCTypePan:
            cell.textLabel.text = @"Pan";
            break;
        case VCTypeSwipe:
            cell.textLabel.text = @"Swipe";
            break;
            
        case VCTypeLongPress:
            cell.textLabel.text = @"LongPress";
            break;
        
        case VCTypeScreenEdgePan:
            cell.textLabel.text = @"ScreenEdgePan";
            break;
        case VCTypePinch:
            cell.textLabel.text = @"Pinch";
            break;
            
        case VCTypeCustomGesture:
            cell.textLabel.text = @"CustomGesture";
            break;
        
        case VCTypeScrollerView:
            cell.textLabel.text = @"PanInScrollerView";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case VCTypePan:{
            PanViewController *vc = [[PanViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case VCTypeSwipe:{
            SwipeViewController *vc = [[SwipeViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case VCTypeLongPress:{
            LongPressViewController *vc = [[LongPressViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        
        case VCTypeScreenEdgePan:{
            ScreenEdgePanViewController *vc = [[ScreenEdgePanViewController alloc]init];
//            [self presentViewController:vc animated:YES completion:nil];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case VCTypePinch:{
            
            PinchViewController *vc = [[PinchViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case VCTypeCustomGesture:{
            CustomGestureViewController *vc = [[CustomGestureViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case VCTypeScrollerView:{
            ScrollViewController *vc = [[ScrollViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        default:
            break;
    }
}


@end
