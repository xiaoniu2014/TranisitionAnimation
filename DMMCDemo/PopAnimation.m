//
//  PopAnimation.m
//  TranisitionDemo0
//
//  Created by hw on 15/7/29.
//  Copyright (c) 2015年 hongw. All rights reserved.
//

#import "PopAnimation.h"
#include "BaseController.h"

@implementation PopAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    BaseController *fromVC = (BaseController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BaseController *toVC = (BaseController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    
    [containerView addSubview:toVC.view];
    [fromVC.localView removeFromSuperview];
    
    [toVC.view addSubview:fromVC.localView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toVC.localView.frame = toVC.localFrame;
    } completion:^(BOOL finished) {
        
        [toVC.localView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3f;
}

@end
