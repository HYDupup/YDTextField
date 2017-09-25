//
//  YDTextField.m
//  YDTextField
//
//  Created by 黄亚栋 on 2017/9/20.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import "YDTextField.h"

@implementation YDTextField

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
       
        [self setBackgroundColor:[UIColor clearColor]];
        
    }
    return self;
}

-(BOOL)becomeFirstResponder{
    
    [self setValue:self.highlightColor forKeyPath:@"_placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}

-(BOOL)resignFirstResponder{
    [self setValue:self.nomalColor forKeyPath:@"_placeholderLabel.textColor"];
    return [super resignFirstResponder];
}


@end
