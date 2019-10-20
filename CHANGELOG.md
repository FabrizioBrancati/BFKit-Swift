Changelog
=========

---

All notable changes to this project will be documented in this file.<br>
`BFKit-Swift` adheres to [Semantic Versioning](http://semver.org/).

---

### 6.x Releases
- `6.0.x` Releases - [6.0.0](#600---swift-51-support) | [6.0.1](#401---fixing-pod)

### 5.x Releases
- `5.0.x` Releases - [5.0.0](#500---swift-50-support)

### 4.x Releases
- `4.1.x` Releases - [4.1.0](#410---spend-that-money)
- `4.0.x` Releases - [4.0.0](#400---swift-42-support) | [4.0.1](#401---release-it-please)

### 3.x Releases
- `3.2.x` Releases - [3.2.0](#320---big-improvements) | [3.2.1](#321---that-corner-radius)
- `3.1.x` Releases - [3.1.0](#310---face-id-support) | [3.1.1](#311---some-improvements) | [3.1.2](#311---swift-41-support)
- `3.0.x` Releases - [3.0.0](#300---swift-4-support)

### 2.x Releases
- `2.6.x` Releases - [2.6.0](#260---macos-support)
- `2.5.x` Releases - [2.5.0](#250---better-gradients-and-dates)
- `2.4.x` Releases - [2.4.0](#240---watchos-support) | [2.4.1](#241---swift-package-manager-returns)
- `2.3.x` Releases - [2.3.0](#230---minor-breaking-changes)
- `2.2.x` Releases - [2.2.0](#220---cryptographically-first) | [2.2.1](#221---better-log) | [2.2.2](#222---swift-31-ready)
- `2.1.x` Releases - [2.1.0](#210---napalm-explosion)
- `2.0.x` Releases - [2.0.0](#200---a-new-beginning) | [2.0.1](#201---linux-compatibility) | [2.0.2](#202---linux-doesnt-like-emoji)

### 1.x Releases
- `1.8.x` Releases - [1.8.0](#180)
- `1.7.x` Releases - [1.7.0](#170)
- `1.6.x` Releases - [1.6.0](#160) | [1.6.1](#161) | [1.6.2](#162) | [1.6.3](#163) | [1.6.4](#164)
- `1.5.x` Releases - [1.5.0](#150) | [1.5.1](#151)
- `1.4.x` Releases - [1.4.0](#140) | [1.4.1](#141)
- `1.3.x` Releases - [1.3.0](#130) | [1.3.1](#131)
- `1.2.x` Releases - [1.2.0](#120)
- `1.1.x` Releases - [1.1.0](#110)
- `1.0.x` Releases - [1.0.0](#100)

---

## [6.0.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/6.0.1) - Fixing Pod
### 20 Oct 2019
### Fixed
- Fixed `swift_version` in podspec file

---

## [6.0.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/6.0.0) - Swift 5.1 Support
### 20 Oct 2019
### Added
- Added support to Xcode 11.1 and Swift 5.1
- Added support to WKWebView [#44](https://github.com/FabrizioBrancati/BFKit-Swift/pull/44)
- Added iPhone 11, 11 Pro and 11 Pro Max in UIDevice extension

### Deprecated
- Deprecated `FontName` and `FamilyFontName` in UIFont extension

### Removed
- Removed support to UIWebView [#44](https://github.com/FabrizioBrancati/BFKit-Swift/pull/44)
- Removed `isURLValid` on Linux

### Improved
- Updated SwiftLint to 0.35.0

Thanks to [@Tripwire999](https://github.com/Tripwire999) for this release

---

## [5.0.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/5.0.0) - Swift 5.0 Support
### 23 Apr 2019
### Added
- Added support to Xcode 10.2 and Swift 5.0

### Changed
- Renamed `countSymbols()` to `countPunctuations()` in String extension, the old one has been deprecated but still valid
- Changed parameter type and return type of `degreesToRadians(_:)` and `radiansToDegrees(_:)` from `Float` to `Double` in Number extension
- Changed parameter type of `rotate(radians:)` and `rotate(degrees:)` from `Float` to `Double` in UIImage extension
- Changed `search(_:)` function in List struct that now returns `Int` instead of `Int?` by returning `-1` instead of `nil` if the `Element` is not found
- Changed BFLog messages from emojis to `[ERROR]`, `[WARNING]`, `[DEBUG]` and `[INFO]`
- Changed the behavior of Calendar instances in Date extension on Linux

### Improved
- Improved `count*` chars functions in String extension
- Improved build performance
- Updated SwiftLint to 0.31.0

### Removed
- Removed all the deprecated functions and variables

---

## [4.1.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/4.1.0) - Spend That Money
### 03 Feb 2019
### Added
- Added iPhone XS, iPhone XS Max and iPhone XR in UIDevice extension
- Added `isFromTestFlight` function in BFApp enum to check if the app has been installed from TestFlight

Thanks to [@gennick](https://github.com/gennick) for this release

---

## [4.0.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/4.0.1) - Release It Please
### 27 Dec 2018
### Added
- Added new iPad Pro 11-inch and 12.9-inch in UIDevice extension
- Added missing CoreGraphics files to CocoaPods

### Improved
- Improved settings reading and saving in FileManager extension
- Updated SwiftLint to 0.29.2

### Removed
- Removed watchOS 2.0 support in favor of watchOS 3.0, thanks to an App Store submission bug [#11](https://github.com/FabrizioBrancati/Queuer/issues/11)

---

## [4.0.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/4.0.0) - Swift 4.2 Support
### 11 Oct 2018
### Added
- Added support to Xcode 10 and Swift 4.2
- Added `localized` and `numberValue` variables in String extension
- Added `queryStringParameter(parameter:)`, `queryDictionary()` and `urlValid()` functions in String extension

### Changed
- BFTouchID is deprecated and will be removed in a future version of BFKit-Swift. Please use BFBiometrics enum instead
- `lightFont` in UIFont extension is deprecated and will be removed in a future version of BFKit-Swift
- `regularFont` in UIFont extension is deprecated and will be removed in a future version of BFKit-Swift
- `boldFont` in UIFont extension is deprecated and will be removed in a future version of BFKit-Swift
- All random functions in Number extension are deprecated and will be removed in a future version of BFKit-Swift
- Changed from Codecov to Coveralls service for code coverage

### Improved
- Updated package tools version to 4.2

### Fixed
- Now `.applicationSupport` case available in `PathType` enum in `FileManager` extension fully works, even if Application Support folder doesn't exist

---

## [3.2.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/3.2.1) - That Corner Radius
### 14 Sep 2018
### Improved
- Updated SwiftLint to 0.27.0

### Fixed
- Fixed wrong corner radius in `cornerRadius(corners:, radius:)` function in UIView extension

---

## [3.2.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/3.2.0) - Big Improvements
### 14 Jul 2018
### Added
- Added `force` attribute to `generateUniqueIdentifier(save: Bool = default, force: Bool = default)` in UIDevice extension with a default value, hence no changes are required
- Added `resetFirstStart(version: String = default)` in BFApp struct, to reset the App like has never been opened
- Added FileManager extension to Linux

### Improved
- Improved code of a lot of classes / structs and enums
- Updated SwiftLint to 0.26.0
- Use of `canImport()` instead of `os()`
- Converted static only structs to enums to avoid initialization
- Removed all force unwrapping to avoid possible crashes
- Fixing some memory leaks

### Deprecated
- BFTouchID struct in favour of BFBiometrics enum
- `lightFont`, `mediumFont` and `boldFont` from UIFont extension
- `length` in favour of `count` in String extension

### Removed
- Removed Hound CI

---

## [3.1.2](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/3.1.2) - Swift 4.1 Support
### 2 Apr 2018
### Added
- Added support to Xcode 9.3 and Swift 4.1

---

## [3.1.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/3.1.1) - Some Improvements
### 18 Feb 2017
### Added
- Added `swift_version` property in podspec file for CocoaPods 1.4.0
- Added Hound CI

### Improved
- Now `cornerRadius(corners:, radius:)` function in UIView extension uses `maskedCorners` for iOS 11 or above
- `fadeDuration` in BFButton class is now a TimeInterval
- Updated device names based on [The iPhone Wiki](https://www.theiphonewiki.com/wiki/Models)
- Updated SwiftLint to 0.25.0

### Fixed
- Now Swift Package Manager correctly builds BFKit-Swift with Swift 4

---

## [3.1.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/3.1.0) - Face ID Support
### 26 Dec 2017
### Added
- Added BFBiometrics struct to help handling Face ID and / or Touch ID
- Added two new custom operators on Number extension: `<>` and `<=>` to check if a number is included in a tuple of values
- Added `isUUID()`, `isUUIDForAPNS()` and `replacingMatches(regex:, with:)` to Linux in String extension

### Improved
- Improved compilation time in `blur()` function in UIImage extension
- Improved `debug` and `release` code execution on BFApp struct
- Changed `generateUniqueIdentifier()` to `generateUniqueIdentifier(save: Bool = default)` in UIDevice extension to be able to keep the generated identifier across multiple sessions, defaults to `false`, so no changes are required
- Updated SwiftLint to 0.24.0
- Updated README.md to latest Carthage changes

Thanks to [@tomasz-czyzak](https://github.com/tomasz-czyzak) for this release

---

## [3.0.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/3.0.0) - Swift 4 Support
### 23 Sep 2017
### Added
- Added support to Swift 4 and Xcode 9
- Added support to App Extensions
- Added `setTabBarVisible(_:, animated:, duration:)` and `isTabBarVisible` in UIViewController extension

### Improved
- Updated SwiftLint to 0.22.0
- Now `gradient(colors:, direction:)` returns a `CAGradientLayer` as a `@discardableResult`, so no changes are required

### Fixed
- Fixed a bug on `substring(to:)` function on String extension [#32](https://github.com/FabrizioBrancati/BFKit-Swift/issues/32)
- Fixed non designable `UIView`s

### Changed
- Changed `UIViewLinearGradientDirection` to `UIViewGradientDirection` enum name and properties in UIView extension. Easy transition, rename only
- Changed `smoothLinearGradient(colors:, direction:)` to `smoothGradient(colors:, direction:, type: = default)` to allow radial gradients in UIView extension. Easy transition, thanks to default value
- Removed `appDelegate` global variable
- Changed `reversed(preserveFormat: = default)` to `eversed(preserveFormat:)` in String extension because is used instead of `reversed()` original String function

Thanks to [@wdcurry](https://github.com/wdcurry) for this release

---

## [2.6.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.6.0) - macOS Support
### 26 Jul 2017
### Added
- Added macOS Support
- Added `dateSeparator` and `timeSeparator` to `init?(date:, time:)` with a `default` value, so no changes are required
- Added `flatten<T>(_ array:)` generic global function in Array extension

### Improved
- Removed Apple Watch device from UIDevice extension (Can't be used)
- Removed support for iOS 7 in UIImage extension (Refuse)
- Improved BFPassword struct
- Improved tests

### Fixed
- Fixed missing style in `init(frame:, style:, cellSeparatorStyle:, separatorInset:, dataSource:, delegate:)` in UITableView extension
- Fixed `animate(path:, count: = default, duration:, autoreverses: = default)` autoreverses
- Fixed BFButton with a default `fadeDuration` value
- Fixed wrong default duration in `fade(label:, duration:, toAttributedString:)` in WKInterfaceController extension

---

## [2.5.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.5.0) - Better Gradients And Dates
### 4 Jul 2017
### Added
- Added `init?(iso8601:)` and `iso8601()` functions to create a Date from an ISO 8601 String and vice-versa in Date & String extensions
- Added new functions in NSAttributedString extension to handle left, right, center and justified text alignment
- Added `smoothLinearGradient(colors:, direction:)` function in UIView extension that uses `CGGradient` instead of `CAGradientLayer`
- Added iPad Pro 12.9 2nd Generation and iPad Pro 10.5 devices in UIDevice extension
- Added `fade(label:, duration: = default, toString:)` and `fade(label:, duration: = default, toAttributedString:)` animation functions in WKInterfaceController extension
- Added `Set` struct extension
- Added `append(_ value:, key:)` function in Dictionary extension
- Added `init?(view:)` function in UIImage extension

### Improved
- Now `dateString(format: = default)` in Date extension has a new `locale` parameter with a `default` value, so no changes are required
- Now `init?(parse dateString:, format: = default)` in Date extension has a new `locale` parameter with a `default` value, so no changes are required
- Updated SwiftLint to 0.20.0

### Fixed
- Fixed a bug where you cannot concatenate multiple attributed strings

---

## [2.4.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.4.1) - Swift Package Manager Returns
### 1 Jun 2017
### Fixed
- Fixed Swift Package Manager build on macOS

---

## [2.4.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.4.0) - watchOS Support
### 31 May 2017
### Added
- Added watchOS support (For specific classes, structs and extensions support refer to [compatibility](https://github.com/FabrizioBrancati/BFKit-Swift/tree/master#classes-and-extensions-compatibility) table)
- Added `WKInterfaceController` class extension for watchOS
- Added `NSAttributedString` class extension
- Added `NSPointerArray` class extension
- Added `isNotEmpty` in Array extension
- Added `saveLog(in:, filename:)` in BFLog struct to save log in a file

### Improved
- Changed Travis CI builds
- Use of `randomInt()` in UIColor and Array extensions
- Removed Glibc library for Linux
- Updated SwiftLint to 0.19.0

---

## [2.3.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.3.0) - Minor (Breaking) Changes
### 23 Apr 2017
### Added
- Added `dateString(format:)` in Date extension
- Added `replacingOccurrences(of:, with:)` in String extension

### Improved
- Changing Sound and Font enums to be more Swifty (Xcode hints will help)
- Updated with Swift 3.1 compatibility
- Updated SwiftLint to 0.18.1
- Improved tests
- `mainBundlePath` in FileManager extension will now return the main bundle path if no file is specified [#27](https://github.com/FabrizioBrancati/BFKit-Swift/issues/27)

### Fixed
- Fixed an issue with `randomInt()` function in Number extension [#26](https://github.com/FabrizioBrancati/BFKit-Swift/issues/26)

Thanks to [@on123](https://github.com/on123) & [@jiongge](https://github.com/jiongge) for this release

---

## [2.2.2](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.2.2) - Swift 3.1 Ready
### 12 Mar 2017
### Improved
- Minor changes to be Swift 3.1 ready

---

## [2.2.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.2.1) - Better Log
### 10 Jan 2017
### Fixed
- Fixed a bug in `warning`, `error`, `debug` and `info` functions in BFLog struct

Thanks to [@ianrahman](https://github.com/ianrahman) for this release

---

## [2.2.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.2.0) - Cryptographically First
### 9 Jan 2017
### Added
- Added new cryptographically secure random numbers generator with `random()` function in Number extension
    - Available to all Integer types, Float and Double
- Added `warning`, `error`, `debug` and `info` functions in BFLog extension
- Added `has(_:, caseSensitive:)` as alias of `range(of:, caseSensitive:)` in String extension

### Improved
- Increased code coverage
- General enhancements in pasteboard functions
- Enhancements in `init(barButtonSpaceType:, width:)` in UIBarButtonItem extension
- Changed the implementation of `randomInt()` and `randomFloat()` function in Number extension
- Updated SwiftLint to 0.15.0
- Minor enhancements

### Fixed
- Fixed a bug in `reversed(preserveFormat:)` function in String extension

---

## [2.1.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.1.0) - Napalm Explosion
### 23 Dec 2016
### Added
- Added `random()` function in Array extension
- Added `array` variable to String, Int, Float and Double extensions
- Added `present(title:, message:, actions:, alertType:)` in UIViewController extension
- Added support for Xcode 8.2 and Swift 3.0.2

### Improved
- Updated SwiftLint to 0.14.0

Thanks to [@calebkleveter](https://github.com/calebkleveter) for this release

---

## [2.0.2](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.0.2) - Linux Doesn't Like Emoji
### 11 Dec 2016
### Fixed
- Fixed a bug for Linux on String extension

---

## [2.0.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.0.1) - Linux Compatibility
### 10 Dec 2016
### Fixed
- Fixed a bug for Linux on BFApp class

---

## [2.0.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/2.0.0) - A New Beginning
### 10 Dec 2016
### Added
- This version has been completely rewritten and is not compatible with 1.x versions
- Added Swift 3.0 support
- Added Unit Tests
- Adopt the new [API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- Use of [SwiftLint](https://github.com/realm/SwiftLint)
- Builds on Linux (Foundation extensions only)
- Added `isLowPowerModeEnabled()`, `lowPowerModeChanged(_:)`, `isJailbroken()`, `uptime` and `uptimeDate` functions in UIDevice extension
- Added `shuffle()` and `shuffled()` functions in Array extension
- Added `localize()`, `isAnagram()`, `isPalindrome()`, `links()`, `dates()`, `hashtags()`, `mentions()` functions and `???` operator in String extension
- Added `animate(path:, count:, duration:)` function in UIView extension
- Added `init(base64:)` function in UIImage extension
- Added UIViewController extension
- Added ProcessInfo extension

### Improved
- Better handling of `!`, `?` and `throws` on all sources
- Minor enhancements & bug fix

Thanks to [@the0neyouseek](https://github.com/the0neyouseek) for this release

---

## [1.8.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.8.0)
### 19 Sep 2016
### Added
- Added Swift 2.3 support
- Added Application info in BFApp class [#17](https://github.com/FabrizioBrancati/BFKit-Swift/pull/17)

### Improved
- Simplified color usage in UIColor extension [#16](https://github.com/FabrizioBrancati/BFKit-Swift/pull/16)

### Fixed
- Fixed crashes on `imageToGrayscale()` and `imageToBlackAndWhite()` in UIImage extension [#15](https://github.com/FabrizioBrancati/BFKit-Swift/pull/15)
- Fixed `countUppercaseLetters` function in BFPassword class [#14](https://github.com/FabrizioBrancati/BFKit-Swift/pull/14)

Thanks to [@sairamkotha](https://github.com/sairamkotha), [@ttyh061](https://github.com/ttyh061) & [@astrokin](https://github.com/astrokin) for this release

---

## [1.7.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.7.0)
### 14 Jul 2016
### Added
- Added `debugBlock` and `NSLocalizedString(key:)` in global scope
- Added BFView as subclass of UIView
- Added `<` and `>` to compare two NSDate
- Added `hexString()` and `alpha()` to UIColor extension
- Added `cornerRadius(corners:, radius:)` to UIView extension

### Improved
- Improved BFLog class - [See this post on how to properly use it](http://stackoverflow.com/a/26891797/4032046)
- Adjusting pt-BR typo [#13](https://github.com/FabrizioBrancati/BFKit-Swift/pull/13)
- Minor enhancements

### Fixed
- Fixed a bug with Carthage

Thanks to [@gabrielPeart](https://github.com/gabrielPeart) for this release

---

## [1.6.3](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.6.3)
### 15 May 2016
### Fixed
- Fixed crash on BFDateInformation struct initializer


## [1.6.2](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.6.2)
### 08 May 2016
### Added
- Added missing devices
- Added Swedish translation [#11](https://github.com/FabrizioBrancati/BFKit-Swift/pull/11) & [#12](https://github.com/FabrizioBrancati/BFKit-Swift/pull/12)

### Improved
- Minor enhancements & bug fix

Thanks to [@pontus-andersson](https://github.com/pontus-andersson) for this release

---

## [1.6.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.6.1)
### 25 Mar 2016
### Added
- Added [Package.swift](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/Package.swift) file to add support to Swift Package Manager
- Added support to Swift 2.2 and Xcode 7.3 [#10](https://github.com/FabrizioBrancati/BFKit-Swift/pull/10)

Thanks to [@lucasmpaim](https://github.com/lucasmpaim) for this release

---

## [1.6.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.6.0)
### 1 Feb 2016
### Added
- Added [CONTRIBUTING.md](https://github.com/FabrizioBrancati/BFKit-Swift/blob/master/CONTRIBUTING.md) file
- Added `brightness` directly to UIScreen extension
- Added `randomInt()` function with range support in NSNumber extension
- Added Brazilian Portuguese [#20](https://github.com/FabrizioBrancati/BFKit/pull/20) & [#22](https://github.com/FabrizioBrancati/BFKit/pull/22)
- Added a screen size structure in UIScreen extension to check the device's screen size [#9](https://github.com/FabrizioBrancati/BFKit-Swift/pull/9)
- Added NSData extension
- Added `shortDate()` function to NSDate extension
- Added `safeObjectForKey()` in NSDictionary extension
- Added BFTextField subclass of UITextField to limit the max characters
- Added some functions to NSString & String extensions
- Added `updateUniqueIdentifier(_: _:)` in UIDevice extension
- Added `removeAllSubviews()` in UIView extension
- Added `calculatedHeight()` & `setFont(_, fromIndex:, toIndex:)`

### Improved
- Minor enhancements & bug fix

### Fixed
- Fixed a bug in `randomColor(_)` that may cause a crash [#8](https://github.com/FabrizioBrancati/BFKit-Swift/pull/8)

Thanks to [@Ewg777](https://github.com/Ewg777), [@emersonbroga](https://github.com/emersonbroga) & [@liushixiang](https://github.com/liushixiang) for this release

---

## [1.5.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.5.1)
### 10 Nov 2015
### Added
- Added more stronger check on BFDataStructures

### Improved
- Now support Swift 2.1 and Xcode 7.1

### Fixed
- Fixed a bug in `searchInString(_:charStart:charEnd)` that may cause a crash

---

## [1.5.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.5.0)
### 5 Nov 2015
### Added
- Added support for Swift 2.0
- Added `onFirstStartForVersion` and `isFirstStartForVersion` functions and `isFirstStart` and `isFirstStartForCurrentVersion` variables in BFApp class
- Added HEX functions in NSString and String extensions
- Added String functions like URL functions
- Added a `NS` function to String extension that convert it to a NSString
- Added `flipImageHorizontally` & `flipImageVertically` functions in UIImage extension
- Added missing devices

### Improved
- Now `Array` and `Dictionary` extensions are declared as public
- `indexOfCharacter()` in String extension now doesn't returns `nil` if not found, but `-1`
- Moved `generateUUID()` from UIDevice extension to String and NSString extensions

### Fixed
- Fixed various bugs

---

## [1.4.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.4.1)
### 20 Jul 2015
### Added
- Added support for iPod Touch 6G

### Fixed
- Fixed a problem with Carthage project

---

## [1.4.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.4.0)
### 13 Jul 2015
### Added
- Added `APP_DELEGATE` global variable
- Added UINavigationBar extension
- Added UIToolbar & UIBarButtonItem extensions
- Added BFDataStructures class with primitive data structures
- Added new substring, indexOf and subscript functions in String extension
- Added `fallbackTitle` parameter in `showTouchIDAuthenticationWithReason` function in BFTouchID class
- Added touch on screen with `BFShowTouchOnScreen()` and `BFHideTouchOnScreen()` functions

### Improved
- Removed UIScreen functions from UIDevice extension and created UIScreen extension
- Changed `SCREEN_WIDTH` & `SCREEN_HEIGHT` variables and fixed [#2](https://github.com/FabrizioBrancati/BFKit-Swift/issues/2) (Thanks to [jiongge](https://github.com/jiongge))

### Fixed
- Fixed `iOSVersion` function in UIDevice extension

---

## [1.3.1](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.3.1)
### 9 Jul 2915
### Added
- Added `onFirstStart` and `onFirstStartForCurrentVersion` in BFApp class
- Added `stringByReplacingWithRegex:withString:` in NSString and String extensions

### Improved
- BFLog now prints: `timestamp filename:line function message`
- NSDate extension now has `nanosecond` and use `autoupdatingCurrentCalendar`
- Bug fix in DEMO App

---

## [1.3.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.3.0)
### 7 Jul 2015
### Added
- Added a DEMO App
- Added `init(imageAsTemplate:, tintColor:)` to create UIImageView with a template image
- Added a new init function in UIColor extension to create UIColor with an HEX in Int
- Added function `dictionaryToJSON` and deprecated the old one in NSDictionary extension
- Added `moveObjectFromIndex` function in NSMutableArray extension

### Improved
- NSThread extension is now public and can perform selectors in background
- `BFLocalizedString` now doesn't require `comment` parameter
- Changed `BFLogString` and `BFDetailedLogString` from functions to variables
- `showTouchIDAuthenticationWithReason` in BFTouchID class now returns `result` in closure
- In some UIKit extension the delegate (or data source) can now be `nil`
- `searchCharStart` functions in NSString extension now requires a NSString for start and end
- Changed how to check if is an email in NSString and String extensions
- `colorForColorString` has been moved from UIImage to UIColor extension
- Renamed `image` variable to `screenshot` in `takeScreenshotWithDelay` function in UIWindow extension
- Marked some function as obsoleted

### Fixed
- Fixed a bug with `iOSVersion` function in UIDevice extension
- Fixed a bug with all the CIFilter in UIImage extension
- Fixed a bug in `deleteFile` function in NSFileManager extension
- Fixed a bug in `safeSetObject` function in NSMutableDictionary extension

---

## [1.2.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.2.0)
### 5 Jul 2015
### Added
- Added comments to all classes and extensions
- Added the documentation with [CocoaDocs](http://cocoadocs.org/docsets/BFKit-Swift/)

### Improved
- Declared public `colorForColorString` in UIColor extension
- Declared as deprecated some functions in favor of default values

---

## [1.1.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.1.0)
### 2 Jul 2015
### Added
- Added Carthage support
- Added all IDs in BFSystemSound class
- Added all font family names and font names in UIFont extension

### Improved
- Now you can use word like `red`, `blue` or any predefined color in UIColor class to create dummy images with `UIColor(dummyImageWithSizeAndColor:)`
- Changed `loadArrayToPath` to `loadArrayFromPath` and now return `AnyObject?`
- Removed `cpuUsage` function in NSProcessInfo extension
- Reverted to old `BFLog` function in BFLog class

### Fixed
- Fixed `dictionaryToJson:` in Dictionary extension

---

## [1.0.0](https://github.com/FabrizioBrancati/BFKit-Swift/releases/tag/v1.0.0)
### 30 Jun 2015
- Initial release
