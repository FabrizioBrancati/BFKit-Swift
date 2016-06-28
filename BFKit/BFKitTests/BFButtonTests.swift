//
//  BFButtonTests.swift
//  BFKit
//
//  Created by Fabrizio on 28/06/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import BFKit

class BFButtonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit() {
        let button = BFButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44), image: UIImage(color: UIColor.orange())!, highlightedImage: UIImage(color: UIColor.red())!, fadeDuration: 1)
        
        XCTAssert(!button.isHighlighted)
    }
}
