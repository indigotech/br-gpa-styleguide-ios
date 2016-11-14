//
//  TAQExamplesTableViewController.m
//  template
//
//  Created by Taqtile on 6/3/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTExamplesTableViewController.h"
#import "UIView+TQTAttachToSuperview.h"
#import "TQTExampleVCTableViewData.h"

@interface TQTExamplesTableViewController ()
@property (strong, nonatomic) NSMutableArray *tableViewData;
@end

#define CELL_ID @"UITableViewCell"

@implementation TQTExamplesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[TQTBaseTableViewCell class] forCellReuseIdentifier:CELL_ID];
    
}

#pragma mark - getter
-(NSMutableArray *)tableViewData {
    if (!_tableViewData) {
        _tableViewData = [[TQTExampleVCTableViewData alloc] init].tableViewData;
    }
    return _tableViewData;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableViewData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [(NSArray *)self.tableViewData[section][KEY_SECTION_ROWS] count];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeaderSetupBlock headerViewBlock = self.tableViewData[section][KEY_HEADER_VIEW_SETUP];
    return headerViewBlock();
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self.tableViewData[section][KEY_HEADER_HEIGHT] floatValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellSetupBlock rowViewBlock = self.tableViewData[indexPath.section][KEY_SECTION_ROWS][indexPath.row][KEY_CONTENT_CHILD_VIEW_SETUP];
    TQTBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    return rowViewBlock(cell);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableViewData[indexPath.section][KEY_SECTION_ROWS][indexPath.row][KEY_CELL_HEIGHT] floatValue];
}


@end
