//
//  YDRegularExpression.m
//  YDTextField
//
//  Created by 黄亚栋 on 2017/9/20.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import "YDRegularExpression.h"

@implementation YDRegularExpression

//输入数字
-(NSString *)OnlyNumberPattern{
    NSString *pattern = @"[0-9]";
    return pattern;
}

//只能输入英文
-(NSString *)OnlyEnglishPattern{
    NSString *pattern = @"[A-Za-z]";
    return pattern;
}

//只能输入中文
-(NSString *)OnlyChinesePattern{
    NSString *pattern = @"[\u4e00-\u9fa5]";
    return pattern;
}

//禁止输入数字
-(NSString *)BanNumberPattern{
    NSString *patter = @"[^0-9]";
    return patter;
}

//禁止输入英文
-(NSString *)BanEnglishPattern{
    NSString *pattern = @"[^A-Za-z]";
    return pattern;
}

//禁止输入中文
-(NSString *)BanChinesePattern{
    NSString *pattern = @"[^\u4e00-\u9fa5]";
    return pattern;
}

//全部字符
-(NSString *)AllCharPattern{
    NSString *pattern = @".";
    return pattern;
}

//标点符号
-(NSString *)MarkChar{
    NSString *pattern = @"-/:;()¥&@.,?!'[]{}#%^*+=_\|~<>$€£•'!?,.-/：；（）¥@“”.！？、，。【】｛｝#%^*+=_—\～《》$&·'!?";
    return pattern;
}
//NSString *pattern = @"`~!@#$%^&*()_+~！@#￥%……&*（）——+[]{}\\|:;'<>,.?/{}【】|、；：‘“《，》。？、";


@end
