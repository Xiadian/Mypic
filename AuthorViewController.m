//
//  AuthorViewController.m
//  SisterPicture
//
//  Created by xue on 15/12/14.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "AuthorViewController.h"

@interface AuthorViewController ()
@property (weak, nonatomic) IBOutlet UITextView *midText;

@end

@implementation AuthorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor grayColor];
    self.midText.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.01];
    //NSLog(@"%@",[UIFont familyNames]);
    self.midText.font=[UIFont fontWithName:@"Bradley Hand" size:15];
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
