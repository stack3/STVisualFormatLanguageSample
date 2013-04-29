//
//  STViewController.m
//  STVisualFormatLanguage
//
//  Created by EIMEI on 2013/04/29.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STViewController.h"
#import "STVisualFormatLanguageViewController.h"
#import "STWithXibViewController.h"

@implementation STViewController {
    __weak IBOutlet UITableView *_tableView;
    __strong NSArray *_rows;
}

- (id)init {
    self = [super initWithNibName:@"STViewController" bundle:nil];
    if (self) {
        self.title = @"Visual Format Language";
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                                 style:UIBarButtonItemStyleBordered
                                                                                target:nil action:nil];
        
        _rows = [NSArray arrayWithObjects:@{
                    @"title" :  @"Visual Format Language",
                    @"class" : [STVisualFormatLanguageViewController class]
                 }, @{
                    @"title" :  @"With Xib",
                    @"class" : [STWithXibViewController class]
                 },
                 nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView.dataSource = self;
    _tableView.delegate = self;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary *row = [_rows objectAtIndex:indexPath.row];
    cell.textLabel.text = [row objectForKey:@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row = [_rows objectAtIndex:indexPath.row];
    Class clazz = [row objectForKey:@"class"];
    UIViewController *viewController = [[clazz alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
