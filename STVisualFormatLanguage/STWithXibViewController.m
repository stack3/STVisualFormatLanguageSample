//
//  STWithXibViewController.m
//  STVisualFormatLanguage
//
//  Created by EIMEI on 2013/04/29.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STWithXibViewController.h"

@implementation STWithXibViewController {
    __weak IBOutlet UIButton *_button1;
    __weak IBOutlet UIButton *_button2;
    __weak UIButton *_button3;
    __weak UIButton *_button4;
}

- (id)init
{
    self = [super initWithNibName:@"STWithXibViewController" bundle:nil];
    if (self) {
        self.title = @"With xib";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [_button1 addTarget:self action:@selector(didTapButton1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button3 = button3;
    _button3.translatesAutoresizingMaskIntoConstraints = NO;
    [_button3 setTitle:@"Button3" forState:UIControlStateNormal];
    _button3.hidden = YES;
    [self.view addSubview:_button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button4 = button4;
    _button4.translatesAutoresizingMaskIntoConstraints = NO;
    [_button4 setTitle:@"Button4" forState:UIControlStateNormal];
    _button4.hidden = YES;
    [self.view addSubview:_button4];
}

- (void)didTapButton1
{
    if (! _button3.hidden) return;
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_button2, _button3);
    NSArray *constraints;
    //
    // button3
    //
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_button3]-|"
                                                          options:0
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_button2]-[_button3]"
                                                          options:0
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];
    _button3.hidden = NO;
}

@end
