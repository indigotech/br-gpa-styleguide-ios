//
//  TAQExampleVCTableViewData.m
//  template
//
//  Created by Taqtile on 6/10/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTExampleVCTableViewData.h"

@implementation TQTExampleVCTableViewData
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupTableViewData];
    }
    return self;
}

#pragma mark - private methods
/**
 * Use this method to setup the table view sections/rows of TAQExampleTableViewController tableView.
 * To add a new section, use addSectionWithHeight:headerSetupBlock:
 * To add a new row, use addRowWithHeight:cellSetupBlock:
 */
- (void)setupTableViewData {
    [self addSectionWithHeight:@40
              headerSetupBlock:^UIView *(){
                  SampleTableViewPrimaryHeaderView *header = [[SampleTableViewPrimaryHeaderView alloc] init];
                  (header).titleLabel.text = @"H3 SECTION HEADER";
                  return header;
              }
     ];
    [self addRowWithHeight:@70
            cellSetupBlock:^UITableViewCell *(TQTBaseTableViewCell *cell){
                [cell setContentChildViewClass:[SampleListItemContentChildView class]];
                SampleListItemContentChildView *contentChildView = (SampleListItemContentChildView *)cell.contentChildView;
                
                contentChildView.titleLabel.text = @"WITH";
                contentChildView.detailLabel.text = @"DETAIL";
                return cell;
            }
     ];
    [self addRowWithHeight:@40
            cellSetupBlock:^UITableViewCell *(TQTBaseTableViewCell *cell){
                [cell setContentChildViewClass:[SampleListItemContentChildView class]];
                SampleListItemContentChildView *contentView = (SampleListItemContentChildView *)cell.contentChildView;
                
                contentView.titleLabel.text = @"WITHOUT DETAIL";
                contentView.accessoryLabel.text = @"accessory";
                return cell;
            }
     ];
}

/**
 * Creates a new section on the table view
 * @param setupBlock block that creates, setups and returns the section Header UIView
 * @param height header height
 */
- (void) addSectionWithHeight:(NSNumber *)height headerSetupBlock:(HeaderSetupBlock)setupBlock  {
    NSMutableDictionary *section = [[NSMutableDictionary alloc] init];
    [section setObject:setupBlock forKey:KEY_HEADER_VIEW_SETUP];
    [section setObject:height forKey:KEY_HEADER_HEIGHT];
    [section setObject:[[NSMutableArray alloc] init] forKey:KEY_SECTION_ROWS];
    
    [self.tableViewData addObject:section];
}

/**
 * Creates a new row and adds it to the last section of the table view
 * @param setupBlock block that creates, setups and returns the row UITableViewCell
 * @param height cell height
 */
- (void) addRowWithHeight:(NSNumber *)height cellSetupBlock:(CellSetupBlock)setupBlock  {
    NSMutableDictionary *row = [[NSMutableDictionary alloc] init];
    [row setObject:height forKey:KEY_CELL_HEIGHT];
    [row setObject:setupBlock forKey:KEY_CONTENT_CHILD_VIEW_SETUP];
    
    int const lastSectionIndex = (int)[self.tableViewData count] - 1;
    NSMutableArray * const sectionRowsArray = self.tableViewData[lastSectionIndex][KEY_SECTION_ROWS];
    [sectionRowsArray addObject:row];
}

#pragma mark - getter
- (NSArray *)tableViewData {
    if (!_tableViewData) {
        _tableViewData = [[NSMutableArray alloc] init];
    }
    return _tableViewData;
}
@end
