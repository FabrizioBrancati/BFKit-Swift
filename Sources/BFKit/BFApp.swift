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

// MARK: - Global functions -

/**
 Use BFLocalizedString to use the string translated by BFKit
 
 - parameter key:     The key string
 - parameter comment: An optional comment
 
 - returns: Returns the localized string
 */
public func BFLocalizedString(_ key: String, _ comment: String = "") -> String {
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
    public static func onFirstStart(version: String = "", block: (_ isFirstStart: Bool) -> ()) {
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
        
        block(!hasBeenOpened)
    }
    
    /**
     Set the App settings for a given object and key. The file will be saved in the Library directory
     
     - parameter object: Object to set
     - parameter objKey: Key to set the object
     
     - returns: Returns true if the operation was successful, otherwise false
     */
    public static func setAppSettingsForObject(_ object: AnyObject, forKey objKey: String) -> Bool {
        return FileManager.setSettings(BFApp.name, object: object, forKey: objKey)
    }
    
    /**
     Get the App settings for a given key
     
     - parameter objKey: Key to get the object
     
     - returns: Returns the object for the given key
     */
    public static func getAppSettingsForObjectWithKey(_ objKey: String) -> Any? {
        return FileManager.getSettings(BFApp.name, objectForKey: objKey)
    }
    
    /// Return the App name
    public static var name: String = {
        return BFApp.stringFromInfoDictionary(forKey: "CFBundleDisplayName")
    }()
    
    
    /// Returns the App version
    public static var version: String = {
        return BFApp.stringFromInfoDictionary(forKey: "CFBundleShortVersionString")
    }()
    
    /// Returns the App build
    public static var build: String = {
        return BFApp.stringFromInfoDictionary(forKey: "CFBundleVersion")
    }()
    
    /// Returns the App executable
    public static var executable: String = {
        return BFApp.stringFromInfoDictionary(forKey: "CFBundleExecutable")
    }()
    
    /// Returns the App bundle
    public static var bundle: String = {
        return BFApp.stringFromInfoDictionary(forKey: "CFBundleIdentifier")
    }()
    
    /// Returns a String from the Info dictionary of the App
    ///
    /// - parameter key: Key to search
    ///
    /// - returns: Returns a String from the Info dictionary of the App
    private static func stringFromInfoDictionary(forKey key: String) -> String {
        guard let infoDictionary = Bundle.main.infoDictionary, let value = infoDictionary[key] as? String else {
            return ""
        }
        
        return value
    }
}
