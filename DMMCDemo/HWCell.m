//
//  HWCell.m
//  DMMCDemo
//
//  Created by hw on 15/7/28.
//  Copyright (c) 2015年 hongw. All rights reserved.
//

#import "HWCell.h"


@implementation HWCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = self.bounds;
        self.button.adjustsImageWhenHighlighted = NO;
        self.button.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.button];
        [self.button addTarget:self action:@selector(buttonClickDown:) forControlEvents:UIControlEventTouchDown];
        
        [self.button addTarget:self action:@selector(buttonClickUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)buttonClickDown:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(hwcell:didSelectItemAtIndexPath:)]) {
        UICollectionView *collectionView = (UICollectionView *)self.superview;
        NSIndexPath *indexPath = [collectionView indexPathForCell:self];
        [self.delegate hwcell:self didSelectItemAtIndexPath:indexPath];
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)buttonClickUpInside:(UIButton *)sender {
    [UIView animateWithDuration:0.4 animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}



@end
