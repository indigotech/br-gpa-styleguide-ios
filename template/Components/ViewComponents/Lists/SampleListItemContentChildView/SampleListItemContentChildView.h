//
//  TableViewItemCellContentView.h
//  template
//
//  Created by Taqtile on 6/2/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBaseComponentsView.h"

/**
 Component of a list item. It has a title, detail(optional) and accessory(optional) label
 This is an example of a ContentChildView, i.e a view that can be used as a normal component or
 as a child view of a UITableViewCell content view
 **/
@interface SampleListItemContentChildView : TQTBaseComponentsView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessoryLabel;
@property(nonatomic, getter=isHighlighted) BOOL highlighted;
@end
