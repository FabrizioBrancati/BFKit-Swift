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

public var BFLogActive: Bool = true

public func BFLog(var message: String, filename: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__)
{
    if BFLogActive
    {
        if message.hasSuffix("\n") == false
        {
            message += "\n"
        }
        
        if BFLogClass.logString == ""
        {
            BFLogClass.logString = message
        }
        else
        {
            BFLogClass.logString += message
        }
        
        let filenameNoExt = NSString(UTF8String: filename)!.lastPathComponent.stringByDeletingPathExtension
        let log = "(\(function)) (\(filenameNoExt):\(line) \(message)"
        let timestamp = NSDate.dateInformationDescriptionWithInformation(NSDate().dateInformation(), dateSeparator: "-", usFormat: true)
        print("\(timestamp) (\(function)) (\(filenameNoExt):\(line)) \(message)")
        
        BFLogClass.detailedLogString += log
    }
}

public func BFLogString() -> String
{
    if BFLogActive
    {
        return BFLogClass.logString
    }
    else
    {
        return ""
    }
}

public func BFDetailedLogString() -> String
{
    if BFLogActive
    {
        return BFLogClass.detailedLogString
    }
    else
    {
        return ""
    }
}

public func BFLogClear()
{
    if BFLogActive
    {
        BFLogClass.clearLog()
    }
}

private class BFLogClass
{
    // MARK: - Variables -
    
    private static var logString: String = ""
    private static var detailedLogString: String = ""
    
    // MARK: - Class functions -
    
    private static func clearLog()
    {
        logString = ""
        detailedLogString = ""
    }
}
