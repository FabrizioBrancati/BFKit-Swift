//
//  BFApp.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Fabrizio Brancati. All rights reserved.
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

/// Get App name
public let APP_NAME: String = NSBundle(forClass: BFApp.self).infoDictionary!["CFBundleDisplayName"] as! String

/// Get App build
public let APP_BUILD: String = NSBundle(forClass: BFApp.self).infoDictionary!["CFBundleVersion"] as! String

/// Get App version
public let APP_VERSION: String = NSBundle(forClass: BFApp.self).infoDictionary!["CFBundleShortVersionString"] as! String

/**
Use BFLocalizedString to use the string translated by BFKit

:param: key     The key string
:param: comment An optional comment
*/
public func BFLocalizedString(key: String, comment: String? = nil) -> String
{
    return NSBundle(forClass: BFApp.self).localizedStringForKey(key, value: key, table: "BFKit")
}

/// Get AppDelegate
//let APP_DELEGATE = UIApplication.sharedApplication().delegate as! AppDelegate

/// This class adds some useful functions for the App
private class BFApp: NSObject
{
   
}
