//
//  TAQInvalidStyleruleException.h
//  template
//
//  Created by Taqtile on 6/9/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TQTBaseException.h"

@interface TQTWrongClassNameException : TQTBaseException
-(instancetype) initWithClass:(Class)class;
@end
