//
//  HWLayout.h
//  DMMCDemo
//
//  Created by hw on 15/7/28.
//  Copyright (c) 2015年 hongw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWLayout : UICollectionViewLayout

@property (nonatomic, assign) NSInteger cellCount;

@property (nonatomic, assign) CGFloat edge;
@property (nonatomic, assign) CGFloat space;


@property (nonatomic, assign) CGFloat minHeight;
@property (nonatomic, assign) CGFloat minWidth;

@end
