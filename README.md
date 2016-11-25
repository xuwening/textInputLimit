TextInputLimit
==============
TextInputLimit是ios下的一个文本框输入文字长度限制的库，使用起来十分简单方便。

1、cocoapods自动集成
-----------

`pod 'TextInputLimit'`


2、手工方式集成
-----------

将TextInputLimit文件夹直接添加到工程中即可。

使用方式
---------

在调用需要做输入长度限制的textField或textView ***对象*** 方法：  
      
`[textObj setValue:@4 forKey:@"limit"];`        

长度限制只影响设置limit属性的对象，没有设置limit属性的对象不受影响。

         
***使用过程中不需要对UITextField和UITextView或Xib文件做任何修改，也不需要引用头文件。***

扩展（可选项）
-----------
   
如果需要在输入限制的同时，做些额外处理，如：提示用户输入文字过多，或做些动画特效等，可以注册`acceptLimitLength`通知。

```objective-c
[[NSNotificationCenter defaultCenter] addObserver:self 
                                         selector:@selector(textLimitLenght:)
                                             name:@"acceptLimitLength" 
                                           object:nil];


-(void) textLimitLenght: (NSNotification *) notification {
    
    NSObject *object = notification.object;
    
    if ([object isEqual: self.textview]) {
        //收到来自textview的输入限制
    }
    
    if ([object isEqual: self.textfield]) {
        //收到来自textfield的输入限制
    }
    //提示
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" 
                                                    message:@"您输入的长度过长，自动被截断。"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}
```


运行demo
--------

`git clone https://github.com/xuwening/textInputLimit.git`

`cd textInputLimit && pod install`

打开`TextInputLimitTest.xcworkspace`运行。







