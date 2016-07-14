<p align="center"><img src="http://github.fabriziobrancati.com/bfkit/resources/banner-swift.png" alt="BFKit Swift Banner"></p>

[![Build Status](https://travis-ci.org/FabrizioBrancati/BFKit-Swift.svg?branch=master)](https://travis-ci.org/FabrizioBrancati/BFKit-Swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/BFKit-Swift.svg?style=flat)][CocoaDocs]
[![Language](https://img.shields.io/badge/language-Swift%201.2%20/%202.0%20/%202.1%20/%202.2-orange.svg)](https://developer.apple.com/swift/)
[![Platform](https://img.shields.io/badge/platform-iOS-ffc713.svg)][CocoaDocs]
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/FabrizioBrancati/BBFKit-Swift/blob/master/LICENSE)

---

<p align="center">
    <a href="#objective-c-">Objective-C Version</a> &bull;
    <a href="#what-does-it-do-question">What does it do</a> &bull;
    <a href="#language-support-it">Language support</a> &bull;
    <a href="#requirements-iphone">Requirements</a> &bull;
    <a href="#communication-speaker">Communication</a> &bull;
    <a href="#contributing-octocat">Contributing</a> &bull;
    <a href="#installing-and-usage-computer">Installing and Usage</a> &bull;
    <a href="#documentation-100">Documentation</a> &bull;
    <a href="#changelog-bookmark_tabs">Changelog</a> &bull;
    <a href="#demo-wrench">Demo</a> &bull;
    <a href="#todo-ballot_box_with_check">Todo</a> &bull;
    <a href="#author-neckbeard">Author</a> &bull;
    <a href="#license-scroll">License</a>
</p>

---

### If you need support for Swift 3 please switch to ```swift3.0``` branch

Objective-C Version <img src="http://github.fabriziobrancati.com/bfkit/resources/objc-icon.png" height="25" width="25">
===================
If you are looking for Objective-C version check it out here: **[BFKit](https://github.com/FabrizioBrancati/BFKit)**

What does it do :question:
==========================
BFKit is a collection of useful classes to **develop Apps faster**.

For example you can use every iOS font with just an enum!

To better use of the framework I recommend you to use [FuzzyAutocomplete](https://github.com/FuzzyAutocomplete/FuzzyAutocompletePlugin) Xcode plugin to better find functions while coding.

It also adds some useful method to some classes like:

### BFKit:
- [BFApp](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Classes/BFApp.html)
- [BFButton](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Classes/BFButton.html)
- BFDataStructures ([List](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Classes/List.html) - [Queue](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Classes/Queue.html) - [Stack](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Classes/Stack.html))
- [BFLog](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Functions.html#/) - [See this post on how to properly use it](http://stackoverflow.com/a/26891797/4032046)
- [BFPassword](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Classes/BFPassword.html)
- [BFSystemSound](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Classes/BFSystemSound.html)
- [BFTouchID](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Classes/BFTouchID.html) (iOS 8 or later)

### Foundation:
- [Array](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions.html#/s:Sa)
- [Dictionary](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions.html#/s:VSs10Dictionary)
- [NSArray](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSArray.html)
- [NSDate](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSDate.html)
- [NSDictionary](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSDictionary.html)
- [NSFileManager](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSFileManager.html)
- [NSMutableArray](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSMutableArray.html)
- [NSMutableDictionary](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSMutableDictionary.html)
- [NSNumber](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSNumber.html)
- [NSObject](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSObject.html)
- [NSProcessInfo](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions.html#/)
- [NSString](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSString.html)
- [NSThread](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/NSThread.html)
- [String](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/String.html)

### UIKit:
- [UIBarButtonItem](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIBarButtonItem.html)
- [UIButton](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIButton.html)
- [UIColor](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIColor.html)
- [UIDevice](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIDevice.html)
- [UIFont](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIFont.html)
- [UIImage](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIImage.html)
- [UIImageView](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIImageView.html)
- [UILabel](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UILabel.html)
- [UINavigationBar](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UINavigationBar.html)
- [UIScreen](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIScreen.html)
- [UIScrollView](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIScrollView.html)
- [UITableView](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UITableView.html)
- [UITextField](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UITextField.html)
- [UITextView](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UITextView.html)
- [UIToolbar](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIToolbar.html)
- [UIView](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIView.html)
- [UIWebView](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIWebView.html)
- [UIWindow](http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/Extensions/UIWindow.html)

Language support :it:
=====================
- Brazilian Portuguese (pt-Br)
- English (en)
- Indonesian (id)
- Italian (it)
- Russian (ru)
- Simplified Chinese (zh-Hans)
- Swedish (sv)
- Traditional Chinese (zh-Hant)
- Ukrainian (uk)
- Vietnamese (vi)

Requirements :iphone:
=====================
- iOS SDK **7.0** if you copy the Framework files (Source folder)
- iOS SDK **8.0** if you use it as a Framework
- **Swift 1.2** and **Xcode 6.3** or later, for version **1.4.1** or previous
- **Swift 2.0** or **2.1** and **Xcode 7.0** or later, for version **1.5.0** or later
- **Swift 2.2** and **Xcode 7.3** or later, for version **1.6.3** or later

Communication :speaker:
=======================
- If you need help, use Stack Overflow.
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, see [Contributing](https://github.com/FabrizioBrancati/BFKit-Swift#contributing-octocat) section.

Contributing :octocat:
======================
See [CONTRIBUTING.md](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/.github/CONTRIBUTING.md) file.

Installing and Usage :computer:
===============================

---

### Swift 1.2, 2.0, 2.1 or 2.2
If you need support for Swift 1.2 use BFKit Swift 1.4.1 or previous.<br>
From 1.5.0 BFKit Swift supports Swift 2.0 and 2.1.<br>
From 1.6.3 BFKit Swift supports Swift 2.2.<br>
More info here: [Requirements](https://github.com/FabrizioBrancati/BFKit-Swift#requirements-iphone)

---

### iOS 7 or later compatible
#### Manual
- Copy the **Source** folder to the project
- Enjoy!
- N.B.: You will no longer need to import BFKit since you are not actually loading a framework

### iOS 8 or later compatible
#### Manual
- Open the **BFKit** folder and build the Framework from the project
- Import BFKit.framework into your project
- Import the Framework with ```import BFKit```
- Enjoy!

#### CocoaPods
##### Pro version
- ```pod 'BFKit-Swift'```
- Import the Framework with ```import BFKit```
- Enjoy!

##### Newbie version
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

#### Carthage
##### Pro version
- ```github "FabrizioBrancati/BFKit-Swift"```
- Import the Framework with ```import BFKit```
- Enjoy!

##### Newbie version
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

Documentation :100:
===================
### [CocoaDocs] - 100% Documented

Changelog :bookmark_tabs:
=========================
To see what has changed in recent version of BFKit Swift, see the **[CHANGELOG](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/CHANGELOG.md)**

Demo :wrench:
=============
Open and run the BFKitDemo project in Xcode and see BFKit in action!

Todo :ballot_box_with_check:
============================
- :heavy_minus_sign: Create great tests and add Coveralls badge
- :heavy_minus_sign: Add support to watchOS, tvOS and MacOS
- :heavy_minus_sign: Add CPU App usage function in NSProcessInfo extension
- :heavy_minus_sign: Add Hashing functions (MD5, SHA1, SHA256, SHA512, AES128 & AES256) in String and NSString extension, without using CommonCrypto from Objective-C
- :heavy_minus_sign: Create a new DEMO App that shows all the functionalities of BFKit Swift
- :heavy_check_mark: Add Carthage support
- :heavy_check_mark: Add to CocoaPods
- :heavy_check_mark: Create a great documentation

Author :neckbeard:
==================
**Fabrizio Brancati**

[![Website](https://img.shields.io/badge/website-fabriziobrancati.com-4fb0c8.svg)](http://www.fabriziobrancati.com)
<br>
[![Email](https://img.shields.io/badge/email-fabrizio.brancati%40gmail.com-green.svg)](mailto:fabrizio.brancati@gmail.com)

License :scroll:
================
BFKit-Swift is available under the MIT license. See the **[LICENSE](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/LICENSE)** file for more info.

[CocoaDocs]: http://cocoadocs.org/docsets/BFKit-Swift/1.7.0/
