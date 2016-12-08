//
//  UITableViewExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 06/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
import UIKit
@testable import BFKit

class UITableViewExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIndexPathsSection() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 500), style: .plain)
        let indexPaths = tableView.indexPaths(section: 0)
        
        XCTAssert(indexPaths.isEmpty)
    }
    
    func testNextIntedPathRowForSection() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 500), style: .plain)
        let indexPath = tableView.nextIndexPath(row: 0, forSection: 0)
        
        XCTAssert(indexPath == nil)
    }
    
    func testPreviousIntedPathRowForSection() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 500), style: .plain)
        let indexPath = tableView.previousIndexPath(row: 0, forSection: 0)
        
        XCTAssert(indexPath == nil)
    }
}
