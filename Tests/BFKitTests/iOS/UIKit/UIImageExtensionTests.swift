//
//  UIImageExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 02/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIImageExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitDummyImage() {
        guard let image = UIImage(dummyImage: "100x100.red") else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testInitHeightWidthColor() {
        guard let image = UIImage(width: 200, height: 200, color: "green") else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 200)
    }
    
    func testInitSizeColor() {
        guard let image = UIImage(size: CGSize(width: 150, height: 150), color: "yellow") else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 150)
        XCTAssert(image.size.height == 150)
    }
    
    func testInitTextFontFontSizeImageSize() {
        guard let image = UIImage(text: "This is a test", font: .Helvetica, fontSize: 16, imageSize: CGSize(width: 100, height: 100)) else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testInitMaskedTextFontFontSizeImageSizeBackgroundColor() {
        guard let image = UIImage(maskedText: "This is a test", font: .Helvetica, fontSize: 20, imageSize: CGSize(width: 100, height: 100), backgroundColor: UIColor.brown) else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testInitColor() {
        guard let image = UIImage(color: UIColor.gray) else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 1)
        XCTAssert(image.size.height == 1)
    }
    
    func testBlendImageBlendMode() {
        guard var image = UIImage(dummyImage: "100x100.red"), let imageBlend = UIImage(color: UIColor.blue) else {
            XCTAssert(false)
            return
        }
        
        image = image.blend(image: imageBlend, blendMode: .luminosity)
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testImageRect() {
        guard var image = UIImage(dummyImage: "100x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.crop(in: CGRect(x: 0, y: 0, width: 75, height: 75))
        
        XCTAssert(image.size.width == 75)
        XCTAssert(image.size.height == 75)
    }
    
    func testScaleProportionallyToMinimumSize() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.scaleProportionally(toMinimumSize: CGSize(width: 100, height: 100))
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testScaleProportionallyToMaximumSize() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
     
        image = image.scaleProportionally(toMaximumSize: CGSize(width: 100, height: 100))
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 50)
    }
    
    func testScaleProportionallyToSize() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.scale(toSize: CGSize(width: 50, height: 50))
        
        XCTAssert(image.size.width == 50)
        XCTAssert(image.size.height == 50)
    }
    
    func testRotateRadians() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.rotate(radians: Float(M_PI_2))
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 200)
    }
    
    func testRotateDegrees() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.rotate(degrees: 90)
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 200)
    }
    
    func testFlipHorizontally() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.flipHorizontally()
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testFlipVertically() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.flipVertically()
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testHasAlpha() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        XCTAssertFalse(image.hasAlpha())
    }
    
    func testRemoveAlpha() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.removeAlpha()
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testFillAlphaColor() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.fillAlpha(color: UIColor.red)
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testToGrayscale() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.toGrayscale()
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testToBlackAndWhite() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.toBlackAndWhite()
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testInvertColors() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.invertColors()
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testFilterNameParameters() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.filter(name: "CIColorInvert", parameters: [:])
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testBloomRadiusIntensity() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.bloom(radius: 1, intensity: 1)
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testBumpDistortionCenterRadiusScale() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.bumpDistortion(center: CIVector(x: 50, y: 50), radius: 1, scale: 1)
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testBumpDistortionLinearCenterRadiusScaleAngle() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.bumpDistortionLinear(center: CIVector(x: 50, y: 50), radius: 1, scale: 1, angle: 0)
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testCirleSplashDistortionCenterRadius() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.circleSplashDistortion(center: CIVector(x: 50, y: 50), radius: 1)
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testCircularWrapCenterRadiusAngle() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.circularWrap(center: CIVector(x: 50, y: 50), radius: 1, angle: 0)
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testCMYKHalftoneCenterWidthAngleSharpnessGCRUCR() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.cmykHalftone(center: CIVector(x: 50, y: 50), width: 100, angle: 0, sharpness: 1, gcr: 1, ucr: 1)
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testSepiaToneIntensity() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.sepiaTone(intensity: 1)
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
    
    func testBlurRadiusTintColorSaturationMaskImage() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.blur(radius: 4, saturation: 2)
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 100)
    }
}
