//
//  BFButtonTests.swift
//  BFKit
//
//  Created by Fabrizio on 28/06/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class BFButtonTests: XCTestCase {
    var button: BFButton = BFButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44), image: UIImage(color: UIColor.red)!, highlightedImage: UIImage(color: UIColor.red)!, fadeDuration: 1)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsHighlighted() {
        button.isHighlighted = true
        XCTAssert(button.isHighlighted, "isHighlighted is not true")
        
        button.isHighlighted = false
        XCTAssert(!button.isHighlighted, "isHighlighted is not false")
    }
    
    func testOverlayImageView() {
        button.overlayImageView = UIImageView(image: UIImage(color: UIColor.red))
        
        XCTAssert(button.overlayImageView.image != nil)
    }
    
    /*func testDecode() {
        
    }*/
    
    /*func testEncode() {
 
    }*/
    
    func testInitFrame() {
        XCTAssert(!button.isHighlighted)
    }
}
