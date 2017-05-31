//
//  UIViewControllerExtension.swift
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
import UIKit

// MARK: - UIViewController extension

/// This extesion adds some useful functions to UIViewController.
extension UIViewController {
    /// Use this in viewWillAppear(_:)
    ///
    /// - Parameter tableView: UITableView to be delected.
    func smoothlyDeselectRows(tableView: UITableView) {
        let selectedIndexPaths = tableView.indexPathsForSelectedRows ?? []
        
        if let coordinator = transitionCoordinator {
            coordinator.animateAlongsideTransition(in: parent?.view, animation: { coordinatorContext in
                selectedIndexPaths.forEach {
                    tableView.deselectRow(at: $0, animated: coordinatorContext.isAnimated)
                }
            }, completion: { coordinatorContext in
                if coordinatorContext.isCancelled {
                    selectedIndexPaths.forEach {
                        tableView.selectRow(at: $0, animated: false, scrollPosition: .none)
                    }
                }
            })
        } else {
            selectedIndexPaths.forEach {
                tableView.deselectRow(at: $0, animated: false)
            }
        }
    }
    
    /// Presents a UIAlertController with a title, message and a set of actions.
    ///
    /// - parameter title: The title of the UIAlerController.
    /// - parameter message: An optional String for the UIAlertController's message.
    /// - parameter actions: An array of actions that will be added to the UIAlertController.
    /// - parameter alertType: The style of the UIAlertController.
    public func present(title: String, message: String, actions: [UIAlertAction], alertType: UIAlertControllerStyle = .alert) {
        let errorAlert = UIAlertController(title: title, message: message, preferredStyle: alertType)
        for action in actions {
            errorAlert.addAction(action)
        }
        self.present(errorAlert, animated: true, completion: nil)
    }
}
