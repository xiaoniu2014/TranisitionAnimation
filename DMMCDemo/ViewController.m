//
//  ViewController.m
//  DMMCDemo
//
//  Created by hw on 15/7/27.
//  Copyright (c) 2015年 hongw. All rights reserved.
//

#import "ViewController.h"
#import "CollectionHeader.h"
#import  "HWLayout.h"
#import "HWCell.h"
#import "SecondController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,HWCellDelegate>

@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)){
        
        self.edgesForExtendedLayout=UIRectEdgeNone;
        
        self.navigationController.navigationBar.translucent = NO;
        
        self.tabBarController.tabBar.translucent = NO;
        
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    
    
    HWLayout *layout = [[HWLayout alloc]init];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    CGFloat y = 210;
    
    CGRect frame = CGRectMake(0, y, screenW, screenH-y-64-49);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.1];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[HWCell class] forCellWithReuseIdentifier:@"CELL"];
//    [collectionView registerClass:[CollectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER"];
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HWCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.delegate = self;
    [cell.button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)indexPath.row]] forState:UIControlStateNormal];
    return cell;
}

- (void)hwcell:(HWCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return;
    }
    
    UICollectionView *collectionView = (UICollectionView *)cell.superview;
    CGRect rect = [collectionView convertRect:cell.frame toView:self.view];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:rect];
    UIImageView *image = cell.button.imageView;
    [button setImage:image.image forState:UIControlStateNormal];
    
    
    self.localView = button;
    self.localFrame = rect;
    
    
    SecondController *secondVC = [[SecondController alloc]init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    CollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER" forIndexPath:indexPath];
//    header.frame = CGRectMake(0, 0, 100, 100);
//    return header;
//}








@end
