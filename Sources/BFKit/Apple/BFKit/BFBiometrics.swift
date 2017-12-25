//
//  BFTouchID.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2017 Fabrizio Brancati. All rights reserved.
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

// MARK: - BFBiometrics struct

/// This struct adds some useful functions to use biometric authentications.
public struct BFBiometrics {
    // MARK: - Variables
    
    /// Biometric result enum.
    public enum Result: String {
        /// Success.
        case success
        /// Authentication Failed.
        case authenticationFailed
        /// User Cancel.
        case userCancel
        /// User Fallback.
        case userFallback
        /// System Cancel.
        case systemCancel
        /// Passcode Not Set.
        case passcodeNotSet
        /// Biometric Not Available.
        case notAvailable
        /// Biometric Not Enrolled.
        case notEnrolled
        /// Biometric Lockout.
        case lockout
        /// App Cancel.
        case appCancel
        /// Invalid Context.
        case invalidContext
        /// Not Interactive.
        case notInteractive
        /// Error.
        case error
    }
    
    // MARK: - Functions
    
    public static func canUseBiometric() -> Result {
        let context: LAContext = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            return .success
        } else {
            return handleError(error)
        }
    }
    
    public static func useBiometric(localizedReason: String, completion: @escaping (_ result: Result) -> Void) {
        let context: LAContext = LAContext()
        
        let canUseBiometric = self.canUseBiometric()
        if canUseBiometric == .success {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason, reply: { success, error in
                if success == true, error == nil {
                    completion(.success)
                } else {
                    completion(self.handleError(error as NSError?))
                }
            })
        } else {
            completion(canUseBiometric)
        }
    }
    
    private static func handleError(_ error: NSError?) -> BFBiometrics.Result {
        guard let error = error else {
            return .error
        }
        
        if #available(iOS 9.0, *) {
            if #available(iOS 11.0, *) {
                switch error {
                case LAError.authenticationFailed:
                    return .authenticationFailed
                case LAError.userCancel:
                    return .userCancel
                case LAError.userFallback:
                    return .userFallback
                case LAError.systemCancel:
                    return .systemCancel
                case LAError.passcodeNotSet:
                    return .passcodeNotSet
                case LAError.biometryNotAvailable:
                    return .notAvailable
                case LAError.biometryNotEnrolled:
                    return .notEnrolled
                case LAError.biometryLockout:
                    return .lockout
                case LAError.appCancel:
                    return .appCancel
                case LAError.invalidContext:
                    return .invalidContext
                case LAError.notInteractive:
                    return .notInteractive
                default:
                    return .error
                }
            } else {
                switch error {
                case LAError.authenticationFailed:
                    return .authenticationFailed
                case LAError.userCancel:
                    return .userCancel
                case LAError.userFallback:
                    return .userFallback
                case LAError.systemCancel:
                    return .systemCancel
                case LAError.passcodeNotSet:
                    return .passcodeNotSet
                case LAError.touchIDNotAvailable:
                    return .notAvailable
                case LAError.touchIDNotEnrolled:
                    return .notEnrolled
                case LAError.touchIDLockout:
                    return .lockout
                case LAError.appCancel:
                    return .appCancel
                case LAError.invalidContext:
                    return .invalidContext
                case LAError.notInteractive:
                    return .notInteractive
                default:
                    return .error
                }
            }
        } else {
            switch error {
            case LAError.authenticationFailed:
                return .authenticationFailed
            case LAError.userCancel:
                return .userCancel
            case LAError.userFallback:
                return .userFallback
            case LAError.systemCancel:
                return .systemCancel
            case LAError.passcodeNotSet:
                return .passcodeNotSet
            case LAError.touchIDNotAvailable:
                return .notAvailable
            case LAError.touchIDNotEnrolled:
                return .notEnrolled
            case LAError.notInteractive:
                return .notInteractive
            default:
                return .error
            }
        }
    }
}
