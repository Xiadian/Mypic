//
//  PicDetailViewController.m
//  SisterPicture
//
//  Created by xue on 15/12/13.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "PicDetailViewController.h"

@interface PicDetailViewController ()
{
    UIImageView *_imag;
}
@end

@implementation PicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    [self creatUI];
    UISwipeGestureRecognizer *swl=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipel:)];
    swl.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swl];
    UISwipeGestureRecognizer *swr=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiper:)];
    swr.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swr];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapview:)];
    [self.view addGestureRecognizer:tap];
#pragma mark 添加返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 88, 44);
    [backBtn setTitle:@"<返回相册" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
}
-(void)tapview:(UITapGestureRecognizer *)tap{
    if ( self.navigationController.navigationBar.hidden==NO) {
        self.navigationController.navigationBar.hidden=YES;
    }
    else{
        self.navigationController.navigationBar.hidden=NO;
    }
}
-(void)creatUI{
    
    _imag=[[UIImageView alloc]initWithFrame:self.view.frame];
    _imag.backgroundColor=[UIColor blackColor];
    _imag.image=[UIImage imageNamed:self.picData[self.row]];
    _imag.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imag];
}
-(void)swipel:(UISwipeGestureRecognizer *)swipe{
    self.row-=1;
    if (self.row<0) {
        self.row=self.picData.count-1;
    }
    
   _imag.image=[UIImage imageNamed:self.picData[self.row]];
    CATransition *ca=[[CATransition alloc]init];
    ca.duration=1;
    ca.type=@"pageCurl";
    ca.subtype=@"fromRight";
    [_imag.layer addAnimation:ca forKey:nil];
     _imag.contentMode=UIViewContentModeScaleAspectFit;
}
-(void)swiper:(UISwipeGestureRecognizer *)swipe{
    self.row+=1;
    if (self.row>self.picData.count-1) {
        self.row=0;
    }
    _imag.image=[UIImage imageNamed:self.picData[self.row]];
    CATransition *ca=[[CATransition alloc]init];
    ca.duration=1;
    ca.type=@"pageCurl";
    ca.subtype=@"fromLeft";
    [_imag.layer addAnimation:ca forKey:nil];
     _imag.contentMode=UIViewContentModeScaleAspectFit;

}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
