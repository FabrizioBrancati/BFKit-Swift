<p align="center"><img src="https://github.fabriziobrancati.com/bfkit/resources/banner-swift.png" alt="BFKit Swift Banner"></p>

[![Build Status](https://travis-ci.org/FabrizioBrancati/BFKit-Swift.svg?branch=swift3.0)](https://travis-ci.org/FabrizioBrancati/BFKit-Swift)
[![Codecov](https://codecov.io/gh/FabrizioBrancati/BFKit-Swift/branch/swift3.0/graph/badge.svg)](https://codecov.io/gh/FabrizioBrancati/BFKit-Swift)
[![Codebeat Badge](https://codebeat.co/badges/ba18628d-f16b-4cd4-81f7-f75e81d97b38)](https://codebeat.co/projects/github-com-fabriziobrancati-bfkit-swift)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/BFKit-Swift.svg?style=flat)][CocoaDocs]
[![Language](https://img.shields.io/badge/language-Swift%203.0-orange.svg)](https://developer.apple.com/swift/)
[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20Linux-ffc713.svg)][CocoaDocs]
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/LICENSE)

---

<p align="center">
    <a href="#objective-c-">Objective-C Version</a> &bull;
    <a href="#what-does-it-do">What does it do</a> &bull;
    <a href="#compatibility">Compatibility</a> &bull;
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

Objective-C Version <img src="http://github.fabriziobrancati.com/bfkit/resources/objc-icon.png" height="25" width="25">
===================
If you are looking for Objective-C version check it out here: **[BFKit](https://github.com/FabrizioBrancati/BFKit)**.

What does it do
===============
BFKit is a collection of useful classes to **develop Apps faster**.<br>
For example you can use every **iOS fonts with just an enum!**<br>
It also adds some useful functions with **BF** classes and extends some **Foundation** and **UIKit** classes.

Compatibility
=============
### BFKit
|                                                                                            | **iOS**  | **Linux**  |
|--------------------------------------------------------------------------------------------|----------|------------|
| [BFApp](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Classes/BFApp.html)                 | ✔️       | ✔️         |
| [BFButton](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Classes/BFButton.html)           | ✔️       |            |
| BFDataStructures<br>([List](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Classes/List.html) - [Queue](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Classes/Queue.html) - [Stack](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Classes/Stack.html))                  | ✔️       | ✔️          |
| [BFLog](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Functions.html#/)                   | ✔️       | ✔️         |
| [BFPassword](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Classes/BFPassword.html)       | ✔️       | ✔️         |
| [BFSystemSound](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Classes/BFSystemSound.html) | ✔️       |            |
| [BFTextField](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Classes/BFTextField.html)     | ✔️       |            |
| [BFTouchID](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Classes/BFTouchID.html)         | ✔️       | &nbsp;     |

### Foundation
|                                                                                           | **iOS**  | **Linux**  |
|-------------------------------------------------------------------------------------------|----------|------------|
| [Array](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions.html/Array)             | ✔️       | ✔️          |
| [Collection](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions.html/Collection)   | ✔️       | ✔️          |
| [Data](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/Data.html)               | ✔️       | ✔️          |
| [Date](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/Date.html)               | ✔️       | ✔️          |
| [FileManager](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/FileManager.html) | ✔️       |             |
| [Number](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/Number.html)           | ✔️       | ✔️          |
| [NSObject](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/NSObject.html)       | ✔️       | ✔️          |
| [String](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/String.html)           | ✔️       | ✔️          |
| [Thread](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/Thread.html)           | ✔️       | ✔️          |

### UIKit
|                                                                                                   | **iOS**  | **Linux**  |
|---------------------------------------------------------------------------------------------------|----------|------------|
| [UIBarButtonItem](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIBarButtonItem.html) |  ✔️      |            |
| [UIButton](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIButton.html)               | ✔️       |            |
| [UIColor](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIColor.html)                 | ✔️       |            |
| [UIDevice](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIDevice.html)               | ✔️       |            |
| [UIFont](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIFont.html)                   | ✔️       |            |
| [UIImage](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIImage.html)                 | ✔️       |            |
| [UIImageView](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIImageView.html)         | ✔️       |            |
| [UILabel](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UILabel.html)                 | ✔️       |            |
| [UINavigationBar](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UINavigationBar.html) | ✔️       |            |
| [UIPasteboard](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIPasteboard.html)       | ✔️       |            |
| [UIScreen](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIScreen.html)               | ✔️       |            |
| [UIScrollView](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIScrollView.html)       | ✔️       |            |
| [UITableView](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UITableView.html)         | ✔️       |            |
| [UITextField](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UITextField.html)         | ✔️       |            |
| [UITextView](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UITextView.html)           | ✔️       |            |
| [UIToolbar](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIToolbar.html)             | ✔️       |            |
| [UIView](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIView.html)                   | ✔️       |            |
| [UIWebView](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIWebView.html)             | ✔️       |            |
| [UIWindow](http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/Extensions/UIWindow.html)               | ✔️       | &nbsp;     |

Requirements
============
| **Swift** | **Xcode** | **BFKit version** | **iOS** | **Linux** |
|-----------|-----------|-------------------|---------|-----------|
| 1.2       | 6.3       | 1.0.0...1.4.1     | 7.0+    |           |
| 2.0...2.1 | 7.0       | 1.5.0...1.6.2     | 7.0+    |           |
| 2.2       | 7.3       | 1.6.3...1.7.0     | 7.0+    |           |
| 2.3       | 8.0       | 1.8.0             | 7.0+    |           |
| 3.0       | 8.0...8.1 | 2.0.0             | 8.0+    | ✔️        |

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

See  [Requirements](https://github.com/FabrizioBrancati/BFKit-Swift#requirements) section to check Swift, Xcode, BFKit and OS versions.

### Manual
- Open the **BFKit** folder and build the Framework from the project
- Import BFKit.framework into your project
- Import the Framework with ```import BFKit```
- Enjoy!

### CocoaPods
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
To see what has changed in recent version of BFKit Swift, see the **[CHANGELOG.md](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/CHANGELOG.md)** file.

Demo
====
Open and run the BFKitDemo project in Xcode and see BFKit in action!

Todo
====
- [x] Create great tests and add Codecov badge
- [ ] Add watchOS, tvOS and macOS support
- [x] Add Linux support (Foundation extensions only)
- [ ] Create a new DEMO App that shows all the functionalities of BFKit Swift
- [x] Add Carthage support
- [x] Add to CocoaPods
- [x] Create a great documentation

Author
======
**Fabrizio Brancati**

[Website: https://www.fabriziobrancati.com](https://www.fabriziobrancati.com)
<br>
[Email: fabrizio.brancati@gmail.com](mailto:fabrizio.brancati@gmail.com)

License
=======
BFKit-Swift is available under the MIT license. See the **[LICENSE](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/LICENSE)** file for more info.

[CocoaDocs]: http://cocoadocs.org/docsets/BFKit-Swift/2.0.0/
