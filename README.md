<p align="center"><img src="https://github.fabriziobrancati.com/bfkit/resources/banner-swift.png" alt="BFKit Swift Banner"></p>

[![Build Status](https://travis-ci.org/FabrizioBrancati/BFKit-Swift.svg)](https://travis-ci.org/FabrizioBrancati/BFKit-Swift)
[![Codecov](https://codecov.io/gh/FabrizioBrancati/BFKit-Swift/branch/master/graph/badge.svg)](https://codecov.io/gh/FabrizioBrancati/BFKit-Swift)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/BFKit-Swift.svg?style=flat)][CocoaDocs]
[![Language](https://img.shields.io/badge/language-Swift%203.0-orange.svg)](https://developer.apple.com/swift/)
[![Platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20Linux-ffc713.svg)][CocoaDocs]
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
    <a href="#example">Example</a> &bull;
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
BFKit-Swift is a collection of useful classes, struct and extensions to **develop Apps faster**.<br>
For example you can use every **iOS fonts with just an enum!**<br>
It also adds some useful functions with **BF** classes and extends some **Foundation** and **UIKit** classes.

Compatibility
=============
### BFKit
|                                                                                                           | **iOS**  | **Linux**  |
|-----------------------------------------------------------------------------------------------------------|----------|------------|
| [BFApp](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/BFApp.html)                 | ✔️       | ✔️          |
| [BFButton](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Classes/BFButton.html)           | ✔️       |            |
| BFDataStructures<br>([List](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/List.html) - [Queue](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/Queue.html) - [Stack](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/Stack.html))                  | ✔️       | ✔️          |
| [BFLog](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/BFLog.html/)                | ✔️       | ✔️          |
| [BFPassword](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/BFPassword.html)       | ✔️       | ✔️          |
| [BFSystemSound](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Classes/BFSystemSound.html) | ✔️       |            |
| [BFTextField](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Classes/BFTextField.html)     | ✔️       |            |
| [BFTouchID](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/BFTouchID.html)         | ✔️       | &nbsp;     |

### Foundation
|                                                                                                          | **iOS**  | **Linux**  |
|----------------------------------------------------------------------------------------------------------|----------|------------|
| [Array](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/Array.html)             | ✔️       | ✔️          |
| [Collection](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/Collection.html)   | ✔️       | ✔️          |
| [Data](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/Data.html)               | ✔️       | ✔️          |
| [Date](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/Date.html)               | ✔️       | ✔️          |
| [FileManager](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/FileManager.html) | ✔️       |            |
| [Number](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Functions.html)                   | ✔️       | ✔️          |
| [NSObject](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/NSObject.html)       | ✔️       | ✔️          |
| [ProcessInfo](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/ProcessInfo.html) | ✔️       | ✔️          |
| [String](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/String.html)           | ✔️       | ✔️          |
| [Thread](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/Thread.html)           | ✔️       | ✔️          |

### UIKit
|                                                                                                                    | **iOS**  | **Linux**  |
|--------------------------------------------------------------------------------------------------------------------|----------|------------|
| [UIBarButtonItem](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIBarButtonItem.html)   | ✔️       |            |
| [UIButton](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIButton.html)                 | ✔️       |            |
| [UIColor](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIColor.html)                   | ✔️       |            |
| [UIDevice](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIDevice.html)                 | ✔️       |            |
| [UIFont](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIFont.html)                     | ✔️       |            |
| [UIImage](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIImage.html)                   | ✔️       |            |
| [UIImageView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIImageView.html)           | ✔️       |            |
| [UILabel](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UILabel.html)                   | ✔️       |            |
| [UINavigationBar](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UINavigationBar.html)   | ✔️       |            |
| [UIPasteboard](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIPasteboard.html)         | ✔️       |            |
| [UIScreen](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIScreen.html)                 | ✔️       |            |
| [UIScrollView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIScrollView.html)         | ✔️       |            |
| [UITableView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UITableView.html)           | ✔️       |            |
| [UITextField](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UITextField.html)           | ✔️       |            |
| [UITextView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UITextView.html)             | ✔️       |            |
| [UIToolbar](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIToolbar.html)               | ✔️       |            |
| [UIView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIView.html)                     | ✔️       |            |
| [UIViewController](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIViewController.html) | ✔️       |            |
| [UIWebView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIWebView.html)               | ✔️       |            |
| [UIWindow](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIWindow.html)                 | ✔️       | &nbsp;     |

Requirements
============
| **Swift** | **Xcode** | **BFKit**     | **iOS** | **Linux** |
|-----------|-----------|---------------|---------|-----------|
| 1.2       | 6.3       | 1.0.0...1.4.1 | 7.0+    |           |
| 2.0...2.1 | 7.0       | 1.5.0...1.6.2 | 7.0+    |           |
| 2.2       | 7.3       | 1.6.3...1.7.0 | 7.0+    |           |
| 2.3       | 8.0       | 1.8.0         | 7.0+    |           |
| 3.0       | 8.0...8.1 | 2.0.0...2.0.2 | 8.0+    | ✔️        |

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

See [Requirements](https://github.com/FabrizioBrancati/BFKit-Swift#requirements) section to check Swift, Xcode, BFKit Swift and OS versions.

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

    and add the paths to the BFKit Swift framework under **Input Files**

    ```sh
        $(SRCROOT)/Carthage/Build/iOS/BFKit.framework
    ```
    This script works around an [App Store submission bug](http://www.openradar.me/radar?id=6409498411401216) triggered by universal binaries and ensures that necessary bitcode-related files are copied when archiving
- Import the Framework with ```import BFKit```
- Enjoy!

Documentation
=============
### [CocoaDocs]
100% Documented

Changelog
=========
To see what has changed in recent version of BFKit Swift, see the **[CHANGELOG.md](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/CHANGELOG.md)** file.

Example
=======
Open and run the BFKitExample project in Example folder in this repo, with Xcode and see BFKit Swift in action!

Todo
====
- [ ] Add macOS, watchOS and tvOS support
- [ ] Create a new Example App that shows all the functionalities of BFKit Swift
- [ ] 100% of code coverage with Unit Tests
- [x] Create Unit Tests and add Codecov badge
- [x] Add Linux support (Foundation extensions only)
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

[CocoaDocs]: https://github.fabriziobrancati.com/documentation/BFKit-Swift/
