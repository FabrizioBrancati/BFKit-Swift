<p align="center"><img src="https://github.fabriziobrancati.com/bfkit/resources/banner-swift.png" alt="BFKit Swift Banner"></p>

[![Build Status](https://travis-ci.org/FabrizioBrancati/BFKit-Swift.svg?branch=swift3.0)](https://travis-ci.org/FabrizioBrancati/BFKit-Swift)
[![Codecov](https://codecov.io/gh/FabrizioBrancati/BFKit-Swift/branch/swift3.0/graph/badge.svg)](https://codecov.io/gh/FabrizioBrancati/BFKit-Swift)
[![Codebeat Badge](https://codebeat.co/badges/ba18628d-f16b-4cd4-81f7-f75e81d97b38)](https://codebeat.co/projects/github-com-fabriziobrancati-bfkit-swift)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/BFKit-Swift.svg?style=flat)][CocoaDocs]
[![Language](https://img.shields.io/badge/language-Swift%203.0-orange.svg)](https://developer.apple.com/swift/)
[![Platform](https://img.shields.io/badge/platform-iOS-ffc713.svg)][CocoaDocs]
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/LICENSE)

---

<p align="center">
    <a href="#objective-c-">Objective-C Version</a> &bull;
    <a href="#what-does-it-do">What does it do</a> &bull;
    <a href="#language-support">Language support</a> &bull;
    <a href="#requirements">Requirements</a> &bull;
    <a href="#communication">Communication</a> &bull;
    <a href="#contributing">Contributing</a> &bull;
    <a href="#installing-and-usage">Installing and Usage</a> &bull;
    <a href="#documentation">Documentation</a> &bull;
    <a href="#changelog">Changelog</a> &bull;
    <a href="#demo">Demo</a> &bull;
    <a href="#todo">Todo</a> &bull;
    <a href="#author">Author</a> &bull;
    <a href="#license">License</a>
</p>

---

# This branch is currently under development
### It supports Swift 3 and will include a big refactoring of the entire framework

Objective-C Version <img src="http://github.fabriziobrancati.com/bfkit/resources/objc-icon.png" height="25" width="25">
===================
If you are looking for Objective-C version check it out here: **[BFKit](https://github.com/FabrizioBrancati/BFKit)**.

What does it do
===============
BFKit is a collection of useful classes to **develop Apps faster**.

For example you can use every iOS font with just an enum!

It also adds some useful method to some classes like:

### BFKit:
- [BFApp](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Classes/BFApp.html)
- [BFButton](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Classes/BFButton.html)
- BFDataStructures ([List](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Classes/List.html) - [Queue](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Classes/Queue.html) - [Stack](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Classes/Stack.html))
- [BFLog](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Functions.html#/) - [See this post on how to properly use it](http://stackoverflow.com/a/26891797/4032046)
- [BFPassword](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Classes/BFPassword.html)
- [BFSystemSound](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Classes/BFSystemSound.html)
- [BFTouchID](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Classes/BFTouchID.html) (iOS 8 or later)

### Foundation:
- [Array](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions.html#/s:Sa)
- [Dictionary](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions.html#/s:VSs10Dictionary)
- [NSArray](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSArray.html)
- [NSDate](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSDate.html)
- [NSDictionary](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSDictionary.html)
- [NSFileManager](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSFileManager.html)
- [NSMutableArray](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSMutableArray.html)
- [NSMutableDictionary](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSMutableDictionary.html)
- [NSNumber](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSNumber.html)
- [NSObject](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSObject.html)
- [NSProcessInfo](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions.html#/)
- [NSString](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSString.html)
- [NSThread](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/NSThread.html)
- [String](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/String.html)

### UIKit:
- [UIBarButtonItem](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIBarButtonItem.html)
- [UIButton](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIButton.html)
- [UIColor](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIColor.html)
- [UIDevice](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIDevice.html)
- [UIFont](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIFont.html)
- [UIImage](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIImage.html)
- [UIImageView](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIImageView.html)
- [UILabel](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UILabel.html)
- [UINavigationBar](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UINavigationBar.html)
- [UIScreen](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIScreen.html)
- [UIScrollView](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIScrollView.html)
- [UITableView](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UITableView.html)
- [UITextField](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UITextField.html)
- [UITextView](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UITextView.html)
- [UIToolbar](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIToolbar.html)
- [UIView](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIView.html)
- [UIWebView](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIWebView.html)
- [UIWindow](http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/Extensions/UIWindow.html)

Language support
================
- Brazilian Portuguese (pt-Br)
- English (en)
- French (fr)
- Indonesian (id)
- Italian (it)
- Russian (ru)
- Simplified Chinese (zh-Hans)
- Swedish (sv)
- Traditional Chinese (zh-Hant)
- Ukrainian (uk)
- Vietnamese (vi)

Requirements
============
### I you need support for iOS 7
- iOS SDK **7.0** if you copy the Framework files (Source folder).
- iOS SDK **8.0** if you use it as a Framework.

- **Swift 1.2** and **Xcode 6.3** or later, for version **1.4.1** or previous.
- **Swift 2.0** or **2.1** and **Xcode 7.0** or later, for version **1.5.0** or later.
- **Swift 2.2** and **Xcode 7.3** or later, for version **1.6.3** or later.

### I you need support for iOS 8
- **Swift 2.3** and **Xcode 8.0** or later, for version **1.8.0** or later.
- **Swift 3.0** and **Xcode 8.0** or later, for version **2.0.0** or later.

Communication
=============
- If you need help, use Stack Overflow.
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, see [Contributing](https://github.com/FabrizioBrancati/BFKit-Swift#contributing) section.

Contributing
============
See [CONTRIBUTING.md](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/.github/CONTRIBUTING.md) file.

Installing and Usage
====================

---

### Swift 1.2, 2.0, 2.1, 2.2 or 3.0
If you need support for Swift 1.2 use BFKit Swift 1.4.1 or previous.<br>
From 1.5.0 BFKit Swift supports Swift 2.0 and 2.1.<br>
From 1.6.3 BFKit Swift supports Swift 2.2.<br>
From 1.8.0 BFKit Swift supports Swift 2.3.<br>
From 2.0.0 BFKit Swift supports Swift 3.0.<br>
More info here: [Requirements](https://github.com/FabrizioBrancati/BFKit-Swift#requirements).

---

### Manual
- Open the **BFKit** folder and build the Framework from the project
- Import BFKit.framework into your project
- Import the Framework with ```import BFKit```
- Enjoy!

### CocoaPods
#### Short version
- ```pod 'BFKit-Swift'```
- Import the Framework with ```import BFKit```
- Enjoy!

#### Long version
- Create a **Podfile** in your **project directory**
- Write:
```ruby
    platform :ios, '8.0'
    xcodeproj 'Project.xcodeproj'
    use_frameworks!

    pod 'BFKit-Swift'
```
- Change **"Project"**  with your **real project name**
- Open **Terminal**, go to **project directory** and type: ```pod install```
- Import the Framework with ```import BFKit```
- Enjoy!

### Carthage
#### Short version
- ```github "FabrizioBrancati/BFKit-Swift"```
- Import the Framework with ```import BFKit```
- Enjoy!

#### Long version
- Create a **Cartfile** in your **project directory**
- Write:
```ruby
    github "FabrizioBrancati/BFKit-Swift"
```
- Open **Terminal**, go to **project directory** and type: ```carthage update```
- **Include the created Framework** in your project
- **Add Build Phase** with the following contents:
    ```sh
        /usr/local/bin/carthage copy-frameworks
    ```

    and add the paths to the BFKit framework under **Input Files**

    ```sh
        $(SRCROOT)/Carthage/Build/iOS/BFKit.framework
    ```
    This script works around an [App Store submission bug](http://www.openradar.me/radar?id=6409498411401216) triggered by universal binaries and ensures that necessary bitcode-related files are copied when archiving
- Import the Framework with ```import BFKit```
- Enjoy!

Documentation
=============
### [CocoaDocs] - 100% Documented

Changelog
=========
To see what has changed in recent version of BFKit Swift, see the **[CHANGELOG](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/CHANGELOG.md)**.

Demo
====
Open and run the BFKitDemo project in Xcode and see BFKit in action!

Todo
====
- [ ] Create great tests and add Codecov badge
- [ ] Add watchOS, tvOS and MacOS support
- [X] Add Linux support (Only Foundation Extensions)
- [ ] Add CPU App usage function in NSProcessInfo extension
- [ ] Create a new DEMO App that shows all the functionalities of BFKit Swift
- [x] Add Carthage support
- [x] Add to CocoaPods
- [x] Create a great documentation

Author
======
**Fabrizio Brancati**

[![Website](https://img.shields.io/badge/website-fabriziobrancati.com-4fb0c8.svg)](http://www.fabriziobrancati.com)
<br>
[![Email](https://img.shields.io/badge/email-fabrizio.brancati%40gmail.com-green.svg)](mailto:fabrizio.brancati@gmail.com)

License
=======
BFKit-Swift is available under the MIT license. See the **[LICENSE](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/LICENSE)** file for more info.

[CocoaDocs]: http://cocoadocs.org/docsets/BFKit-Swift/1.8.0/
