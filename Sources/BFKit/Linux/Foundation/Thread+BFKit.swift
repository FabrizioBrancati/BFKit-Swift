//
//  Thread+BFKit.swift
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
public func runOnMainThread(_ block: @escaping () -> ()) {
    DispatchQueue.main.async(execute: {
        block()
    })
}

/**
 Runs a block in background

 - parameter: block Block to be executed
 */
public func runInBackground(_ block: @escaping () -> ()) {
    DispatchQueue.global().async {
        block()
    }
}

/// This extesion adds some useful functions to NSThread
public extension Thread {
    /**
     Exectute a selector asyncronously after a delay
    
     - parameter selector: Selector to be executed
     - parameter target:   Target (Usually "self")
     - parameter delay:    Delay to excute the selector
    
     - returns: Return an NSTimer who handle the execution of the selector
     */
    public static func callSelectorAsync(_ selector: Selector, target: AnyObject, delay: TimeInterval = 0.0) -> Timer {
        return Timer.scheduledTimer(timeInterval: delay, target: target, selector: selector, userInfo: nil, repeats: false)
    }
    
    /**
     Exetute a selector
    
     - parameter selector: Selector to be executed
     - parameter target:   Target (Usually "self")
     - parameter object:   Object to pass to the selector
     - parameter delay:    Delay to excute the selector
     */
    public static func callSelector(_ selector: Selector, target: AnyObject, object: AnyObject? = nil, delay: TimeInterval = 0.0) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
            Thread.detachNewThreadSelector(selector, toTarget: target, with: object)
        })
    }
}
