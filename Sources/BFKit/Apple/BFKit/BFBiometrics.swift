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

// MARK: - BFTouchID struct

/// This struct adds some useful functions to use biometric authentications.
public struct BFBiometrics {
    // MARK: - Variables
    
    /// Biometric result enum.
    public enum Result: Int {
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
        /// Error.
        case error
    }
    
    /// Biometry type enum.
    public enum BiometryType: Int {
        /// No biometric.
        case none
        /// Biometric type Touch ID.
        case touchID
        /// Biometric type Face ID.
        case faceID
    }
    
    @available(iOS 11.0, *)
    public static var biometryType: BiometryType {
        let context: LAContext = LAContext()
        
        switch context.biometryType {
        case .none:
            return .none
        case .typeTouchID:
            return .touchID
        case .typeFaceID:
            return .faceID
        }
    }
    
    // MARK: - Functions
}
