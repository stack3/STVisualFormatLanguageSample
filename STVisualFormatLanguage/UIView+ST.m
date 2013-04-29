//
//  UIView+ST.m
//  STVisualFormatLanguageSample
//
//  Created by EIMEI on 2013/04/29.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "UIView+ST.h"

@implementation UIView (ST)

- (UIView *)st_findFirstResponder
{
    if ([self isFirstResponder]) {
        return self;
    }
    
    NSArray *subviews = [self subviews];
    for (UIView *subView in subviews) {
        if ([subView isFirstResponder]) {
            return subView;
        }
        
        UIView *foundView = [subView st_findFirstResponder];
        if (foundView) {
            return foundView;
        }
    }
    return nil;
}

@end
