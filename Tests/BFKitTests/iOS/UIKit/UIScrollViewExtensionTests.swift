//
//  UIScrollViewExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 06/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
import UIKit
@testable import BFKit

class UIScrollViewExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFrameContentSizeClipsToBoundsPagingEnabledShowScrollIndicatorsDelegate() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 320, height: 500), contentSize: CGSize(width: 500, height: 750), clipsToBounds: true, pagingEnabled: false, showScrollIndicators: true, delegate: nil)
        
        XCTAssert(scrollView.frame == CGRect(x: 0, y: 0, width: 320, height: 500))
        XCTAssert(scrollView.contentSize == CGSize(width: 500, height: 750))
        XCTAssert(scrollView.clipsToBounds == true)
        XCTAssert(scrollView.isPagingEnabled == false)
        XCTAssert(scrollView.showsHorizontalScrollIndicator == true)
        XCTAssert(scrollView.showsVerticalScrollIndicator == true)
        XCTAssert(scrollView.delegate == nil)
    }
}
