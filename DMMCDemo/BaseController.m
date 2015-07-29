//
//  BaseController.m
//  TranisitionDemo0
//
//  Created by hw on 15/7/29.
//  Copyright (c) 2015年 hongw. All rights reserved.
//

#import "BaseController.h"
#import "PushAnimation.h"
#import "PopAnimation.h"

@interface BaseController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) PushAnimation *pushAnimation;
@property (nonatomic, strong) PopAnimation *popAnimation;
@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pushAnimation = [[PushAnimation alloc]init];
    self.popAnimation = [[PopAnimation alloc]init];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimation;
    }else {
        return self.popAnimation;
    }
    return nil;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
