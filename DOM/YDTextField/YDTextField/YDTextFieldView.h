//
//  YDTextFieldView.h
//  YDTextField
//
//  Created by 黄亚栋 on 2017/9/20.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDTextField.h"

typedef enum{
    AllType = 0,//全部
    OnlyNumberType,//只输入数字
    OnlyEnglishType,//只输入英文
    OnlyChineseType,//只输入中文
    BanNumberType,//禁止输入数字
    BanEnglishType,//禁止输入英文
    BanChineseType//禁止输入中文
}YDTextFieldViewType;

@protocol YDTextFieldViewDelegate <NSObject>

@optional

- (BOOL)YDtextFieldShouldBeginEditing:(UITextField *)textField;
- (void)YDtextFieldDidBeginEditing:(UITextField *)textField;
- (BOOL)YDtextFieldShouldEndEditing:(UITextField *)textField;
- (void)YDtextFieldDidEndEditing:(UITextField *)textField;
- (void)YDtextFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason;
- (BOOL)YDtextFieldShouldClear:(UITextField *)textField;
- (BOOL)YDtextFieldShouldReturn:(UITextField *)textField;
- (void)YDTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end

@interface YDTextFieldView : UIView

/*
 输入框
 */
@property (nonatomic,strong)YDTextField *textField;

/*
 限制类型
 */
@property (nonatomic,assign)YDTextFieldViewType type;

/*
 输入文字颜色
 */
@property (nonatomic,strong)UIColor *textColor;

/*
 输入文字大小
 */
@property (nonatomic,strong)UIFont *font;

/*
 提示文字
 */
@property (nonatomic,copy)NSString *placeholder;

/*
 提示文字颜色
 */
@property (nonatomic,strong)UIColor *placeholderNomalColor;

/*
 提示文字第一响应者颜色
 */
@property (nonatomic,strong)UIColor *placeholderhighlightColor;

/*
 光标颜色
 */
@property (nonatomic,strong)UIColor *tintColor;

/*
 键盘类型
 */
@property (nonatomic,assign)UIKeyboardType keyboardType;

/*
 清除按钮类型
 */
@property (nonatomic,assign)UITextFieldViewMode clearButtonMode;

/*
 限制字符 字符长度
 此限制不是限制字符串长度，而是限制字符串的字符总长度
 数字/英文.charLenght = 1,中文.charLenght = 2，表情.charLenght = 3
 */
@property (nonatomic,assign)NSInteger limitLength;

/*
 限制标点符号
 */
@property (nonatomic,assign)BOOL isMarkChar;

/*
 限制表情符号
 */
@property (nonatomic,assign)BOOL isEmoji;

/*
 代理
 */
@property (nonatomic,weak)id<YDTextFieldViewDelegate> delegate;

//构造方法
-(instancetype)initWithFrame:(CGRect)frame andYDTextFieldViewType:(YDTextFieldViewType)type;

@end
