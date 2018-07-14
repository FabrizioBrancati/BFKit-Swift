//
//  UITableView+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati.
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

// MARK: - UITableView extension

/// This extesion adds some useful functions to UITableView.
public extension UITableView {
    // MARK: - Functions
    
    /// Retrive all the IndexPaths for the section.
    ///
    /// - Parameter section: The section.
    /// - Returns: Return an array with all the IndexPaths.
    public func indexPaths(section: Int) -> [IndexPath] {
        var indexPaths: [IndexPath] = []
        let rows: Int = numberOfRows(inSection: section)
        for index in 0 ..< rows {
            let indexPath = IndexPath(row: index, section: section)
            indexPaths.append(indexPath)
        }
        
        return indexPaths
    }
    
    /// Retrive the next index path for the given row at section.
    ///
    /// - Parameters:
    ///   - row: Row of the index path.
    ///   - section: Section of the index path
    /// - Returns: Returns the next index path.
    public func nextIndexPath(row: Int, forSection section: Int) -> IndexPath? {
        let indexPath: [IndexPath] = indexPaths(section: section)
        guard indexPath != [] else {
            return nil
        }
        
        return indexPath[row + 1]
    }
    
    /// Retrive the previous index path for the given row at section
    ///
    /// - Parameters:
    ///   - row: Row of the index path.
    ///   - section: Section of the index path.
    /// - Returns: Returns the previous index path.
    public func previousIndexPath(row: Int, forSection section: Int) -> IndexPath? {
        let indexPath: [IndexPath] = indexPaths(section: section)
        guard indexPath != [] else {
            return nil
        }
        
        return indexPath[row - 1]
    }
    
    /// Create an UITableView and set some parameters
    ///
    /// - Parameters:
    ///   - frame: TableView frame.
    ///   - style: TableView style.
    ///   - cellSeparatorStyle: Cell separator style.
    ///   - separatorInset: Cell separator inset.
    ///   - dataSource: TableView data source.
    ///   - delegate: TableView delegate.
    public convenience init(frame: CGRect, style: UITableViewStyle, cellSeparatorStyle: UITableViewCellSeparatorStyle, separatorInset: UIEdgeInsets, dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
        self.init(frame: frame, style: style)
        separatorStyle = cellSeparatorStyle
        self.separatorInset = separatorInset
        self.dataSource = dataSource
        self.delegate = delegate
    }
}
