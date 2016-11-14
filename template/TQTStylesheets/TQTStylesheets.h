//
//  UIViewAttributes.h
//  Netshoes
//
//  Created by Taqtile on 4/23/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Singleton which stores a dictionary containing all style rules and apply them in a UIView
@interface TQTStylesheets : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)sharedInstance;

-(void)import:(NSDictionary *)stylesheetClass;
-(void) setStyle:(NSString*) style forView:(UIView*) view;

@end
