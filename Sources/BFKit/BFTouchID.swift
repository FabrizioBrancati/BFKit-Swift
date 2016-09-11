
//
//  BFTouchID.swift
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
import LocalAuthentication

/// This class adds some useful functions to use TouchID
public class BFTouchID {
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
    public enum TouchIDResult : Int {
        case success
        case error
        case authenticationFailed
        case userCancel
        case userFallback
        case systemCancel
        case passcodeNotSet
        case notAvailable
        case notEnrolled
    }
    
    // MARK: - Class functions -
    
    /**
     Shows the TouchID alert
    
     - parameter reason:        Text to show in the alert
     - parameter fallbackTitle: Default title "Enter Password" is used when this property is left nil. If set to empty string, the button will be hidden
     - parameter completion:    Completion handler. It returns the TouchID result, from the TouchIDResult enum
     */
    public static func showTouchIDAuthenticationWithReason(_ reason: String, fallbackTitle: String? = nil, completion: @escaping (_ result: TouchIDResult) -> ()) {
        
        let context: LAContext = LAContext()
        
        context.localizedFallbackTitle = fallbackTitle
        
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: { (success: Bool, error: Error?) -> Void in
                if success {
                    completion(.success)
                } else {
                    switch error! {
                    case LAError.authenticationFailed:
                        completion(.authenticationFailed)
                    case LAError.userCancel:
                        completion(.userCancel)
                    case LAError.userFallback:
                        completion(.userFallback)
                    case LAError.systemCancel:
                        completion(.systemCancel)
                    default:
                        completion(.error)
                    }
                }
            })
        }
        else
        {
            switch error!.code {
            case LAError.passcodeNotSet.rawValue:
                completion(.passcodeNotSet)
            case LAError.touchIDNotAvailable.rawValue:
                completion(.notAvailable)
            case LAError.touchIDNotEnrolled.rawValue:
                completion(.notEnrolled)
            default:
                completion(.error)
            }
        }
    }
}
