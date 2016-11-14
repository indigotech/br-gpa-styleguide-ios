This is the folder for the component style rules.

# How to create a component stylesheet

To add your component:
1. Create a file .h and .m for your class. The file name has the following format (in eBNF - [Extended Backus Naur Form](http://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_Form)):
```
    component_name "Stylesheet"
```
2. Declare a class method 'stylesheet' in you .h:
``` objective-c
    + (NSDictionary *)stylesheet;
```
3. To add styles to your component,add to the dictionary in the `stylesheet` method:
 - your component attribute name as the key of the dictionary
 - a dictionary containing the properties and theirs values as the value of the dictionary.

 ex of a implementation of `stylesheet`:
``` objective-c
    return @{
             @"YourComponentAttributeName": @{
                     @"propertyNameOfYourComponent": VALUE_OF_PROPERTY,
                     },
             };
```
4. Finally, import your just created stylesheet using TQTStylesheets. To do it, call the import method 
Ex:
``` objective-c
TQTStylesheets *sharedInstance = [TQTStylesheets sharedInstance];
[sharedInstance import:[TQTBaseStylesheet stylesheet]];
```

# YourComponentAttributeName name convention

The YourComponentAttributeName has the following convention (in eBNF):
```
    component_name + subcomponent_name + ["_Type" + type_name] + ["_Is" + state_name] + "_" + class_name_without_UI
```
obs:component_name, subcomponent_name, type_name, state_name, class_name_without_UI are all CamelCase

# BaseStylesheet

You can create BaseStylesheet which is a stylesheet that contains rules for the
basic UI classes, for instance, UILabel, UITextField etc.