//
//  GuideTableViewDataModel.h
//  template
//
//  Created by Taqtile on 5/28/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * This class is the model to be used in the table view cell of TAQGuideViewController
 * It has the text to be displayed in the cell and the class of the view controller to be pushed
 */
@interface TQTGuideTableViewDataModel : NSObject
@property (strong, nonatomic, readonly) NSString *text;
@property (strong, nonatomic, readonly) Class nextViewController;

-(instancetype)initWithText:(NSString *)text class:(Class)class;
@end
