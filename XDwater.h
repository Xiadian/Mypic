//
//  XDwater.h
//  东林女神
//
//  Created by XiaDian on 16/1/28.
//  Copyright © 2016年 xd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDwater : UICollectionViewLayout
@property (nonatomic, assign) id<UICollectionViewDelegateFlowLayout> delegate;
@property (nonatomic, assign) NSInteger cellCount;//cell的个数
@property (nonatomic, strong) NSMutableArray *colArr;//存放列的高度
@property (nonatomic, strong) NSMutableDictionary *attributeDict;//存放cell的位置信息

@end
