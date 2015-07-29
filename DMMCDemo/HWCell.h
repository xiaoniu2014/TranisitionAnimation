//
//  HWCell.h
//  DMMCDemo
//
//  Created by hw on 15/7/28.
//  Copyright (c) 2015年 hongw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HWCell;
@protocol HWCellDelegate <NSObject>

- (void)hwcell:(HWCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface HWCell : UICollectionViewCell
@property (strong, nonatomic) UIButton *button;
@property (assign, nonatomic) id<HWCellDelegate> delegate;
@end


