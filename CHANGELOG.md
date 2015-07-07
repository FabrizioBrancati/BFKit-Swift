Changelog
=========
###Version 1.3.0
- Added a DEMO App
- Added ```init(imageAsTemplate:, tintColor:)``` to create UIImageView with a template image
- Added a new init function in UIColor extension to create UIColor with an HEX in Int
- Added function ```dictionaryToJSON``` and deprecated the old one in NSDictionary extension
- Added ```moveObjectFromIndex``` function in NSMutableArray extension
- NSThread extension is now public and can perform selectors in background
- ```BFLocalizedString``` now doesn't require ```comment``` parameter
- Changed ```BFLogString``` and ```BFDetailedLogString``` from functions to variables
- ```showTouchIDAuthenticationWithReason``` in BFTouchID class now returns ```result``` in closure
- In some UIKit extension the delegate (or data source) can now be ```nil```
- ```searchCharStart``` functions in NSString extension now requires a NSString for start and end
- Changed how to check if is an email in NSString and String extensions
- ```colorForColorString``` has been moved from UIImage to UIColor extension
- Renamed ```image``` variable to ```screenshot``` in ```takeScreenshotWithDelay``` function in UIWindow extension
- Marked some function as obsoleted
- Fixed a bug with ```iOSVersion``` function in UIDevice extension
- Fixed a bug with all the CIFilter in UIImage extension
- Fixed a bug in ```deleteFile``` function in NSFileManager extension
- Fixed a bug in ```safeSetObject``` function in NSMutableDictionary extension

###Version 1.2.0
- Added comments to all classes and extensions
- Added the documentation with [CocoaDocs](http://cocoadocs.org/docsets/BFKit-Swift/)
- Declared public ```colorForColorString``` in UIColor extension
- Declared as deprecated some functions in favor of default values

###Version 1.1.0
- Added Carthage support
- Added all IDs in BFSystemSound class
- Added all font family names and font names in UIFont extension
- Now you can use word like ```red```, ```blue``` or any predefined color in UIColor class to create dummy images with ```UIColor(dummyImageWithSizeAndColor:)```
- Changed ```loadArrayToPath``` to ```loadArrayFromPath``` and now return ```AnyObject?```
- Fixed ```dictionaryToJson:``` in Dictionary extension
- Removed ```cpuUsage``` function in NSProcessInfo extension
- Reverted to old ```BFLog``` function in BFLog class

###Version 1.0.0
- Initial release
