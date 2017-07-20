//
//  CTFrameParser.h
//  ImagespanDemo
//
//  Created by 高赛 on 2017/6/23.
//  Copyright © 2017年 高赛. All rights reserved.
//

// 用于生成最后绘制界面需要的CTFrameRef实例
#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"

@interface CTFrameParser : NSObject

+ (NSDictionary *)attributesWithConfig:(CTFrameParserConfig *)config;
/**
 根据NSString和CTFrameParserConfig生成CoreTextData
 */
+ (CoreTextData *)parseContent:(NSString *)content config:(CTFrameParserConfig *)config;
/**
 根据文件路径和CTFrameParserConfig生成CoreTextData
 */
+ (CoreTextData *)parseTemplateFile:(NSString *)path config:(CTFrameParserConfig *)config;
/**
 根据文件路径获取数据,并根据CTFrameParserConfig转化为NSAttributedString返回
 */
+ (NSAttributedString *)loadTemplateFile:(NSString *)path config:(CTFrameParserConfig *)config imageArray:(NSMutableArray *)imageArray linkArray:(NSMutableArray *)linkArray;
/**
 从字典中解析生成NSAttributedString
 */
+ (NSAttributedString *)parseAttributedContentFromNSDictionary:(NSDictionary *)dict config:(CTFrameParserConfig *)config;
/**
 从字典中解析图片信息生成空白占位符
 */
+ (NSAttributedString *)parseImageDataFromNSDictionary:(NSDictionary *)dict config:(CTFrameParserConfig *)config;
/**
 获取颜色
 */
+ (UIColor *)colorFromTemplate:(NSString *)name;
/**
 根据富文本和CTFrameParserConfig生成CoreTextData
 */
+ (CoreTextData *)parseAttributedContent:(NSAttributedString *)content config:(CTFrameParserConfig *)config;
/**
 获取绘制区域
 */
+ (CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter config:(CTFrameParserConfig *)config height:(CGFloat)height;

@end
