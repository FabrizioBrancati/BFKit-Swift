//
//  BFLog.swift
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

// MARK: - Global functions -

/**
 Exented NSLog.
 See http://stackoverflow.com/a/26891797/4032046 how to set DEBUG build variable

 - parameter message:  Console message
 - parameter filename: File
 - parameter function: Function name
 - parameter line:     Line number
 */
public func BFLog(_ message: String, filename: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
        var _message = message
        if _message.hasSuffix("\n") == false {
            _message += "\n"
        }
        
        BFLogClass.logString += _message
        
        let filenameNoExt = NSURL(string: NSString(utf8String: filename)! as String)!.deletingPathExtension!.lastPathComponent
        let log = "(\(function)) (\(filenameNoExt):\(line) \(_message)"
        let timestamp = Date.dateInformationDescriptionWithInformation(Date().dateInformation(), dateSeparator: "-", usFormat: true, nanosecond: true)
        print("\(timestamp) \(filenameNoExt):\(line) \(function): \(_message)", terminator: "")
        
        BFLogClass.detailedLogString += log
    #endif
}

/// Get the log string
public var BFLogString: String {
    #if DEBUG
        return BFLogClass.logString
    #else
        return ""
    #endif
}

/// Get the detailed log string
public var BFDetailedLogString: String {
    #if DEBUG
        return BFLogClass.detailedLogString
    #else
        return ""
    #endif
}

/// Clear the log string
public func BFLogClear() {
    #if DEBUG
        BFLogClass.clearLog()
    #endif
}

/// The private BFLogClass created to manage the log strings
private struct BFLogClass {
    // MARK: - Variables -
    
    /// The log string
    public static var logString: String = ""
    /// The detailed log string
    public static var detailedLogString: String = ""
    
    // MARK: - Class functions -
    
    /// Private, clear the log string
    public static func clearLog() {
        logString = ""
        detailedLogString = ""
    }
}
