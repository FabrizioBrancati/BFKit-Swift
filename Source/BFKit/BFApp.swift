//
//  BFApp.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import UIKit

// MARK: - Variables -

/// Used to store the BFHasBeenOpened in defaults
private let BFHasBeenOpened = "BFHasBeenOpened"
/// Used to store the BFHasBeenOpenedForCurrentVersion in defaults
private let BFHasBeenOpenedForCurrentVersion = "\(BFHasBeenOpened)\(APP_VERSION)"

/// Get App name
public let APP_NAME: String = NSBundle(forClass: BFApp.self).infoDictionary!["CFBundleDisplayName"] as! String

/// Get App build
public let APP_BUILD: String = NSBundle(forClass: BFApp.self).infoDictionary!["CFBundleVersion"] as! String

/// Get App version
public let APP_VERSION: String = NSBundle(forClass: BFApp.self).infoDictionary!["CFBundleShortVersionString"] as! String

// MARK: - Global functions -

/**
 Use BFLocalizedString to use the string translated by BFKit
 
 - parameter key:     The key string
 - parameter comment: An optional comment
 
 - returns: Returns the localized string
 */
public func BFLocalizedString(key: String, _ comment: String? = nil) -> String {
    return NSBundle(forClass: BFApp.self).localizedStringForKey(key, value: key, table: "BFKit")
}

/**
 NSLocalizedString without comment parameter
 
 - parameter key: The key of the localized string
 
 - returns: Returns a localized string
 */
public func NSLocalizedString(key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

/// Get AppDelegate (To use it, cast to AppDelegate with "as! AppDelegate")
let APP_DELEGATE: UIApplicationDelegate? = UIApplication.sharedApplication().delegate

/// This class adds some useful functions for the App
public class BFApp {
    // MARK: - Class functions -
    
    /**
     Executes a block only if in DEBUG mode
     
     - parameter block: The block to be executed
     */
    public static func debugBlock(block: () -> ()) {
        #if DEBUG
            block()
        #endif
    }
    
    /**
     Executes a block on first start of the App.
     Remember to execute UI instuctions on main thread
    
     - parameter block: The block to execute, returns isFirstStart
     */
    public static func onFirstStart(block: (isFirstStart: Bool) -> ()) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasBeenOpened: Bool = defaults.boolForKey(BFHasBeenOpened)
        if hasBeenOpened != true {
            defaults.setBool(true, forKey: BFHasBeenOpened)
            defaults.synchronize()
        }
        
        block(isFirstStart: !hasBeenOpened)
    }
    
    /**
     Executes a block on first start of the App for current version.
     Remember to execute UI instuctions on main thread
    
     - parameter block: The block to execute, returns isFirstStartForCurrentVersion
     */
    public static func onFirstStartForCurrentVersion(block: (isFirstStartForCurrentVersion: Bool) -> ()) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasBeenOpenedForCurrentVersion: Bool = defaults.boolForKey(BFHasBeenOpenedForCurrentVersion)
        if hasBeenOpenedForCurrentVersion != true {
            defaults.setBool(true, forKey: BFHasBeenOpenedForCurrentVersion)
            defaults.synchronize()
        }
        
        block(isFirstStartForCurrentVersion: !hasBeenOpenedForCurrentVersion)
    }
    
    /**
     Executes a block on first start of the App for current given version.
     Remember to execute UI instuctions on main thread
     
     - parameter version: Version to be checked
     - parameter block:   The block to execute, returns isFirstStartForVersion
     */
    public static func onFirstStartForVersion(version: String, block: (isFirstStartForVersion: Bool) -> ()) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasBeenOpenedForVersion: Bool = defaults.boolForKey(BFHasBeenOpened + "\(version)")
        if hasBeenOpenedForVersion != true {
            defaults.setBool(true, forKey: BFHasBeenOpened + "\(version)")
            defaults.synchronize()
        }
        
        block(isFirstStartForVersion: !hasBeenOpenedForVersion)
    }
    
    /// Returns if is the first start of the App
    public static var isFirstStart: Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasBeenOpened: Bool = defaults.boolForKey(BFHasBeenOpened)
        if hasBeenOpened != true {
            return true
        } else {
            return false
        }
    }
    
    /// Returns if is the first start of the App for current version
    public static var isFirstStartForCurrentVersion: Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasBeenOpenedForCurrentVersion: Bool = defaults.boolForKey(BFHasBeenOpenedForCurrentVersion)
        if hasBeenOpenedForCurrentVersion != true {
            return true
        } else {
            return false
        }
    }
    
    /**
     Returns if is the first start of the App for the given version
     
     - parameter version: Version to be checked
     
     - returns: Returns if is the first start of the App for the given version
     */
    public static func isFirstStartForVersion(version: String) -> Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasBeenOpenedForCurrentVersion: Bool = defaults.boolForKey(BFHasBeenOpened + "\(version)")
        if hasBeenOpenedForCurrentVersion != true {
            return true
        } else {
            return false
        }
    }
}
