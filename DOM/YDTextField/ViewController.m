//
//  ViewController.m
//  YDTextField
//
//  Created by 黄亚栋 on 2017/9/20.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import "ViewController.h"
#import "YDTextFieldView.h"

@interface ViewController ()<YDTextFieldViewDelegate>

@property (nonatomic,strong)YDTextFieldView *textFieldView;

@property (nonatomic,strong)YDTextFieldView *textFieldView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.textFieldView = [[YDTextFieldView alloc]initWithFrame:CGRectMake(100, 100, 150, 40)];
    self.textFieldView.delegate = self;
    self.textFieldView.type = OnlyEnglishType; //限制类型
    self.textFieldView.placeholder = @"这个是提示文字";//提示文字 （默认“”）
    self.textFieldView.placeholderNomalColor = [UIColor whiteColor];//提示文字颜色 （默认灰白）
    self.textFieldView.placeholderhighlightColor = [UIColor redColor];//提示文字颜色响应者状态 （默认灰白）
    self.textFieldView.tintColor = [UIColor grayColor];//光标颜色 (默认蓝色)
    self.textFieldView.font = [UIFont systemFontOfSize:18.0f];//文字大小 (默认：15.0f)
    self.textFieldView.textColor = [UIColor greenColor];//输入文本颜色 （默认白色）
    self.textFieldView.keyboardType = UIKeyboardTypeDefault;//键盘类型 （默认键盘）
    self.textFieldView.clearButtonMode = UITextFieldViewModeAlways;//清除按钮模式 （默认不显示）
    self.textFieldView.isMarkChar = YES;//是否限制特殊符号 (默认 否)
    self.textFieldView.isEmoji = YES;//是否限制表情 (默认 否)
    self.textFieldView.limitLength = 10;//限制字符串 字符长度
    
    [self.textFieldView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:self.textFieldView];
    
        
    self.textFieldView1 = [[YDTextFieldView alloc]initWithFrame:CGRectMake(100, 300, 150, 40)];
    self.textFieldView1.placeholder = @"这个是提示文字1222";
    self.textFieldView1.type = OnlyEnglishType;
    
    [self.textFieldView1 setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:self.textFieldView1];

}

-(void)YDTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
