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
    var button: BFButton = BFButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44), image: UIImage(color: #colorLiteral(red: 0.8862745166, green: 0.2039215714, blue: 0, alpha: 1))!, highlightedImage: UIImage(color: #colorLiteral(red: 0.8862745166, green: 0.2039215714, blue: 0, alpha: 1))!, fadeDuration: 1)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsHighlighted() {
        button.isHighlighted = true
        XCTAssert(button.isHighlighted)
        
        button.isHighlighted = false
        XCTAssert(!button.isHighlighted)
    }
    
    func testOverlayImageView() {
        button.overlayImageView = UIImageView(image: UIImage(color: #colorLiteral(red: 0.8862745166, green: 0.2039215714, blue: 0, alpha: 1)))
        
        XCTAssert(button.overlayImageView.image != nil)
    }
    
    /*func testInitCoder() {
        
    }*/
    
    func testInit() {
        XCTAssert(!button.isHighlighted)
    }
}
