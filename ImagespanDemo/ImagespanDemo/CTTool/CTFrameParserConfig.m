//
//  CTFrameParserConfig.m
//  ImagespanDemo
//
//  Created by 高赛 on 2017/6/23.
//  Copyright © 2017年 高赛. All rights reserved.
//

// 用于配置绘制的参数,例如文字颜色,大小,行间距等
#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        _width = 200.f;
        _fontSize = 16.0f;
        _lineSpace = 8.0f;
        _textColor = RGB(108, 108, 108);
    }
    return self;
}

@end
