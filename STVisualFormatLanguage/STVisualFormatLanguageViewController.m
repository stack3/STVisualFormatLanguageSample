//
//  STVisualFormatLanguageViewController.m
//  STVisualFormatLanguage
//
//  Created by EIMEI on 2013/04/29.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STVisualFormatLanguageViewController.h"
#import "UIView+ST.h"

@implementation STVisualFormatLanguageViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Visual Format Language";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    NSNumber *padding = @8;
    NSNumber *widePadding = @20;
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    [button1 setTitle:@"Button1" forState:UIControlStateNormal];
    [self.view addSubview:button1];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    [button2 setTitle:@"Button2" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    
    UITextField *searchTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    searchTextField.translatesAutoresizingMaskIntoConstraints = NO;
    searchTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:searchTextField];

    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchButton.translatesAutoresizingMaskIntoConstraints = NO;
    [searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(didTapSearchButton) forControlEvents:UIControlEventTouchUpInside];
    [searchButton sizeToFit];
    [self.view addSubview:searchButton];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(button1, button2, searchTextField, searchButton);
    NSDictionary *metricsDictionary = NSDictionaryOfVariableBindings(padding, widePadding);
    NSArray *constraints;
    //
    // button1
    //
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[button1]-8-|"
                                                          options:0
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];

    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[button1]"
                                                          options:0
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];
    //
    // button2
    //
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-widePadding-[button2]-widePadding-|"
                                                          options:0
                                                          metrics:metricsDictionary
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button1]-padding-[button2]"
                                                          options:0
                                                          metrics:metricsDictionary
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];
    //
    // searchTextField & searchButton
    //
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[searchTextField]-[searchButton(100)]-|"
                                                          options:0
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button2]-[searchTextField]"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:viewsDictionary];
    [self.view addConstraints:constraints];

    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button2]-[searchButton(30)]"
                                                          options:0
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.view addConstraints:constraints];
}

- (void)didTapSearchButton
{
    [[self.view st_findFirstResponder] resignFirstResponder];
}

@end
