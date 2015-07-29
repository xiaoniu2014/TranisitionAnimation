//
//  PushAnimation.m
//  TranisitionDemo0
//
//  Created by hw on 15/7/29.
//  Copyright (c) 2015年 hongw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PushAnimation.h"
#import "BaseController.h"

@implementation PushAnimation


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    BaseController *fromVC = (BaseController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BaseController *toVC = (BaseController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    toVC.localView = fromVC.localView;
    [toVC.view addSubview:toVC.localView];
    [UIView animateWithDuration:duration animations:^{
        toVC.localView.center = toVC.view.center;
//        toVC.localView.bounds = CGRectMake(0, 0, 200, 200);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
//            toVC.localView.bounds = CGRectMake(0, 0, 200, 200);
        }];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3f;
}


@end
