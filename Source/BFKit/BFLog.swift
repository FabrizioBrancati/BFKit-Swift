//
//  BFLog.swift
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

// MARK: - Global variables -

/// Use this variable to activate or deactivate the BFLog function
public var BFLogActive: Bool = true

// MARK: - Global functions -

/**
 Exented NSLog

 - parameter message:  Console message
 - parameter filename: File
 - parameter function: Function name
 - parameter line:     Line number
 */
public func BFLog(var message: String, filename: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
    if BFLogActive {
        if message.hasSuffix("\n") == false {
            message += "\n"
        }
        
        BFLogClass.logString += message
        
        let filenameNoExt = NSURL(string: NSString(UTF8String: filename)! as String)!.URLByDeletingPathExtension!
        let log = "(\(function)) (\(filenameNoExt):\(line) \(message)"
        let timestamp = NSDate.dateInformationDescriptionWithInformation(NSDate().dateInformation(), dateSeparator: "-", usFormat: true, nanosecond: true)
        print("\(timestamp) \(filenameNoExt):\(line) \(function): \(message)", terminator: "")
        
        BFLogClass.detailedLogString += log
    }
}

/// Get the log string
public var BFLogString: String {
    if BFLogActive {
        return BFLogClass.logString
    } else {
        return ""
    }
}

/// Get the detailed log string
public var BFDetailedLogString: String {
    if BFLogActive {
        return BFLogClass.detailedLogString
    } else {
        return ""
    }
}

/**
 Clear the log string
 */
public func BFLogClear() {
    if BFLogActive {
        BFLogClass.clearLog()
    }
}

/// The private BFLogClass created to manage the log strings
private class BFLogClass {
    // MARK: - Variables -
    
    /// The log string
    private static var logString: String = ""
    /// The detailed log string
    private static var detailedLogString: String = ""
    
    // MARK: - Class functions -
    
    /**
     Private, clear the log string
     */
    private static func clearLog() {
        logString = ""
        detailedLogString = ""
    }
}
