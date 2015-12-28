//
//  ConllectionViewController.m
//  SisterPicture
//
//  Created by xue on 15/12/13.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "ConllectionViewController.h"
#import "CollectionViewModel.h"
#import "PicDetailViewController.h"
@interface ConllectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *collectionData;
@end

@implementation ConllectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"相册";
    CollectionViewModel *model=[CollectionViewModel new];
    self.collectionData=model.picData[self.dataIndex];
    // Do any additional setup after loading the view from its nib.
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"xd"];
#pragma mark 添加返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 64, 44);
    [backBtn setTitle:@"<返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark collectionView 部分
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"xd" forIndexPath:indexPath];
    UIImageView *image=[[UIImageView alloc]initWithFrame:cell.contentView.frame];
    image.userInteractionEnabled=YES;
    image.image=[UIImage imageNamed:self.collectionData[indexPath.row]];
    [cell.contentView addSubview:image];
    return cell;
}
/**
 *  选中cell触发事件
 *
 *  @param collectionView <#collectionView description#>
 *  @param indexPath      <#indexPath description#>
 */
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PicDetailViewController *p=[PicDetailViewController new];
    p.picData=self.collectionData;
    p.row=indexPath.row;
    [self.navigationController pushViewController:p animated:YES];


}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.collectionData.count;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 20);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.bounds.size.width/2-30, 100);
}
/**
 *  返回按钮事件
 *
 *  @param sender <#sender description#>
 */
-(void)doBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
