//
//  CoreTextData.h
//  ImagespanDemo
//
//  Created by 高赛 on 2017/6/23.
//  Copyright © 2017年 高赛. All rights reserved.
//

// 用于保存由CTFrameParser类生成的CTFrameRef实例,以及CTFrameRef实际绘制需要的高度
#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import "CoreTextImgData.h"

@interface CoreTextData : NSObject

@property (nonatomic, assign) CTFrameRef ctFrame;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *linkArray;

@end
