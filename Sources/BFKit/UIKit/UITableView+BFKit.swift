//
//  UITableView+BFKit.swift
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
import UIKit

/// This extesion adds some useful functions to UITableView
public extension UITableView {
    // MARK: - Instance functions -
    
    /**
     Retrive all the IndexPaths for the section
    
     - parameter section: The section
    
     - returns: Return an array with all the IndexPaths
     */
    public func getIndexPathsForSection(_ section: Int) -> Array<IndexPath> {
        var indexPaths: Array<IndexPath> = Array()
        let rows: Int = self.numberOfRows(inSection: section)
        for i in 0 ..< rows
        {
            let indexPath: IndexPath = IndexPath(row: i, section: section)
            indexPaths.append(indexPath)
        }
        
        return indexPaths
    }
    
    /**
     Retrive the next index path for the given row at section
    
     - parameter row:     Row of the index path
     - parameter section: Section of the index path
    
     - returns: Returns the next index path
     */
    public func getNextIndexPath(_ row: Int, forSection section: Int) -> IndexPath {
        let indexPath: Array<IndexPath> = self.getIndexPathsForSection(section)
        return indexPath[row + 1]
    }
    
    /**
     Retrive the previous index path for the given row at section
    
     - parameter row:     Row of the index path
     - parameter section: Section of the index path
    
     - returns: Returns the previous index path
     */
    public func getPreviousIndexPath(_ row: Int, forSection section: Int) -> IndexPath {
        let indexPath: Array<IndexPath> = self.getIndexPathsForSection(section)
        return indexPath[row - 1]
    }

    // MARK: - Init functions -
    
    /**
     Create an UITableView and set some parameters
    
     - parameter frame:              TableView's frame
     - parameter style:              TableView's style
     - parameter cellSeparatorStyle: Cell separator style
     - parameter separatorInset:     Cell separator inset
     - parameter dataSource:         TableView's data source
     - parameter delegate:           TableView's delegate
    
     - returns: Returns the created UITableView
     */
    public convenience init(frame: CGRect, style: UITableViewStyle, cellSeparatorStyle: UITableViewCellSeparatorStyle, separatorInset: UIEdgeInsets, dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
        self.init(frame: frame)
        self.separatorStyle = cellSeparatorStyle
        self.separatorInset = separatorInset
        self.dataSource = dataSource
        self.delegate = delegate
    }
}
