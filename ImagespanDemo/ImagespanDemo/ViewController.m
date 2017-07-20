//
//  ViewController.m
//  ImagespanDemo
//
//  Created by 高赛 on 2017/6/23.
//  Copyright © 2017年 高赛. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayView.h"
#import "CTFrameParser.h"
#import "CTFrameParserConfig.h"

@interface ViewController ()

@property (nonatomic, strong) CTDisplayView *displayView;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (CTDisplayView *)displayView {
    if (_displayView == nil) {
        _displayView = [[CTDisplayView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.width, 0)];
        _displayView.backgroundColor = [UIColor whiteColor];
        [_displayView setupEvents];
    }
    return _displayView;
}
- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(12, 20, self.view.width - 24, self.view.height - 20)];
        _scrollView.userInteractionEnabled = YES;
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.scrollView];
    
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.width = self.displayView.width;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"coretext" ofType:@"json"];
    CoreTextData *data = [CTFrameParser parseTemplateFile:path config:config];
    self.displayView.data = data;
    self.displayView.height = data.height;
    
    [self.scrollView addSubview:self.displayView];
    self.scrollView.contentSize = CGSizeMake(0, self.displayView.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
//    config.textColor = [UIColor redColor];
//    config.width = self.displayView.width;
//
//    NSString *content = @"对于上面的例子,我们给CTFrameParser增加了一个将NSString转"
//    "换位CoreTextData的方法."
//    "但这样的实现方式有很多的局限性,因为整个内容虽然可以定制字体"
//    "大小,颜色,行高等信息,但是却不能支持定制内容中的某一部分."
//    "例如,如果我们只想让内容的前三个字显示成红色,而其他文字显"
//    "示成黑色,那么就办不到了."
//    "\n\n"
//    "解决的办法很简单,我们让'CTFrameParser'支持接受"
//    "NSAttributeString作为参数,然后在NSAttributeString中设置好"
//    "我们想要的信息";
////    NSDictionary *attr = [CTFrameParser attributesWithConfig:config];
//
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content];
//    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, attributedString.length)];
//    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 7)];
//    CoreTextData *data = [CTFrameParser parseAttributedContent:attributedString config:config];
//    self.displayView.data = data;
//    self.displayView.height = data.height;

//    CoreTextData *data = [CTFrameParser parseContent:@"Hello World!创建绘制的区域,CoreText本身支持各种文字排版的区域,"
//                          "我们这里将UIView的整个界面作为了排版区域."
//                          "为了加深理解,建议读者将该步骤的代码替换成如下代码,"
//                          "测试设置不同的绘制区域带来的界面变化." config:config];
//    self.displayView.data = data;
//    self.displayView.height = data.height;

@end
