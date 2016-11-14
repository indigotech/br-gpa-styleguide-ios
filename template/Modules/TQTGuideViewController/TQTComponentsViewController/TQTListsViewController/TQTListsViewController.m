//
//  TAQListsViewController.m
//  template
//
//  Created by Taqtile on 6/2/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTListsViewController.h"
#import "TQTExamplesTableViewController.h"
#import "SampleTableViewPrimaryHeaderView.h"
#import "SampleListItemContentChildView.h"

@interface TQTListsViewController ()

@end

@implementation TQTListsViewController

#pragma mark - VC lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Lists"];
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"TableView" style:UIBarButtonItemStylePlain target:self action:@selector(showTableView)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

#pragma mark - overriden method
- (void)addComponents {
    [self addGuideTitleWithText:@"1. TableVIew"];
    
    [self addHeaders];
    [self addCells];
}

- (void)addHeaders {
    [self addGuideSubtitleWithText:[NSString stringWithFormat:@"1.1 Header (%@)", NSStringFromClass([SampleTableViewPrimaryHeaderView class])]];
    
    SampleTableViewPrimaryHeaderView *tableViewPrimaryHeaderView = (SampleTableViewPrimaryHeaderView *)[self addViewWithClass:[SampleTableViewPrimaryHeaderView class] height:0];
    tableViewPrimaryHeaderView.titleLabel.text = @"H3 SECTION HEADER";
}

- (void)addCells {
    [self addGuideSubtitleWithText:[NSString stringWithFormat:@"1.2 Cell content view (%@)", NSStringFromClass([SampleListItemContentChildView class])]];
    
    SampleListItemContentChildView *cellWithoutDetail = (SampleListItemContentChildView *)[self addViewWithClass:[SampleListItemContentChildView class] height:43];
    cellWithoutDetail.titleLabel.text = @"H4 - WITHOUT DETAIL";
    cellWithoutDetail.accessoryLabel.text = @"Custom Label";
    
    SampleListItemContentChildView *cellWithDetail = (SampleListItemContentChildView *)[self addViewWithClass:[SampleListItemContentChildView class] height:70];
    cellWithDetail.titleLabel.text = @"H4 - LIST ITEM WITH";
    cellWithDetail.detailLabel.text = @"H4Sub - DETAIL";
    cellWithDetail.accessoryLabel.text = @"Custom Label";
}

#pragma mark - Action
-(void)showTableView {
    [self.navigationController pushViewController:[[TQTExamplesTableViewController alloc] init] animated:YES];
}

@end
