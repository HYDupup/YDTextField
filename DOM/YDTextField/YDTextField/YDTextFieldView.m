//
//  YDTextFieldView.m
//  YDTextField
//
//  Created by 黄亚栋 on 2017/9/20.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import "YDTextFieldView.h"
#import "YDRegularExpression.h"

@interface YDTextFieldView()<UITextFieldDelegate>



@property (nonatomic,strong)YDRegularExpression *regularExpression;

//记录字符的长度
@property (nonatomic,assign)NSInteger strLength;


//正则表达式
@property (nonatomic,strong)NSMutableString *pattern;

@end

@implementation YDTextFieldView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        //默认背景颜色
        [self setBackgroundColor:[UIColor clearColor]];
        
        self.regularExpression = [[YDRegularExpression alloc]init];
        
        self.pattern = [[NSMutableString alloc]init];

        //默认的限制类型
        self.type = AllType;
        
        [self creatInitUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame andYDTextFieldViewType:(YDTextFieldViewType)type{
    self = [super initWithFrame:frame];
    if (self) {
        //默认背景颜色
        [self setBackgroundColor:[UIColor clearColor]];
        
        self.regularExpression = [[YDRegularExpression alloc]init];

        self.pattern = [[NSMutableString alloc]init];

        self.type = type;
        
        [self creatInitUI];
    }
    return self;
}

#pragma mark CreatUI
-(void)creatInitUI{
    
    self.textField = [[YDTextField alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.textField.delegate = self;
    [self.textField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];

    [self addSubview:self.textField];
    
    //默认的输入文本颜色 (白色)
    self.textColor = [UIColor whiteColor];
    
    //默认的输入文字大小
    self.font = [UIFont systemFontOfSize:15.0f];
    
    //默认的提示文字 （无）
    self.placeholder = @"";
    
    //默认的提示文字颜色 (灰白色)
    self.placeholderNomalColor = [UIColor lightGrayColor];
    
    //默认的提示文字第一响应者颜色 (灰白色)
    self.placeholderhighlightColor = [UIColor lightGrayColor];
    
    //默认的光标颜色 （蓝色）
    self.tintColor = [UIColor blueColor];
    
    //默认的键盘类型 （默认键盘）
    self.keyboardType = UIKeyboardTypeDefault;
    
    //默认的清除按钮类型 (无)
    self.clearButtonMode = UITextFieldViewModeNever;
    
    //默认不限制特殊符号
    self.isMarkChar = NO;
    
    //默认不限制表情符号
    self.isEmoji = NO;
    
}

#pragma mark setter
//限制类型
-(void)setType:(YDTextFieldViewType)type{
    _type = type;
    if (![self.pattern isEqualToString:@""]) {
        self.pattern = [[NSMutableString alloc]init];
    }
    switch (type) {
        case OnlyNumberType:
            [self.pattern appendString:[self.regularExpression OnlyNumberPattern]];
            break;
        case OnlyEnglishType:
            [self.pattern appendString:[self.regularExpression OnlyEnglishPattern]];
            break;
        case OnlyChineseType:
            [self.pattern appendString:[self.regularExpression OnlyChinesePattern]];
            break;
        case BanNumberType:
            [self.pattern appendString:[self.regularExpression BanNumberPattern]];
            break;
        case BanEnglishType:
            [self.pattern appendString:[self.regularExpression BanEnglishPattern]];
            break;
        case BanChineseType:
            [self.pattern appendString:[self.regularExpression BanChinesePattern]];
            break;
        default:
            [self.pattern appendString:[self.regularExpression AllCharPattern]];
            break;
    }
}

//文字颜色
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.textField.textColor = textColor;
}

//输入文字大小
-(void)setFont:(UIFont *)font{
    _font = font;
    self.textField.font = font;
}

//提示文字
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.textField.placeholder = placeholder;
}

//提示文字颜色
-(void)setPlaceholderNomalColor:(UIColor *)placeholderNomalColor{
    _placeholderNomalColor = placeholderNomalColor;
    [self.textField setValue:placeholderNomalColor forKeyPath:@"_placeholderLabel.textColor"];
    self.textField.nomalColor = placeholderNomalColor;
}

//提示文字第一响应者颜色
-(void)setPlaceholderhighlightColor:(UIColor *)placeholderhighlightColor{
    _placeholderhighlightColor = placeholderhighlightColor;
    self.textField.highlightColor = placeholderhighlightColor;
}

//光标颜色
-(void)setTintColor:(UIColor *)tintColor{
    _tintColor = tintColor;
    self.textField.tintColor = tintColor;
}

//键盘类型
-(void)setKeyboardType:(UIKeyboardType)keyboardType{
    _keyboardType = keyboardType;
    self.textField.keyboardType = keyboardType;
}

//清除按钮类型
-(void)setClearButtonMode:(UITextFieldViewMode)clearButtonMode{
    _clearButtonMode = clearButtonMode;
    self.textField.clearButtonMode = clearButtonMode;
}

#pragma mark UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if ([self.delegate respondsToSelector:@selector(YDTextField:shouldChangeCharactersInRange:replacementString:)]) {
        [self.delegate YDTextField:self.textField shouldChangeCharactersInRange:range replacementString:string];
    }
    
    if ([string isEqualToString:@""]) {
        return YES;
    }

    if (self.isMarkChar & self.isEmoji) {
        if (![self stringContainsMarkChar:string]) {
            return [self stringContainsMarkChar:string];
        }else if (![self stringContainsEmoji:string]){
            return [self stringContainsEmoji:string];
        }
    }else if(self.isMarkChar | self.isEmoji){
        if (self.isMarkChar) {
            return [self stringContainsMarkChar:string];
        }
        if (self.isEmoji){
            return [self stringContainsEmoji:string];
        }
    }
    return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(YDtextFieldShouldEndEditing:)]) {
        return [self.delegate YDtextFieldShouldEndEditing:textField];
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(YDtextFieldDidBeginEditing:)]) {
        return [self.delegate YDtextFieldDidBeginEditing:textField];
    }
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(YDtextFieldShouldEndEditing:)]) {
        return [self.delegate YDtextFieldShouldEndEditing:textField];
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(YDtextFieldDidEndEditing:)]) {
        return [self.delegate YDtextFieldDidEndEditing:textField];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason{
    if ([self.delegate respondsToSelector:@selector(YDtextFieldDidEndEditing:reason:    )]) {
        return [self.delegate YDtextFieldDidEndEditing:textField reason:reason];
    }
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(YDtextFieldShouldClear:)]) {
        return [self.delegate YDtextFieldShouldClear:textField];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(YDtextFieldShouldReturn:)]) {
        return [self.delegate YDtextFieldShouldReturn:textField];
    }
    return YES;
}


-(void)textFieldChanged:(YDTextField *)sender{
    
        NSRegularExpression *regx = [NSRegularExpression regularExpressionWithPattern:self.pattern options:NSRegularExpressionCaseInsensitive error:NULL];
        
        UITextRange *selectedRange = sender.markedTextRange;
        UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
        
        if (!position) {
            
            NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",self.pattern];
            [carTest evaluateWithObject:sender.text];
            
            NSArray<NSTextCheckingResult *> *result = [regx matchesInString:sender.text options:0 range:NSMakeRange(0, sender.text.length)];
            NSMutableString *resultString = [[NSMutableString alloc]init];
            for (NSTextCheckingResult *checkingResult in result){
                NSString *str = [sender.text substringWithRange:checkingResult.range];
                [resultString appendString:str];
            }
                
                if (self.limitLength != 0) {
                    
                  if (resultString.length >= self.strLength) {
                    //新输入的字符串
                    NSString *newStr = [resultString substringFromIndex:self.strLength];
                    //旧的字符串
                    NSString *oldStr = [resultString substringToIndex:self.strLength];
                    //计算新字符串的字节长度
                    NSInteger newStrLenght = [self strCharLenght:newStr];
                    //计算旧的字符串的字节长度
                    NSInteger oldStrLenght = [self strCharLenght:oldStr];
                    
                    if ((oldStrLenght+newStrLenght) <= self.limitLength) {
                        sender.text = resultString;
                    }else{
                        sender.text = [resultString substringToIndex:self.strLength];
                    }
                    self.strLength = sender.text.length;
                  }else{
                      sender.text = resultString;
                      self.strLength = sender.text.length;
                  }
                    
                }else{
                    sender.text = resultString;
                }
        
        }
    
}

//字符串字节长度计算
-(NSInteger)strCharLenght:(NSString *)string{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData *data = [string dataUsingEncoding:encoding];
    NSInteger strLenght = [data length];
    return  strLenght;
}

//判断是否有特殊字符
-(BOOL)stringContainsMarkChar:(NSString *)string{
    
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:[self.regularExpression MarkChar]] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:characterSet] componentsJoinedByString:@""];
    return ![string isEqualToString:filtered];

}

//判断是否有emoji
-(BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar high = [substring characterAtIndex: 0];
                                
                                // Surrogate pair (U+1D000-1F9FF)
                                if (0xD800 <= high && high <= 0xDBFF) {
                                    const unichar low = [substring characterAtIndex: 1];
                                    const int codepoint = ((high - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
                                    
                                    if (0x1D000 <= codepoint && codepoint <= 0x1F9FF){
                                        returnValue = YES;
                                    }
                                    
                                    // Not surrogate pair (U+2100-27BF)
                                } else {
                                    if (0x2100 <= high && high <= 0x27BF){
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return !returnValue;
}


@end
