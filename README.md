<p align="center"><img src="https://github.fabriziobrancati.com/bfkit/resources/banner-swift.png" alt="BFKit Swift Banner"></p>

[![Build Status](https://travis-ci.org/FabrizioBrancati/BFKit-Swift.svg)](https://travis-ci.org/FabrizioBrancati/BFKit-Swift)
[![Codecov](https://codecov.io/gh/FabrizioBrancati/BFKit-Swift/branch/master/graph/badge.svg)](https://codecov.io/gh/FabrizioBrancati/BFKit-Swift)
[![codebeat](https://codebeat.co/badges/ba18628d-f16b-4cd4-81f7-f75e81d97b38)](https://codebeat.co/projects/github-com-fabriziobrancati-bfkit-swift)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/BFKit-Swift.svg?style=flat)][Documentation]
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/LICENSE)
<br>
[![Language](https://img.shields.io/badge/language-Swift%203.0%20/%203.1-orange.svg)](https://developer.apple.com/swift/)
[![Platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20watchOS%20%7C%20Linux-ffc713.svg)][Documentation]

---

<p align="center">
    <a href="#objective-c-">Objective-C Version</a> &bull;
    <a href="#what-does-it-do">What does it do</a> &bull;
    <a href="#classes-and-extensions-compatibility">Classes and Extensions Compatibility</a> &bull;
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
BFKit-Swift is a collection of useful classes, structs and extensions to **develop Apps faster**.<br>
For example you can use every **iOS font with just an enum!**<br>
It also adds some useful functions with **Custom** classes and extends **Foundation**, **UIKit** and **WatchKit** classes.

Classes and Extensions Compatibility
====================================

<details>
<summary><strong>BFKit</strong></summary>

|                                                                                                           | **iOS**    | **watchOS** | **Linux**  |
|-----------------------------------------------------------------------------------------------------------|------------|-------------|------------|
| [BFApp](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/BFApp.html)                 | ![✓]       | ![✓]        | ![✓]       |
| [BFButton](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Classes/BFButton.html)           | ![✓]       |             |            |
| BFDataStructures<br>([List](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/List.html) - [Queue](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/Queue.html) - [Stack](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/Stack.html))                  | ![✓]       | ![✓]        | ![✓]       |
| [BFLog](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/BFLog.html)                 | ![✓]       | ![✓]        | ![✓]       |
| [BFPassword](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/BFPassword.html)       | ![✓]       | ![✓]        | ![✓]       |
| [BFSystemSound](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Classes/BFSystemSound.html) | ![✓]       |             |            |
| [BFTextField](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Classes/BFTextField.html)     | ![✓]       |             |            |
| [BFTouchID](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Structs/BFTouchID.html)         | ![✓]       |             | &nbsp;     |

</details>

<details>
<summary><strong>Foundation</strong></summary>

|                                                                                                                        | **iOS**    | **watchOS** | **Linux**  |
|------------------------------------------------------------------------------------------------------------------------|------------|-------------|------------|
| [Array](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/Array.html)                           | ![✓]       | ![✓]        | ![✓]       |
| [Collection](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/Collection.html)                 | ![✓]       | ![✓]        | ![✓]       |
| [Data](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/Data.html)                             | ![✓]       | ![✓]        | ![✓]       |
| [Date](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/Date.html)                             | ![✓]       | ![✓]        | ![✓]       |
| [FileManager](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/FileManager.html)               | ![✓]       | ![✓]        |            |
| [Number](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Functions.html)                                 | ![✓]       | ![✓]        | ![✓]       |
| [NSObject](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/NSObject.html)                     | ![✓]       | ![✓]        | ![✓]       |
| [NSAttributedString](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/NSAttributedString.html) | ![✓]       | ![✓]        |            |
| [NSPointerArray](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/NSPointerArray.html)         | ![✓]       | ![✓]        |            |
| [ProcessInfo](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/ProcessInfo.html)               | ![✓]       | ![✓]        | ![✓]       |
| [String](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/String.html)                         | ![✓]       | ![✓]        | ![✓]       |
| [Thread](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Functions.html)                                 | ![✓]       | ![✓]        | ![✓]       |

</details>

<details>
<summary><strong>UIKit</strong></summary>

|                                                                                                                                         | **iOS**    | **watchOS** | **Linux**  |
|-----------------------------------------------------------------------------------------------------------------------------------------|------------|-------------|------------|
| [UIBarButtonItem](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIBarButtonItem.html)                        | ![✓]       |             |            |
| [UIButton](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIButton.html)                                      | ![✓]       |             |            |
| [UIColor](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIColor.html)                                        | ![✓]       | ![✓]        |            |
| [UIDevice](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIDevice.html)                                      | ![✓]       |             |            |
| [UIFont](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIFont.html)                                          | ![✓]       | ![✓]        |            |
| [UIImage](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIImage.html)                                        | ![✓]       | ![✓]        |            |
| [UIImageView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIImageView.html)                                | ![✓]       |             |            |
| [UILabel](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UILabel.html)                                        | ![✓]       |             |            |
| [UINavigationBar](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UINavigationBar.html)                        | ![✓]       |             |            |
| [UIPasteboard](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIPasteboard.html)                              | ![✓]       |             |            |
| [UIScreen](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIScreen.html)                                      | ![✓]       |             |            |
| [UIScrollView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIScrollView.html)                              | ![✓]       |             |            |
| [UITableView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UITableView.html)                                | ![✓]       |             |            |
| [UITextField](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UITextField.html)                                | ![✓]       |             |            |
| [UITextView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UITextView.html)                                  | ![✓]       |             |            |
| [UIToolbar](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIToolbar.html)                                    | ![✓]       |             |            |
| [UIView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIView.html)                                          | ![✓]       |             |            |
| [UIViewController](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/Sources/BFKit/iOS/UIKit/UIViewControllerExtension.swift) | ![✓]       |             |            |
| [UIWebView](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIWebView.html)                                    | ![✓]       |             |            |
| [UIWindow](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/UIWindow.html)                                      | ![✓]       |             | &nbsp;     |

</details>

<details>
<summary><strong>WatchKit</strong></summary>

|                                                                                                                                         | **iOS**    | **watchOS** | **Linux**  |
|----------------------------------------------------------------------------------------------------------------------------|------------|-------------|------------|
| [WKInterfaceController](https://github.fabriziobrancati.com/documentation/BFKit-Swift/Extensions/WKInterfaceController.html) |            | ![✓]        |            |

</details>

Requirements
============
| **Swift** | **Xcode** | **BFKit Swift** | **iOS** | **watchOS** | **Linux** |
|-----------|-----------|-----------------|---------|-------------|-----------|
| 1.2       | 6.3       | 1.0.0...1.4.1   | 7.0+    |             |           |
| 2.0...2.1 | 7.0       | 1.5.0...1.6.2   | 7.0+    |             |           |
| 2.2       | 7.3       | 1.6.3...1.7.0   | 7.0+    |             |           |
| 2.3       | 8.0       | 1.8.0           | 7.0+    |             |           |
| 3.0...3.1 | 8.0...8.3 | 2.0.0...2.3.0   | 8.0+    |             | ![✓]      |
| 3.0...3.1 | 8.0...8.3 | 2.4.0...2.4.1   | 8.0+    | 2.0+        | ![✓]      |

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
- Open and build the framework from the project (**BFKit.xcodeproj**)
- Import BFKit.framework into your project
- Import the framework with ```import BFKit```
- Enjoy!

### CocoaPods
- Create a **Podfile** in your **project directory** and write into:

    ```ruby
    platform :ios, '8.0'
    xcodeproj 'Project.xcodeproj'
    use_frameworks!

    pod 'BFKit-Swift'
    ```
- Change **"Project"**  with your **real project name**
- Open **Terminal**, go to your **project directory** and type: ```pod install```
- Import the framework with ```import BFKit```
- Enjoy!

### Carthage
- Create a **Cartfile** in your **project directory** and write into:

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
- Import the framework with ```import BFKit```
- Enjoy!

### Swift Package Manager (Linux)
- Create a **Package.swift** file in your **project directory** and write into:

    ```swift
    import PackageDescription

    let package = Package(
        name: "Project",
        dependencies: [
            .Package(url: "https://github.com/FabrizioBrancati/BFKit-Swift.git", majorVersion: 2)
        ]
    )
    ```
- Change **"Project"**  with your **real project name**
- Open **Terminal**, go to **project directory** and type: ```swift build```
- Import the framework with ```import BFKit```
- Enjoy!

Documentation
=============
### [Documentation]
100% Documented

Changelog
=========
To see what has changed in recent versions of BFKit Swift, see the **[CHANGELOG.md](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/CHANGELOG.md)** file.

Example
=======
Open and run the BFKitExample project in Example folder in this repo, with Xcode and see BFKit Swift in action!

Todo
====
- [ ] Add macOS and tvOS support
- [ ] Create a new Example App that shows all the functionalities of BFKit Swift
- [ ] 100% of code coverage with Unit Tests
- [ ] Improve code to get an _A_ from codebeat
- [x] Add watchOS support
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

[Documentation]: https://github.fabriziobrancati.com/documentation/BFKit-Swift/
[✓]: https://github.fabriziobrancati.com/bfkit/resources/check.png
