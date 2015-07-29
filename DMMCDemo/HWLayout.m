//
//  HWLayout.m
//  DMMCDemo
//
//  Created by hw on 15/7/28.
//  Copyright (c) 2015年 hongw. All rights reserved.
//

#import "HWLayout.h"

@implementation HWLayout

-(void)prepareLayout
{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    NSLog(@"===%@",NSStringFromCGSize(size));
    
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    
    _edge = 10;
    _space = 5;
    
    _minHeight = (size.height - 2*_edge - 2*_space)/5.0f;
    _minWidth = (size.width - 2*_edge - _space)/3.0f;
}

-(CGSize)collectionViewContentSize
{
    return [self collectionView].frame.size;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    
    switch (path.row) {
        case 0:
        {
            attributes.frame = CGRectMake(_edge, _edge, _minWidth*2, _minHeight*2);
        }
            break;
        case 1:
        {
            CGFloat x = _edge + _space + _minWidth*2;
            attributes.frame = CGRectMake(x, _edge, _minWidth, _minHeight);
        }
            break;
        case 2:
        {
            CGFloat x = _edge + _space + _minWidth*2;
            CGFloat y = _edge + _space + _minHeight;
            attributes.frame = CGRectMake(x, y, _minWidth, _minHeight*2);
        }
            break;
        case 3:
        {
            CGFloat x = _edge;
            CGFloat y = _edge + _space + _minHeight*2;
            attributes.frame = CGRectMake(x, y, _minWidth*2, _minHeight);
        }
            break;
        case 4:
        {
            CGFloat x = _edge;
            CGFloat y = _edge + _space*2 + _minHeight*3;
            attributes.frame = CGRectMake(x, y, _minWidth, _minHeight*2);
        }
            break;
        case 5:
        {
            CGFloat x = _edge + _space + _minWidth;
            CGFloat y = _edge + _space*2 + _minHeight*3;
            attributes.frame = CGRectMake(x, y, _minWidth*2, _minHeight*2);
        }
            break;
            
        default:
            break;
    }
    
    return attributes;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i=0 ; i < self.cellCount; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

@end
