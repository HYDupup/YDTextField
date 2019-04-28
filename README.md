# YDTextField
## YDTextField是基于UITextField封装的控件，主要功能如下：<br>
### 1.限制输入文字的类型 <br>
AllType = 0,//全部 <br>
OnlyNumberType,//只输入数字 <br>
OnlyEnglishType,//只输入英文 <br>
OnlyChineseType,//只输入中文 <br>
BanNumberType,//禁止输入数字 <br>
BanEnglishType,//禁止输入英文 <br>
BanChineseType//禁止输入中文 <br>
@property (nonatomic,assign)BOOL isMarkChar;//是否限制标点符号 <br>
@property (nonatomic,assign)BOOL isEmoji;//限制表情符号 <br>
### 2.限制文字输入的字符长度，并自动计算 <br>
/* <br>
 限制字符 字符长度 <br>
 此限制不是限制字符串长度，而是限制字符串的字符总长度 <br>
 数字/英文.charLenght = 1,中文.charLenght = 2，表情.charLenght = 3 <br>
 */ <br>
@property (nonatomic,assign)NSInteger limitLength; <br>
### 3.设置UITextField提示文字的默认颜色和在第一响应状态的颜色 <br>
@property (nonatomic,strong)UIColor *placeholderNomalColor;//提示文字颜色 <br>
@property (nonatomic,strong)UIColor *placeholderhighlightColor;//提示文字第一响应者颜色 <br>
### 4.UITextField在加密与不加密状态之间交换时，文本不会清空 <br>
## Installation
```
sssc ddd
pod 'YDTextField' 即可使用
```
