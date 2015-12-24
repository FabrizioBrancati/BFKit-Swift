//
//  NSThread+BFKit.swift
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

// MARK: - Global functions -

/**
 Runs a block in the main thread

 - parameter block: Block to be executed
 */
public func runOnMainThread(block: () -> ()) {
    dispatch_async(dispatch_get_main_queue(), {
        block()
    })
}

/**
 Runs a block in background

 - parameter: block Block to be executed
 */
public func runInBackground(block: () -> ()) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        block()
    }
}

/// This extesion adds some useful functions to NSThread
public extension NSThread {
    /**
     Exectute a selector asyncronously after a delay
    
     - parameter selector: Selector to be executed
     - parameter target:   Target (Usually "self")
     - parameter delay:    Delay to excute the selector
    
     - returns: Return an NSTimer who handle the execution of the selector
     */
    public static func callSelectorAsync(selector: Selector, target: AnyObject, delay: NSTimeInterval = 0.0) -> NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(delay, target: target, selector: selector, userInfo: nil, repeats: false)
    }
    
    /**
     Exetute a selector
    
     - parameter selector: Selector to be executed
     - parameter target:   Target (Usually "self")
     - parameter object:   Object to pass to the selector
     - parameter delay:    Delay to excute the selector
     */
    public static func callSelector(selector: Selector, target: AnyObject, object: AnyObject? = nil, delay: NSTimeInterval = 0.0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            NSThread.detachNewThreadSelector(selector, toTarget: target, withObject: object)
        })
    }
}
