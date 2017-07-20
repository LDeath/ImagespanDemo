//
//  Utils.h
//  ImagespanDemo
//
//  Created by 高赛 on 2017/6/23.
//  Copyright © 2017年 高赛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CoreTextLinkData.h"

@interface Utils : NSObject

// 检测点击位置是否在链接上
+ (CoreTextLinkData *)touchLinkInView:(UIView *)view atPoint:(CGPoint)point data:(CoreTextData *)data;

@end
