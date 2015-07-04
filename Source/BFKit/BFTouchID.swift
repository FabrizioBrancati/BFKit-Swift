//
//  BFTouchID.swift
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
import LocalAuthentication

/// This class adds some useful functions to use TouchID
@availability(*, introduced=8.0)
public class BFTouchID
{
    // MARK: - Enums -
    
    /**
    Touch result enum
    
    - Success:              Success
    - Error:                Error
    - AuthenticationFailed: Authentication Failed
    - UserCancel:           User Cancel
    - UserFallback:         User Fallback
    - SystemCancel:         System Cancel
    - PasscodeNotSet:       Passcode Not Set
    - NotAvailable:         Not Available
    - NotEnrolled:          Not Enrolled
    */
    @availability(*, introduced=8.0)
    public enum TouchIDResult : Int
    {
        case Success
        case Error
        case AuthenticationFailed
        case UserCancel
        case UserFallback
        case SystemCancel
        case PasscodeNotSet
        case NotAvailable
        case NotEnrolled
    }
    
    // MARK: - Class functions -
    
    /**
    Shows the TouchID alert
    
    :param: reason     Text to show in the alert
    :param: completion Completion handler. It returns the TouchID result, from the TouchIDResult enum
    */
    public static func showTouchIDAuthenticationWithReason(reason: String, completion: (TouchIDResult) -> ())
    {
        let context: LAContext = LAContext()
        
        var error: NSError?
        if context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error)
        {
            context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: { (success: Bool, error: NSError!) -> Void in
                if success
                {
                    completion(.Success)
                }
                else
                {
                    switch error.code
                    {
                    case LAError.AuthenticationFailed.rawValue:
                        completion(.AuthenticationFailed)
                    case LAError.UserCancel.rawValue:
                        completion(.UserCancel)
                    case LAError.UserFallback.rawValue:
                        completion(.UserFallback)
                    case LAError.SystemCancel.rawValue:
                        completion(.SystemCancel)
                    default:
                        completion(.Error)
                    }
                }
            })
        }
        else
        {
            switch error!.code
            {
            case LAError.PasscodeNotSet.rawValue:
                completion(.PasscodeNotSet)
            case LAError.TouchIDNotAvailable.rawValue:
                completion(.NotAvailable)
            case LAError.TouchIDNotEnrolled.rawValue:
                completion(.NotEnrolled)
            default:
                completion(.Error)
            }
        }
    }
}