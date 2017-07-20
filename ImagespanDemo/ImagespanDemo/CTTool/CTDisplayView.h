//
//  CTDisplayView.h
//  ImagespanDemo
//
//  Created by 高赛 on 2017/6/23.
//  Copyright © 2017年 高赛. All rights reserved.
//

// 持有CoreTextData类的实例,负责将CTFrameRef绘制到界面上
#import <UIKit/UIKit.h>
#import "CoreTextData.h"

@interface CTDisplayView : UIView

@property (nonatomic, strong) CoreTextData *data;

- (void)setupEvents;

@end
