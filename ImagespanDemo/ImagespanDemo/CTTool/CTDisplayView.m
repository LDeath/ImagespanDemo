//
//  CTDisplayView.m
//  ImagespanDemo
//
//  Created by 高赛 on 2017/6/23.
//  Copyright © 2017年 高赛. All rights reserved.
//

#import "CTDisplayView.h"
#import <CoreText/CoreText.h>
#import "CoreTextImgData.h"
#import "CoreTextLinkData.h"
#import "Utils.h"

@interface CTDisplayView ()<UIGestureRecognizerDelegate>

@end

@implementation CTDisplayView

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    // 步骤1 获取到当前绘制画布的上下文,用于后续将内容绘制在画布上
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 步骤2  将坐标系进行上下翻转.对于底层的绘制引擎来说,屏幕的左下角是(0,0)坐标.而对于上层的UIKit来说,左上角是(0,0)坐标.所以我们为了之后的坐标系描述按UIKit来做,先在这里做一个坐标系的上下翻转操作.翻转之后,底层和上层的(0,0)坐标就是重合的了.
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    if (self.data) {
        CTFrameDraw(self.data.ctFrame, context);
    }
    // 绘制出图片
    for (CoreTextImgData *imageData in self.data.imageArray) {
        UIImage *image = [UIImage imageNamed:imageData.name];
        if (image) {
            CGContextDrawImage(context, imageData.position, image.CGImage);
        }
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupEvents];
    }
    return self;
}
- (void)setupEvents {
    UIGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapgesturedetected:)];
    tapRecognizer.delegate = self;
    [self addGestureRecognizer:tapRecognizer];
    self.userInteractionEnabled = YES;
}
- (void)userTapgesturedetected:(UIGestureRecognizer *)recognizer {
    CGPoint point = [recognizer locationInView:self];
    for (CoreTextImgData *imageData in self.data.imageArray) {
        // 翻转坐标系 因为imageData中的坐标是CoreText的坐标系
        CGRect imageRect = imageData.position;
        CGPoint imagePosition = imageRect.origin;
        imagePosition.y = self.bounds.size.height - imageRect.origin.y - imageRect.size.height;
        CGRect rect = CGRectMake(imagePosition.x, imagePosition.y, imageRect.size.width, imageRect.size.height);
        // 检测点击位置Point是否在rect之内
        if (CGRectContainsPoint(rect, point)) {
            NSString *str = [NSString stringWithFormat:@"你点击的图片名称为'%@',大小为'%f*%f'",imageData.name,imageData.position.size.width,imageData.position.size.height];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            break;
        }
    }
    CoreTextLinkData *linkData = [Utils touchLinkInView:self atPoint:point data:self.data];
    if (linkData) {
        NSString *str = [NSString stringWithFormat:@"你点击的文字为:'%@'",linkData.title];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }
}

//    // 步骤3 创建绘制的区域,CoreText本身支持各种文字排版的区域,我们这里将UIView的整个界面作为了排版区域.
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.bounds);
//    // 步骤4
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Hello World!创建绘制的区域,CoreText本身支持各种文字排版的区域,"
//                                     "我们这里将UIView的整个界面作为了排版区域."
//                                     "为了加深理解,建议读者将该步骤的代码替换成如下代码,"
//                                     "测试设置不同的绘制区域带来的界面变化."];
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
//    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, NULL);
//    // 步骤5
//    CTFrameDraw(frame, context);
//    // 步骤6
//    CFRelease(frame);
//    CFRelease(path);
//    CFRelease(framesetter);

@end
