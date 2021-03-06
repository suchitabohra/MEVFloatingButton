//
//  MEVExample2ViewController.m
//  MEVFloatingButton
//
//  Created by Manuel Escrig Ventura on 09/02/16.
//  Copyright © 2016 Manuel Escrig Ventura. All rights reserved.
//

#import "MEVExample2ViewController.h"
#import "UIScrollView+FloatingButton.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface MEVExample2ViewController () <MEVFloatingButtonDelegate>

@end

@implementation MEVExample2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Example 2";

    MEVFloatingButton *button = [[MEVFloatingButton alloc] init];
    button.displayMode = MEVFloatingButtonDisplayModeWhenScrolling;
    button.animationType = MEVFloatingButtonAnimationNone;
    button.position = MEVFloatingButtonPositionBottomLeft;
    button.backgroundColor = [UIColor colorWithRed:233/255.0f green:212/255.0f blue:96/255.0f alpha:0.9];
    button.horizontalOffset = 30.0f;
    button.verticalOffset = -30.0f;
    button.image = [UIImage imageNamed:@"Icon2"];
    button.rounded = NO;
    button.hideWhenScrollToTop = YES;
    [self.tableView setFloatingButtonView:button];
    [self.tableView setFloatingButtonDelegate:self];
    
    [self.tableView setBackgroundColor:[UIColor colorWithRed:236/255.0f green:236/255.0f blue:236/255.0f alpha:1]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell setBackgroundColor:[UIColor colorWithRed:236/255.0f green:236/255.0f blue:236/255.0f alpha:1]];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell section [%zd] row [%zd]", indexPath.section, indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithRed:44/255.0f green:62/255.0f blue:80/255.0f alpha:1];
    return cell;
}


#pragma mark - MEScrollToTopDelegate Methods

- (void)floatingButton:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    NSLog(@"didTapButton");
    [self.tableView setContentOffset:CGPointMake(0, -self.tableView.contentInset.top) animated:YES];
}

- (void)floatingButtonWillAppear:(UIScrollView *)scrollView {
    NSLog(@"floatingButtonWillAppear");
}

- (void)floatingButtonDidAppear:(UIScrollView *)scrollView {
    NSLog(@"floatingButtonDidAppear");
}

- (void)floatingButtonWillDisappear:(UIScrollView *)scrollView {
    NSLog(@"floatingButtonWillDisappear");
}

- (void)floatingButtonDidDisappear:(UIScrollView *)scrollView; {
    NSLog(@"floatingButtonDidDisappear");
}

@end