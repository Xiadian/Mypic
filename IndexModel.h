//
//  IndexModel.h
//  SisterPicture
//
//  Created by xue on 15/12/12.
//  Copyright © 2015年 xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndexModel : NSObject
//顶部视图的image数组
@property(nonatomic,strong)NSArray *topPicviewArr;
//picke标题数组
@property(nonatomic,strong)NSArray *pickerTitleArr;
//midLabel中的文字
@property(nonatomic,strong)NSArray *midLableText;
@end
