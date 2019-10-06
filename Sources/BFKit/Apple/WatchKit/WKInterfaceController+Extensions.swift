//
//  WKInterfaceController+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2019 Fabrizio Brancati.
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
import WatchKit

// MARK: - WKInterfaceController animatable extension

/// Extends WKInterfaceController with animatable functions.
public extension WKInterfaceController {
    /// Create a shake effect.
    ///
    /// - Parameters:
    ///   - group: WKInterfaceGroup to apply shake effect.
    ///   - duration: Shake duration. Default is 0.15.
    ///   - translation: Shake translation. Default is 10.
    @available(watchOS 3.0, *)
    func shake(group: WKInterfaceGroup, duration: TimeInterval = 0.15, translation: Float = 10) {
        animate(withDuration: duration / 3) {
            group.setContentInset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
            Timer.scheduledTimer(withTimeInterval: duration / 3, repeats: false) { [weak self] _ in
                self?.animate(withDuration: duration / 3) {
                    group.setContentInset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
                    Timer.scheduledTimer(withTimeInterval: duration / 3, repeats: false) { [weak self] _ in
                        self?.animate(withDuration: duration / 3) {
                            group.setContentInset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
                        }
                    }
                }
            }
        }
    }
    
    /// Create a fade effect an a label.
    ///
    /// - Parameters:
    ///   - label: WKInterfaceLabel to apply fade effect.
    ///   - duration: Fade duration. Default is 0.5.
    ///   - string: String to fade to.
    @available(watchOS 3.0, *)
    func fade(label: WKInterfaceLabel, duration: TimeInterval = 0.5, toString string: String) {
        fade(label: label, duration: duration, toAttributedString: string.attributedString)
    }
    
    /// Create a fade effect an a label.
    ///
    /// - Parameters:
    ///   - label: WKInterfaceLabel to apply fade effect.
    ///   - duration: Fade duration. Default is 0.2.
    ///   - string: String to fade to.
    @available(watchOS 3.0, *)
    func fade(label: WKInterfaceLabel, duration: TimeInterval = 0.5, toAttributedString string: NSAttributedString) {
        animate(withDuration: duration / 2) {
            label.setAlpha(0)
            Timer.scheduledTimer(withTimeInterval: duration / 2, repeats: false) { [weak self] _ in
                label.setAttributedText(string)
                self?.animate(withDuration: duration / 2) {
                    label.setAlpha(1)
                }
            }
        }
    }
}
