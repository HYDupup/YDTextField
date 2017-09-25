//
//  YDRegularExpression.h
//  YDTextField
//
//  Created by 黄亚栋 on 2017/9/20.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDRegularExpression : NSObject

-(NSString *)OnlyNumberPattern;
-(NSString *)OnlyEnglishPattern;
-(NSString *)OnlyChinesePattern;
-(NSString *)AllCharPattern;
-(NSString *)BanNumberPattern;
-(NSString *)BanEnglishPattern;
-(NSString *)BanChinesePattern;
-(NSString *)MarkChar;

@end
