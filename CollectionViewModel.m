//
//  CollectionViewModel.m
//  SisterPicture
//
//  Created by xue on 15/12/13.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "CollectionViewModel.h"

@implementation CollectionViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.picArr0=@[@"1_1.jpg",@"1_2.jpg",@"1_3.jpg",@"1_4.jpg",@"1_5.jpg",@"1_6.jpg",@"1_7.jpg",@"1_8.jpg",@"1_9.jpg",@"1_10.jpg",@"1_11.jpg",@"1_12.jpg",@"1_13.jpg",@"1_14.jpg",@"1_15.jpg",@"1_16.jpg"];
        self.picArr1=@[@"2_1.jpg",@"2_2.jpg",@"2_3.jpg",@"2_4.jpg"];
        self.picArr2=@[@"3_1.jpg",@"3_2.jpg",@"3_3.jpg",@"3_4.jpg",@"3_5.jpg",@"3_6.jpg"];
        self.picArr3=@[@"4_1.jpg",@"4_2.jpg",@"4_3.jpg",@"4_4.jpg",@"4_5.jpg",@"4_6.jpg"];
        self.picArr4=@[@"5_1.jpg",@"5_2.jpg",@"5_3.jpg",@"5_4.jpg",@"5_5.jpg",@"5_6.jpg",@"5_7.jpg",@"5_8.jpg"];
        self.picArr5=@[@"6_1.jpg",@"6_2.jpg",@"6_3.jpg",@"6_4.jpg",@"6_5.jpg",@"6_6.jpg",@"6_7.jpg",@"6_8.jpg",@"6_9.jpg",@"6_10.jpg",@"6_11.jpg",@"6_12.jpg",@"6_13.jpg",@"6_14.jpg",@"6_15.jpg",@"6_16.jpg",@"6_17.jpg",@"6_18.jpg"];
        self.picArr6=@[@"7_1.jpg",@"7_2.jpg",@"7_3.jpg",@"7_4.jpg",@"7_5.jpg",@"7_6.jpg",@"7_7.jpg",@"7_8.jpg",@"7_9.jpg"];
        self.picArr7=@[@"8_1.jpg",@"8_2.jpg",@"8_3.jpg",@"8_4.jpg"];
        self.picData=@[self.picArr0,self.picArr1,self.picArr2,self.picArr3,self.picArr4,self.picArr5,self.picArr6,self.picArr7];
    }
    return self;
}

@end
