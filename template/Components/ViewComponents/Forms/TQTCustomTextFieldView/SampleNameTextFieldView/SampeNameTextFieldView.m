//
//  NameTextFieldView.m
//  template
//
//  Created by Taqtile on 6/1/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "SampeNameTextFieldView.h"
#import "TQTFormTextualElementsStylesheet.h"

@implementation SampeNameTextFieldView

#pragma mark - View lifecycle
-(void)setupOnAwakeFromNib {
    [self initialSetup];
}

-(void)setupOnInitWithFrame {
    [self initialSetup];
}

-(void)initialSetup {
    self.fieldNameLabel.text = @"Nome";
    NSDictionary *attributes = [TQTFormTextualElementsStylesheet attributedStringAttributes][@"InputPlaceholder"];
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Alice" attributes:attributes];
    [self.textFieldButton setTitle:@"" forState:UIControlStateNormal];
    self.captionLabel.text = @"Campo obrigatório";
}

#pragma mark - Override
-(NSString *)nibName {
    return [[TQTCustomTextFieldView class] description];
}

-(void)setState:(TQTCustomTextFieldViewState)state {
    [super setState:state];
    switch (state) {
        case TQTCustomTextFieldViewStateError:
            self.captionLabel.text = @"Campo inválido";
            break;
        case TQTCustomTextFieldViewStateActive:
            self.captionLabel.text = @"Campo obrigatório";
            break;
        case TQTCustomTextFieldViewStateDefault:
            self.captionLabel.text = @"Campo obrigatório";
            break;
        case TQTCustomTextFieldViewStateInactive:
            self.captionLabel.text = @"Este campo não pode ser editado";
            break;
        case TQTCustomTextFieldViewStateHighlight:
            break;
        default:
            break;
    }
}
@end
