TextInputLimit
==============
TextInputLimit是ios下的一个文本框输入文字长度限制的库，使用起来十分简单方便。

使用方式：
-----------

将textInputLimit的.h和.m直接拷贝到工程中，然后调用需要做输入长度限制的textField或textView对象方法：  
      
`[textObj setValue:@4 forKey:@"limit"];`        
         
         
***使用过程中不需要对UITextField和UITextView或Xib文件做任何修改，也不需要引用头文件。***

扩展
-----------
   
如果需要在输入限制的同时，做些额外处理，如：提示用户输入文字过多，或做些动画特效等，可以注册`acceptLimitLength`通知。




