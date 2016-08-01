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

// MARK: - Global variables -

/// Used to store the BFHasBeenOpened in defaults
private let BFAppHasBeenOpened = "BFAppHasBeenOpened"

/// Get App name
public let AppName: String = Bundle(for: BFApp.self).infoDictionary!["CFBundleDisplayName"] as! String

/// Get App build
public let AppBuild: String = Bundle(for: BFApp.self).infoDictionary!["CFBundleVersion"] as! String

/// Get App version
public let AppVersion: String = Bundle(for: BFApp.self).infoDictionary!["CFBundleShortVersionString"] as! String

// MARK: - Global functions -

/**
 Use BFLocalizedString to use the string translated by BFKit
 
 - parameter key:     The key string
 - parameter comment: An optional comment
 
 - returns: Returns the localized string
 */
public func BFLocalizedString(_ key: String, _ comment: String? = nil) -> String {
    return Bundle(for: BFApp.self).localizedString(forKey: key, value: key, table: "BFKit")
}

/**
 NSLocalizedString without comment parameter
 
 - parameter key: The key of the localized string
 
 - returns: Returns a localized string
 */
public func NSLocalizedString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

#if os(iOS)
    /// Get AppDelegate. To use it, cast to AppDelegate with "as! AppDelegate"
    let appDelegate: UIApplicationDelegate? = UIApplication.shared.delegate
#endif

/// This class adds some useful functions for the App
public class BFApp {
    // MARK: - Class functions -
    
    /**
     Executes a block only if in DEBUG mode
     
     - parameter block: The block to be executed
     */
    public static func debug(_ block: () -> ()) {
        #if DEBUG
            block()
        #endif
    }
    
    /**
     Executes a block only if NOT in DEBUG mode
     
     - parameter block: The block to be executed
     */
    public static func release(_ block: () -> ()) {
        #if !DEBUG
            block()
        #endif
    }
    
    /**
     If version is set returns if is first start for that version,
     otherwise returns if is first start of the App
     
     - parameter version: Version to be checked, you can use the global varialble AppVersion to pass the current App version
     
     - returns: Returns if is first start of the App or for custom version
     */
    public static func isFirstStart(version: String = "") -> Bool {
        let key: String
        if version == "" {
            key = BFAppHasBeenOpened
        } else {
            key = BFAppHasBeenOpened + "\(version)"
        }
        
        let defaults = UserDefaults.standard
        let hasBeenOpened: Bool = defaults.bool(forKey: key)
        if hasBeenOpened != true {
            return true
        }
        return false
    }
    
    /**
     Executes a block on first start of the App, if version is set it will be for given version.
     Remember to execute UI instuctions on main thread
     
     - parameter version: Version to be checked, you can use the global varialble AppVersion to pass the current App version
     - parameter block:   The block to execute, returns isFirstStart
     */
    public static func onFirstStart(version: String = "", block: (isFirstStart: Bool) -> ()) {
        let key: String
        if version == "" {
            key = BFAppHasBeenOpened
        } else {
            key = BFAppHasBeenOpened + "\(version)"
        }
        
        let defaults = UserDefaults.standard
        let hasBeenOpened: Bool = defaults.bool(forKey: key)
        if hasBeenOpened != true {
            defaults.set(true, forKey: key)
            defaults.synchronize()
        }
        
        block(isFirstStart: !hasBeenOpened)
    }
}
