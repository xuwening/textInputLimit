//
//  LimitInput.m
//  singleview
//
//  Created by aqua on 14-8-30.
//  Copyright (c) 2014年 aqua. All rights reserved.
//

#import "LimitInput.h"
#import <objc/runtime.h>


#define RUNTIME_ADD_PROPERTY(propertyName)      \
-(id)valueForUndefinedKey:(NSString *)key {     \
if ([key isEqualToString:propertyName]) {   \
return objc_getAssociatedObject(self, key.UTF8String);  \
}                                           \
return nil;                                 \
}                                               \
-(void)setValue:(id)value forUndefinedKey:(NSString *)key { \
if ([key isEqualToString:propertyName]) {               \
objc_setAssociatedObject(self, key.UTF8String, value, OBJC_ASSOCIATION_RETAIN); \
}                                                       \
}

#define IMPLEMENT_PROPERTY(className) \
@implementation className (Limit) RUNTIME_ADD_PROPERTY(PROPERTY_NAME) @end

IMPLEMENT_PROPERTY(UITextField)
IMPLEMENT_PROPERTY(UITextView)

@implementation LimitInput


+(void) load {
    [super load];
    [LimitInput sharedInstance];
}
    
    
+(LimitInput *) sharedInstance {
    static LimitInput *g_limitInput;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        g_limitInput = [[LimitInput alloc] init];
        g_limitInput.enableLimitCount = YES;
    });
    
    return g_limitInput;
}
    
-(id) init {
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldViewDidChange:) name:UITextFieldTextDidChangeNotification object: nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object: nil];
    }
    
    return self;
}

    
-(void)textFieldViewDidChange:(NSNotification*)notification {
    if (!self.enableLimitCount) return;
    UITextField *textField = (UITextField *)notification.object;
    
    NSNumber *number = [textField valueForKey:PROPERTY_NAME];
    if (number && textField.text.length > [number integerValue] && textField.markedTextRange == nil) {
        textField.text = [textField.text substringWithRange: NSMakeRange(0, [number integerValue])];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"acceptLimitLength" object: textField];
    }
}


-(void) textViewDidChange: (NSNotification *) notificaiton {
    if (!self.enableLimitCount) return;
    UITextView *textView = (UITextView *)notificaiton.object;
    
    NSNumber *number = [textView valueForKey:PROPERTY_NAME];
    if (number && textView.text.length > [number integerValue] && textView.markedTextRange == nil) {
        textView.text = [textView.text substringWithRange: NSMakeRange(0, [number integerValue])];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"acceptLimitLength" object: textView];
    }
}



@end
