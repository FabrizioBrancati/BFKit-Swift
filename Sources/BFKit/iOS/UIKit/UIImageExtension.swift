//
//  UIImageExtension.swift
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
import CoreImage
import CoreGraphics
import Accelerate

// MARK: UIImage extension

/// This extesion adds some useful functions to UIImage.
public extension UIImage {
    // MARK: - Functions
    
    /// Create a dummy image.
    ///
    /// - Parameter dummy: This parameter must contain: "100x100", "100x100.#FFFFFF" or "100x100.blue" (if it's a color defined in UIColor class) if you want to define a color.
    public convenience init?(dummyImage dummy: String) {
        var size: CGSize = CGSize.zero, color: UIColor = UIColor.lightGray
        
        let array: Array = dummy.components(separatedBy: ".")
        if !array.isEmpty {
            let sizeString: String = array[0]
            
            if array.count >= 1 {
                color = UIColor.color(string: array[1])
            }
            
            size = UIImage.size(sizeString: sizeString)
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        let rect: CGRect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        
        color.setFill()
        context.fill(rect)
        
        let sizeString: String = "\(Int(size.width)) x \(Int(size.height))"
        let style: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        style.alignment = .center
        style.minimumLineHeight = size.height / 2
        let attributes: Dictionary = [NSParagraphStyleAttributeName : style]
        sizeString.draw(in: rect, withAttributes:attributes)
        
        let result: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.init(cgImage: result.cgImage!)
    }
    
    /// Create an image from a given text.
    ///
    /// - Parameters:
    ///   - text: Text.
    ///   - font: Text's font name.
    ///   - fontSize: Text's font size.
    ///   - imageSize: Image's size.
    public convenience init?(text: String, font: FontName, fontSize: CGFloat, imageSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        
        text.draw(at: CGPoint(x: 0.0, y: 0.0), withAttributes: [NSFontAttributeName : UIFont(fontName: font, size:fontSize)!])
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.init(cgImage: image.cgImage!)
    }
    
    /// Create an image with a background color and with a text with a mask.
    ///
    /// - Parameters:
    ///   - maskedText: Text to mask.
    ///   - font: Text's font name.
    ///   - fontSize: Text's font size.
    ///   - imageSize: Image's size.
    ///   - backgroundColor: Image's background color.
    public convenience init?(maskedText: String, font: FontName, fontSize: CGFloat, imageSize: CGSize, backgroundColor: UIColor) {
        let fontName: UIFont = UIFont(fontName: font, size: fontSize)!
        let textAttributes = [NSFontAttributeName : fontName]
        
        let textSize: CGSize = maskedText.size(attributes: textAttributes)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        
        ctx.setFillColor(backgroundColor.cgColor)
        
        let path: UIBezierPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        ctx.addPath(path.cgPath)
        ctx.fillPath()
        
        ctx.setBlendMode(.destinationOut)
        let center: CGPoint = CGPoint(x: imageSize.width / 2 - textSize.width / 2, y: imageSize.height / 2 - textSize.height / 2)
        maskedText.draw(at: center, withAttributes: textAttributes)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.init(cgImage: image.cgImage!)
    }
    
    /// Create an image from a given color.
    ///
    /// - Parameter color: Color value.
    public convenience init?(color: UIColor) {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        
        context.fill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.init(cgImage: image.cgImage!)
    }
    
    /// Create a CGSize with a given string (100x100).
    ///
    /// - Parameter sizeString: String with the size.
    /// - Returns: Returns the created CGSize.
    private static func size(sizeString: String) -> CGSize {
        let array: Array = sizeString.components(separatedBy: "x")
        if array.count < 3 {
            return CGSize.zero
        }
        
        return CGSize(width: CGFloat(array[0].floatValue), height: CGFloat(array[1].floatValue))
    }
    
    /// Apply the given Blend Mode.
    ///
    /// - Parameter blendMode: Blend Mode.
    /// - Returns: Returns the image.
    public func blendMode(_ blendMode: CGBlendMode) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.size.width, height: self.size.height), false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height), blendMode: blendMode, alpha: 1)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// Apply the Blend Mode Overlay.
    ///
    /// - Returns: Returns the image.
    public func blendOverlay() -> UIImage {
        return self.blendMode(.overlay)
    }
    
    /// Create an image from a given rect of self.
    ///
    /// - Parameter rect:  Rect to take the image.
    /// - Returns: Returns the image from a given rect.
    public func image(rect: CGRect) -> UIImage {
        let imageRef: CGImage = self.cgImage!.cropping(to: rect)!
        let subImage: UIImage = UIImage(cgImage: imageRef)
        
        return subImage
    }
    
    /// Scale the image to the minimum given size.
    ///
    /// - Parameter targetSize: The size to scale to.
    /// - Returns: Returns the scaled image.
    public func scaleProportionally(toMinimumSize targetSize: CGSize) -> UIImage? {
        let sourceImage: UIImage = self
        var newImage: UIImage? = nil
        let newTargetSize: CGSize = targetSize
        
        let imageSize: CGSize = sourceImage.size
        let width: CGFloat = imageSize.width
        let height: CGFloat = imageSize.height
        
        let targetWidth: CGFloat = newTargetSize.width
        let targetHeight: CGFloat = newTargetSize.height
        
        var scaleFactor: CGFloat = 0.0
        var scaledWidth: CGFloat = targetWidth
        var scaledHeight: CGFloat = targetHeight
        
        var thumbnailPoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
        
        if imageSize.equalTo(newTargetSize) == false {
            let widthFactor: CGFloat = targetWidth / width
            let heightFactor: CGFloat = targetHeight / height
            
            if widthFactor > heightFactor {
                scaleFactor = widthFactor
            } else {
                scaleFactor = heightFactor
            }
            
            scaledWidth = width * scaleFactor
            scaledHeight = height * scaleFactor
            
            if widthFactor > heightFactor {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            } else if widthFactor < heightFactor {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(newTargetSize, false, UIScreen.main.scale)
        var thumbnailRect: CGRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width  = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Scale the image to the maxinum given size.
    ///
    /// - Parameter targetSize: The site to scale to.
    /// - Returns: Returns the scaled image.
    public func scaleProportionally(toMaximumSize targetSize: CGSize) -> UIImage {
        let newTargetSize: CGSize = targetSize
        
        if (self.size.width > newTargetSize.width || newTargetSize.width == newTargetSize.height) && self.size.width > self.size.height {
            let factor: CGFloat = (newTargetSize.width * 100)/self.size.width
            let newWidth: CGFloat = (self.size.width * factor)/100
            let newHeight: CGFloat = (self.size.height * factor)/100
            
            let newSize: CGSize = CGSize(width: newWidth, height: newHeight)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        } else if (self.size.height > newTargetSize.height || newTargetSize.width == newTargetSize.height) && self.size.width < self.size.height {
            let factor: CGFloat = (newTargetSize.width * 100)/self.size.height
            let newWidth: CGFloat = (self.size.width * factor)/100
            let newHeight: CGFloat = (self.size.height * factor)/100
            
            let newSize: CGSize = CGSize(width: newWidth, height: newHeight)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        } else if (self.size.height > newTargetSize.height || self.size.width > newTargetSize.width ) && self.size.width == self.size.height {
            let factor: CGFloat = (newTargetSize.height * 100) / self.size.height
            let newDimension: CGFloat = (self.size.height * factor) / 100
            
            let newSize: CGSize = CGSize(width: newDimension, height: newDimension)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        } else {
            let newSize: CGSize = CGSize(width: self.size.width, height: self.size.height)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        }
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// Scale the image proportionally to the given size.
    ///
    /// - Parameter targetSize: The site to scale to.
    /// - Returns: Returns the scaled image.
    public func scaleProportionally(toSize targetSize: CGSize) -> UIImage? {
        let sourceImage: UIImage = self
        var newImage: UIImage? = nil
        let newTargetSize: CGSize = targetSize

        let imageSize: CGSize = sourceImage.size
        let width: CGFloat = imageSize.width
        let height: CGFloat = imageSize.height
        
        let targetWidth: CGFloat = newTargetSize.width
        let targetHeight: CGFloat = newTargetSize.height
        
        var scaleFactor: CGFloat = 0.0
        var scaledWidth: CGFloat = targetWidth
        var scaledHeight: CGFloat = targetHeight
        
        var thumbnailPoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
        
        if imageSize.equalTo(newTargetSize) == false {
            let widthFactor: CGFloat = targetWidth / width
            let heightFactor: CGFloat = targetHeight / height
            
            if widthFactor < heightFactor {
                scaleFactor = widthFactor
            } else {
                scaleFactor = heightFactor
            }
            
            scaledWidth = width * scaleFactor
            scaledHeight = height * scaleFactor
            
            if widthFactor < heightFactor {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            } else if widthFactor > heightFactor {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(newTargetSize, false, UIScreen.main.scale)
        
        var thumbnailRect: CGRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Scele the image to the given size.
    ///
    /// - Parameter targetSize: The site to scale to.
    /// - Returns: Returns the scaled image.
    public func scale(toSize targetSize: CGSize) -> UIImage? {
        let sourceImage: UIImage = self
        var newImage: UIImage? = nil
        
        let targetWidth: CGFloat = targetSize.width
        let targetHeight: CGFloat = targetSize.height
        
        let scaledWidth: CGFloat = targetWidth
        let scaledHeight: CGFloat = targetHeight
        
        let thumbnailPoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, UIScreen.main.scale)
        
        var thumbnailRect: CGRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Rotate the image to the given radians.
    ///
    /// - Parameter radians: Radians to rotate to
    /// - Returns: Returns the rotated image.
    public func rotate(radians: CGFloat) -> UIImage {
        return self.rotate(degrees: CGFloat(radiansToDegrees(Float(radians))))
    }
    
    /// Rotate the image to the given degrees.
    ///
    /// - Parameter degrees: Degrees to rotate to.
    /// - Returns: Returns the rotated image.
    public func rotate(degrees: CGFloat) -> UIImage {
        let rotatedViewBox: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let t: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(degreesToRadians(Float(degrees))))
        rotatedViewBox.transform = t
        let rotatedSize: CGSize = rotatedViewBox.frame.size
        
        UIGraphicsBeginImageContextWithOptions(rotatedSize, false, UIScreen.main.scale)
        let bitmap: CGContext = UIGraphicsGetCurrentContext()!
        
        bitmap.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
        
        bitmap.rotate(by: CGFloat(degreesToRadians(Float(degrees))))
        
        bitmap.scaleBy(x: 1.0, y: -1.0)
        bitmap.draw(self.cgImage!, in: CGRect(x: -self.size.width / 2, y: -self.size.height / 2, width: self.size.width, height: self.size.height))
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Flip the image horizontally.
    ///
    /// - Returns: Returns the flipped image.
    public func flipHorizontally() -> UIImage {
        return UIImage(cgImage: self.cgImage!, scale: self.scale, orientation: .upMirrored)
    }
    
    /// Flip the image vertically.
    ///
    /// - Returns: Returns the flipped image.
    public func flipVertically() -> UIImage {
        return UIImage(cgImage: self.cgImage!, scale: self.scale, orientation: .leftMirrored)
    }
    
    /// Check if the image has alpha.
    ///
    /// - Returns: Returns true if has alpha, otherwise false.
    public func hasAlpha() -> Bool {
        let alpha: CGImageAlphaInfo = self.cgImage!.alphaInfo
        return (alpha == .first || alpha == .last || alpha == .premultipliedFirst || alpha == .premultipliedLast)
    }
    
    /// Remove the alpha of the image.
    ///
    /// - Returns: Returns the image without alpha.
    public func removeAlpha() -> UIImage {
        guard self.hasAlpha() else {
            return self
        }
        
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let mainViewContentContext: CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: self.cgImage!.bitmapInfo.rawValue)!
        
        mainViewContentContext.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let mainViewContentBitmapContext: CGImage = mainViewContentContext.makeImage()!
        let image: UIImage = UIImage(cgImage: mainViewContentBitmapContext)
        
        return image
    }
    
    /// Fill the alpha with the given color.
    ///
    /// Default is white.
    ///
    /// - Parameter color: Color to fill.
    /// - Returns: Returns the filled image.
    public func fillAlpha(color: UIColor = UIColor.white) -> UIImage {
        let imageRect: CGRect = CGRect(origin: CGPoint.zero, size: self.size)
        
        let cgColor: CGColor = color.cgColor
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(cgColor)
        context.fill(imageRect)
        self.draw(in: imageRect)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// Check if the image is in grayscale.
    ///
    /// - Returns: Returns true if is in grayscale, false if not.
    public func isGrayscale() -> Bool {
        let imgReference: CGImage = self.cgImage!
        let model: CGColorSpaceModel = imgReference.colorSpace!.model
        
        return model == CGColorSpaceModel.monochrome
    }
    
    /// Transform the image to grayscale.
    ///
    /// - Returns: Returns the transformed image.
    public func toGrayscale() -> UIImage {
        let rect: CGRect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let context: CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: .allZeros)!

        context.draw(self.cgImage!, in: rect)
        let grayscale: CGImage = context.makeImage()!
        let image: UIImage = UIImage(cgImage: grayscale)
        
        return image
    }
    
    /// Transform the image to black and white.
    ///
    /// - Returns: Returns the transformed image.
    public func toBlackAndWhite() -> UIImage {
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let context: CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: .allZeros)!
        context.interpolationQuality = .high
        context.setShouldAntialias(false)
        context.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let bwImage: CGImage = context.makeImage()!
        
        let image: UIImage = UIImage(cgImage: bwImage)
        
        return image
    }
    
    /// Invert the color of the image.
    ///
    /// - Returns: Returns the transformed image.
    public func invertColors() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        UIGraphicsGetCurrentContext()?.setBlendMode(.copy)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        UIGraphicsGetCurrentContext()?.setBlendMode(.difference)
        UIGraphicsGetCurrentContext()?.setFillColor(UIColor.white.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    /// Apply a filter to the image.
    ///
    /// - Parameters:
    ///   - name: Filter name.
    ///   - parameters: Keys and values of the filter. A key example is kCIInputCenterKey.
    /// - Returns: Returns the transformed image.
    public func filter(name: String, parameters: [String: Any]) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        guard let filter = CIFilter(name: name), let ciimage: CIImage = CIImage(image: self) else {
            return self
        }
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        
        for (key, value) in parameters {
            filter.setValue(value, forKey: key)
        }
        
        let image: UIImage = UIImage(cgImage: context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)!)
        
        return image
    }
    
    /// Apply the bloom effect to the image.
    ///
    /// - Parameters:
    ///   - radius: Radius of the bloom.
    ///   - intensity: Intensity of the bloom.
    /// - Returns: Returns the transformed image.
    public func bloom(radius: Float, intensity: Float) -> UIImage {
        return self.filter(name: "CIBloom", parameters: [kCIInputRadiusKey: radius, kCIInputIntensityKey: intensity])
    }
    
    /// Apply the bump distortion effect to the image.
    ///
    /// - Parameters:
    ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
    ///   - radius: Radius of the effect.
    ///   - scale: Scale of the effect.
    /// - Returns: Returns the transformed image.
    public func bumpDistortion(center: CIVector, radius: Float, scale: Float) -> UIImage {
        return self.filter(name: "CIBumpDistortion", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius, kCIInputScaleKey: scale])
    }
    
    /// Apply the bump distortion linear effect to the image.
    ///
    /// - Parameters:
    ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
    ///   - radius: Radius of the effect.
    ///   - scale: Scale of the effect.
    ///   - angle: Angle of the effect in radians.
    /// - Returns: Returns the transformed image.
    public func bumpDistortionLinear(center: CIVector, radius: Float, scale: Float, angle: Float) -> UIImage {
        return self.filter(name: "CIBumpDistortionLinear", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius, kCIInputScaleKey: scale, kCIInputAngleKey: angle])
    }
    
    /// Apply the circular splash distortion effect to the image
    ///
    /// - Parameters:
    ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
    ///   - radius: Radius of the effect.
    /// - Returns: Returns the transformed image.
    public func circleSplashDistortion(center: CIVector, radius: Float) -> UIImage {
        return self.filter(name: "CICircleSplashDistortion", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius, kCIInputRadiusKey: radius])
    }
    
    /// Apply the circular wrap effect to the image.
    ///
    /// - Parameters:
    ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
    ///   - radius: Radius of the effect.
    ///   - angle: Angle of the effect in radians.
    /// - Returns: Returns the transformed image.
    public func circularWrap(center: CIVector, radius: Float, angle: Float) -> UIImage {
        return self.filter(name: "CICircularWrap", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius, kCIInputScaleKey: scale, kCIInputAngleKey: angle])
    }
    
    /// Apply the CMY halftone effect to the image.
    ///
    /// - Parameters:
    ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
    ///   - width: Width value.
    ///   - angle: Angle of the effect in radians.
    ///   - sharpness: Sharpness Value.
    ///   - gcr: GCR value.
    ///   - ucr: UCR value
    /// - Returns: Returns the transformed image.
    public func cmykHalftone(center: CIVector, width: Float, angle: Float, sharpness: Float, gcr: Float, ucr: Float) -> UIImage {
        return self.filter(name: "CICMYKHalftone", parameters: [kCIInputCenterKey: center, kCIInputWidthKey: width, kCIInputSharpnessKey: sharpness, kCIInputAngleKey: angle, "inputGCR": gcr, "inputUCR": ucr])
    }
    
    /// Apply the sepia filter to the image.
    ///
    /// - Parameter intensity: Intensity of the filter.
    /// - Returns: Returns the transformed image.
    public func sepiaToneWithIntensity(intensity: Float) -> UIImage {
        return self.filter(name: "CISepiaTone", parameters: [kCIInputIntensityKey: intensity])
    }
    
    /// Apply the blur effect to the image.
    ///
    /// - Parameters:
    ///   - blurRadius: Blur radius.
    ///   - tintColor: Blur tint color.
    ///   - saturation: Saturation delta factor, leave it default (1.8) if you don't what is.
    ///   - maskImage: Apply a mask image, leave it default (nil) if you don't want to mask.
    /// - Returns: Return the transformed image.
    public func blur(radius blurRadius: CGFloat, tintColor: UIColor? = nil, saturation: CGFloat = 1.8, maskImage: UIImage? = nil) -> UIImage? {
        guard size.width != 0 || size.height != 0, cgImage != nil, let maskImage = maskImage, maskImage.cgImage != nil else {
            return nil
        }
        
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        var effectImage = self
        
        let hasBlur = Float(blurRadius) > FLT_EPSILON
        let hasSaturationChange = Float(abs(saturation - 1)) > FLT_EPSILON
        
        if hasBlur || hasSaturationChange {
            UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
            let effectInContext = UIGraphicsGetCurrentContext()
            effectInContext?.scaleBy(x: 1, y: -1)
            effectInContext?.translateBy(x: 0, y: -size.height)
            effectInContext?.draw(cgImage!, in: imageRect)
            var effectInBuffer = vImage_Buffer(data: effectInContext?.data, height: UInt((effectInContext?.height)!), width: UInt((effectInContext?.width)!), rowBytes: (effectInContext?.bytesPerRow)!)
            
            UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
            let effectOutContext = UIGraphicsGetCurrentContext()
            var effectOutBuffer = vImage_Buffer(data: effectOutContext?.data, height: UInt((effectOutContext?.height)!), width: UInt((effectOutContext?.width)!), rowBytes: (effectOutContext?.bytesPerRow)!)
            
            if hasBlur {
                let inputRadius = blurRadius * UIScreen.main.scale
                let temp = inputRadius * 3.0 * CGFloat(sqrt(2 * M_PI)) / 4 + 0.5
                var radius = UInt32(floor(temp))
                if radius % 2 != 1 {
                    radius += 1
                }
                
                let imageEdgeExtendFlags = vImage_Flags(kvImageEdgeExtend)
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
            }
            
            var effectImageBuffersAreSwapped = false
            if hasSaturationChange {
                let s = saturation
                let floatingPointSaturationMatrix = [
                    0.0722 + 0.9278 * s, 0.0722 - 0.0722 * s, 0.0722 - 0.0722 * s, 0,
                    0.7152 - 0.7152 * s, 0.7152 + 0.2848 * s, 0.7152 - 0.7152 * s, 0,
                    0.2126 - 0.2126 * s, 0.2126 - 0.2126 * s, 0.2126 + 0.7873 * s, 0,
                    0, 0, 0, 1
                ]
                
                let divisor: CGFloat = 256
                let saturationMatrix = floatingPointSaturationMatrix.map {
                    return Int16(round($0 * divisor))
                }
                
                if hasBlur {
                    vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
                    effectImageBuffersAreSwapped = true
                } else {
                    vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
                }
            }
            
            if !effectImageBuffersAreSwapped {
                effectImage = UIGraphicsGetImageFromCurrentImageContext()!
            }
            UIGraphicsEndImageContext()
            
            if effectImageBuffersAreSwapped {
                effectImage = UIGraphicsGetImageFromCurrentImageContext()!
            }
            UIGraphicsEndImageContext()
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let outputContext = UIGraphicsGetCurrentContext()
        outputContext?.scaleBy(x: 1, y: -1)
        outputContext?.translateBy(x: 0, y: -size.height)
        
        outputContext?.draw(cgImage!, in: imageRect)

        if hasBlur {
            outputContext?.saveGState()
            outputContext?.clip(to: imageRect, mask: maskImage.cgImage!)
            outputContext?.draw(effectImage.cgImage!, in: imageRect)
            outputContext?.restoreGState()
        }
        
        if let tintColor = tintColor {
            outputContext?.saveGState()
            outputContext?.setFillColor(tintColor.cgColor)
            outputContext?.fill(imageRect)
            outputContext?.restoreGState()
        }
        
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return outputImage
    }
}
