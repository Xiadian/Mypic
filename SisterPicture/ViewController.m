//
//  ViewController.m
//  SisterPicture
//
//  Created by xue on 15/12/12.
//  Copyright © 2015年 xue. All rights reserved.
//
#import "ViewController.h"
#import "IndexModel.h"
#import "ConllectionViewController.h"
#import "AuthorViewController.h"
@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *alphaView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *midImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property(nonatomic,strong) NSArray *topImageArr;
@property(nonatomic,strong) NSArray *pickerTitleArr;
@property(nonatomic,strong) NSArray *midLabelTextArr;
@property(nonatomic,assign) NSInteger imageIndex;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *textLab;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *starVIew;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.hidden=YES;
    // Do any additional setup after loading the view, typically from a nib.
    //背景不让影响透明度
    self.navigationItem.title=@"东林女神";
    self.alphaView.backgroundColor=[[UIColor whiteColor]colorWithAlphaComponent:0.2];
     self.textView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.4];
    UIImage *image1=[UIImage imageNamed:@"mmexport1449619069569_meitu_1.png"];
    UIImage *image2=[UIImage imageNamed:@"meitu_1_meitu_1.jpg"];
    NSArray *starArr=@[image1,image2];
    self.starVIew.animationImages=starArr;
    self.starVIew.animationDuration=1;
    self.starVIew.animationRepeatCount=0;
    [self.starVIew startAnimating];
    self.textView.layer.cornerRadius=10;
    self.textView.layer.masksToBounds = YES;
    //获取本页面数据模型
    IndexModel *topimageModel=[IndexModel new];
    self.topImageArr=topimageModel.topPicviewArr;
    self.pickerTitleArr=topimageModel.pickerTitleArr;
    self.midLabelTextArr=topimageModel.midLableText;
    //中间图片的下角
    self.imageIndex=0;
    /**
     *  设置topview相关
     */
    [self topView];
    /**
     *  picker相关
     */
    [self pickView];
    /**
     *  中间lable相关
     */
    [self midlabel];
    [self authorView];
}
#pragma mark topview
-(void)topView{
    [self readyImage];
    UISwipeGestureRecognizer *swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.midImageView addGestureRecognizer:swipeleft];
    UISwipeGestureRecognizer *swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.midImageView addGestureRecognizer:swiperight];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPic:)];
    [self.midImageView addGestureRecognizer:tap];
}
-(void)readyImage{
    self.leftImageView.image=[UIImage imageNamed:self.topImageArr[7]];
    self.midImageView.image=[UIImage imageNamed:self.topImageArr[0]];
    self.rightImageView.image=[UIImage imageNamed:self.topImageArr[1]];
    self.midImageView.userInteractionEnabled=YES;
}
-(void)swipeleft:(UISwipeGestureRecognizer *)swipe{
    self.imageIndex++;
    if (self.imageIndex>7) {
        self.imageIndex=0;
    }
    NSInteger rightindex=self.imageIndex+1;
    if (rightindex>7) {
        rightindex=0;
    }
    NSInteger leftindex=self.imageIndex-1;
    if (leftindex<0) {
        leftindex=7;
    }
    CATransition *ca=[[CATransition alloc]init];
    ca.duration=1;
    ca.type=@"Push";
    ca.subtype=@"fromRight";
    [self.pickerView selectRow:self.imageIndex inComponent:0 animated:YES];
    [self.midImageView.layer addAnimation:ca forKey:nil];
    [self.leftImageView.layer addAnimation:ca forKey:nil];
    [self.rightImageView.layer addAnimation:ca forKey:nil];
    self.leftImageView.image=[UIImage imageNamed:self.topImageArr[leftindex]];
    self.midImageView.image=[UIImage imageNamed:self.topImageArr[self.imageIndex]];
    self.rightImageView.image=[UIImage imageNamed:self.topImageArr[rightindex]];
    self.textView.attributedText=[[NSAttributedString alloc]initWithString:self.midLabelTextArr[self.imageIndex]attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:16]}];
}
-(void)swiperight:(UISwipeGestureRecognizer *)swipe{
    self.imageIndex--;
    if (self.imageIndex<0) {
        self.imageIndex=7;
    }
    NSInteger rightindex=self.imageIndex-1;
    if (rightindex<0) {
        rightindex=7;
    }
    NSInteger leftindex=self.imageIndex+1;
    if (leftindex>7) {
        leftindex=0;
    }
    CATransition *ca=[[CATransition alloc]init];
    ca.duration=1;
    ca.type=@"Push";
    ca.subtype=@"fromRight";
    [self.pickerView selectRow:self.imageIndex inComponent:0 animated:YES];
    [self.midImageView.layer addAnimation:ca forKey:nil];
    [self.leftImageView.layer addAnimation:ca forKey:nil];
    [self.rightImageView.layer addAnimation:ca forKey:nil];
    self.leftImageView.image=[UIImage imageNamed:self.topImageArr[leftindex]];
    self.midImageView.image=[UIImage imageNamed:self.topImageArr[self.imageIndex]];
    self.rightImageView.image=[UIImage imageNamed:self.topImageArr[rightindex]];
    self.textView.attributedText=[[NSAttributedString alloc]initWithString:self.midLabelTextArr[self.imageIndex]attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:16]}];
}
-(void)tapPic:(UITapGestureRecognizer *)tap{
    ConllectionViewController *con=[ConllectionViewController new];
    con.dataIndex=self.imageIndex;
    UILabel *latitle=[[UILabel alloc]init];
    latitle.bounds=CGRectMake(0, 0,40, 50);
    latitle.attributedText=[[NSAttributedString alloc]initWithString:@"相册" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    con.navigationItem.titleView=latitle;
    [self.navigationController pushViewController:con animated:YES];
}
#pragma mark picker部分
-(void)pickView{
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
    self.pickerView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.4];
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return self.pickerTitleArr.count;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSAttributedString *title=[[NSAttributedString alloc]initWithString:self.pickerTitleArr[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    return title;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSInteger rightindex=row+1;
    if (rightindex>7) {
        rightindex=0;
    }
    NSInteger leftindex=row-1;
    if (leftindex<0) {
        leftindex=7;
    }
    CATransition *ca=[[CATransition alloc]init];
    ca.duration=1;
    ca.type=@"Push";
    ca.subtype=@"fromRight";
    [self.midImageView.layer addAnimation:ca forKey:nil];
    [self.leftImageView.layer addAnimation:ca forKey:nil];
    [self.rightImageView.layer addAnimation:ca forKey:nil];
    self.leftImageView.image=[UIImage imageNamed:self.topImageArr[leftindex]];
    self.midImageView.image=[UIImage imageNamed:self.topImageArr[row]];
    self.rightImageView.image=[UIImage imageNamed:self.topImageArr[rightindex]];
    self.textView.attributedText=[[NSAttributedString alloc]initWithString:self.midLabelTextArr[row]attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    self.imageIndex=row;
}
#pragma mark 中间lable文字
-(void)midlabel{
    self.textView.attributedText=[[NSAttributedString alloc]initWithString:self.midLabelTextArr[0] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:16]}] ;
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)authorView{
    self.starVIew.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapStar:)];
    [self.starVIew addGestureRecognizer:tap];
}
-(void)tapStar:(UITapGestureRecognizer *)tap{
    AuthorViewController *author=[AuthorViewController new];
    author.navigationItem.title=@"作者详情";
    [self.navigationController pushViewController:author animated:YES];
}
@end
