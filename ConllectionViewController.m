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
#import "CollectionViewCell.h"
#import "XDwater.h"
#define SCreenWidth  [UIScreen mainScreen].bounds.size.width
#define SCreenHeight [UIScreen mainScreen].bounds.size.height

@interface ConllectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
   
    NSMutableArray *_arrHeight;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *collectionData;
@end

@implementation ConllectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrHeight=[[NSMutableArray alloc]init];
    self.navigationItem.title=@"相册";
    CollectionViewModel *model=[CollectionViewModel new];
    self.collectionData=model.picData[self.dataIndex];
    // Do any additional setup after loading the view from its nib.
     XDwater * flowLayout = [[XDwater alloc]init];
    self.collectionView.collectionViewLayout=flowLayout;
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"xd"];
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
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"xd" forIndexPath:indexPath];
    cell.image.userInteractionEnabled=YES;
    cell.image.image=[UIImage imageNamed:self.collectionData[indexPath.row]];
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
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *image=[UIImage imageNamed:self.collectionData[indexPath.row]];
//    [_arrHeight addObject:@((image.size.height*(collectionView.bounds.size.width/2.0))/image.size.width)];
    return CGSizeMake(SCreenWidth/2.0,(image.size.height*(collectionView.bounds.size.width/2.0))/image.size.width);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2,2,2,2);
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
