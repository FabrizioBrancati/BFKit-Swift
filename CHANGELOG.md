Changelog
=========
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
