//
//  UIViewAttributes.m
//  Netshoes
//
//  Created by Taqtile on 4/23/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTStylesheets.h"
#import "TQTInvalidStyleRuleException.h"

#define CLASS_SUFFIX @"Stylesheet"

@interface TQTStylesheets()

@property (strong, nonatomic) NSMutableDictionary *stylesheet;

@end

/**
 Name convention:
    style == user input ( == in HTML, what the user would put inside class="...")
    styleContainter == css class
    styleContainterName == css class name
    styleKey == css style rule
    styleValue == css style value
    styleRule == styleKey + styleValue
 **/
@implementation TQTStylesheets

static TQTStylesheets *_instance;

+ (instancetype)sharedInstance {
    if (_instance == nil) {
        [self init];
    }

    return _instance;
}

#pragma mark - Init
+ (void)init {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
}

#pragma mark - Public API
/**
 * import a stylesheet(dictionary) to the main stylesheet
 * @param stylesheet a dictionary with styles
 **/
-(void)import:(NSDictionary *)stylesheet {
    [self.stylesheet addEntriesFromDictionary:stylesheet];
}

/**
 * It gets the styleContainerNames from style and then apply each style rule on view
 * @param style user input
 * @param view view to which the style will be applied
 */
-(void)setStyle:(NSString*) style forView:(UIView*) view {
    [self applyBaseRulesOnView:view usingStylesheet:self.stylesheet];
    [self applyComponentSpecificRulesOnView:view usingStylesheet:self.stylesheet andStyle:style];
}

#pragma mark - private
- (void)applyBaseRulesOnView:(UIView *)view usingStylesheet:(NSDictionary *)mainStylesheet {
    // Apply base rules
    NSDictionary *styleContainer = mainStylesheet[NSStringFromClass([view class])];
    for(NSString *styleKey in styleContainer) {
        [self applyStyleRuleWithStyleKey:styleKey fromStylesheet:styleContainer onView:view];
    }
}

- (void)applyComponentSpecificRulesOnView:(UIView *)view usingStylesheet:(NSDictionary *)mainStylesheet andStyle:(NSString *)style {
    [self applyEachStyleContainerFromStyle:style usingStylesheet:mainStylesheet onView:view];
}

/**
 * This method get each style container the user has entered (for instance, it will get [@"a" , @"b"] from @"a b") and apply the style rules from it on the View. Using the css metaphore, it gets each class the user has entered in the HTML and apply its style rules.
 * @param style user input (ex: @"H1_Label H1_IsHighlighted_Label")
 * @param mainStylesheet dictionary with all styleContainer, styleKeys and styleValue
 * @param view view to which the style will be applied
 */
- (void)applyEachStyleContainerFromStyle:(NSString *)style usingStylesheet:(NSDictionary *)mainStylesheet onView:(UIView *)view {
    NSMutableArray *styleContainerNameArray = [[style componentsSeparatedByString:@" "] mutableCopy];
    [styleContainerNameArray removeObject:@""];
    
    for (NSString *styleContainerName in styleContainerNameArray) {
        NSDictionary *styleContainer = mainStylesheet[styleContainerName];
        for(NSString *styleKey in styleContainer) {
            [self applyStyleRuleWithStyleKey:styleKey fromStylesheet:styleContainer onView:view];
        }
    }
}

/**
 * Set property on a visual element (UIView, CALayer). The property names come from styleKey and the property value comes from stylesheet
 * @param styleKey
 * @param stylesheet
 * @param view
 */
- (void)applyStyleRuleWithStyleKey:(NSString *)styleKey fromStylesheet:(NSDictionary *)stylesheet onView:(UIView *)view {
    NSArray * const properties = [styleKey componentsSeparatedByString:@"."];
    id visualElement = [self elementToApplyStyleKey:styleKey fromView:view];
    
    if ([visualElement respondsToSelector:NSSelectorFromString([properties lastObject])]) {
        [visualElement setValue:[stylesheet objectForKey:styleKey] forKey:[properties lastObject]];
    } else {
        @throw [[TQTInvalidStyleRuleException alloc] initWithView:view style:styleKey];
    }
}

/**
 * gets the element (UIView, CALayer) to apply a style. For instance, if styleKey is @"layer.borderWidth", then this method will return the CALayer of the view.
 * @param styleKey string with properties to get element to be styled (ex: @"layer.borderWidth" - in this case we want to get a layer to style the borderWidth)
 * @param view view from which the element will be get
 * @return id the element to which the style will be applied
 */
- (id)elementToApplyStyleKey:(NSString *)styleKey fromView:(UIView *)view {
    NSArray * const properties = [styleKey componentsSeparatedByString:@"."];
    id visualElement = view;
    
    for (int i = 0; i < [properties count] - 1; i++) {
        if ([visualElement respondsToSelector:NSSelectorFromString(properties[i])]) {
            visualElement = [visualElement valueForKey:properties[i]];
        } else {
            @throw [[TQTInvalidStyleRuleException alloc] initWithView:view style:styleKey];
        }
    }
    return  visualElement;
}

#pragma mark - getter
-(NSMutableDictionary *)stylesheet {
    if (!_stylesheet) {
        _stylesheet = [[NSMutableDictionary alloc] init];
    }
    return _stylesheet;
}

@end
