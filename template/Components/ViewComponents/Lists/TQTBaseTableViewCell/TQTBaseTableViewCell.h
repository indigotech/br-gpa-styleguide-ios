//
//  BaseTableViewCell.h
//  template
//
//  Created by Taqtile on 6/3/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
Every custom cell will be created as UIView instead of UITableViewCell.
This approach was chosen because sometimes it is easier to create a
static small list of cells than create a tableView and implement all of
its delegate, datasource methods.

In order to use a component (UIView) as a TableViewCell, this commit
creates BaseTableViewCell.
 BaseTableViewCell adds a new property called contentChildView, which is
 the subview of the cell.contentView. This idea comes from the apple
 docs: https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/TableView_iPhone/TableViewCells/TableViewCells.html#//apple_ref/doc/uid/TP40007451-CH7-SW15

 How to use a component as a tableViewCell:
 1. Create a component view which inherits from BaseComponentsView (as
 usual)
 2. After calling dequeueReusableCellWithIdentifier:forIndexPath: call
 setContentChildViewClass: passing the class of the component you've just created
 3. Then, call cell.contentChildView to get the component view to set/get your
 data
 **/
@interface TQTBaseTableViewCell : UITableViewCell

@property (nonatomic) Class contentChildViewClass;
@property (nonatomic, strong, readonly) UIView *contentChildView;

@end
