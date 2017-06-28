//
//  UIImageExtension.swift
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
import CoreGraphics
#if os(watchOS)
    import WatchKit
#elseif os(iOS)
    import CoreImage
    import Accelerate
#endif

// MARK: - UIImage extension

/// This extesion adds some useful functions to UIImage.
public extension UIImage {
    // MARK: - Functions
    
    /// Create a dummy image.
    ///
    /// - Parameter dummy: This parameter must contain: "100x100", "100x100.#FFFFFF" or "100x100.blue" (if it is a color defined in UIColor class) if you want to define a color. Default color is lightGray.
    public convenience init?(dummyImage dummy: String) {
        var size: CGSize = CGSize.zero, color: UIColor = UIColor.lightGray
        
        let array: Array = dummy.components(separatedBy: ".")
        if !array.isEmpty {
            let sizeString: String = array[0]
            
            if array.count > 1 {
                color = UIColor.color(string: array[1])
            }
            
            size = UIImage.size(sizeString: sizeString)
        }
        
        UIGraphicsBeginImageContextWithOptions(size, true, UIImage.screenScale())
        
        let rect: CGRect = CGRect(origin: .zero, size: size)
        
        color.setFill()
        UIRectFill(rect)
        
        let sizeString: String = "\(Int(size.width)) x \(Int(size.height))"
        let style: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle // swiftlint:disable:this force_cast
        style.alignment = .center
        style.minimumLineHeight = size.height / 2
        let attributes: Dictionary = [NSAttributedStringKey.paragraphStyle: style]
        sizeString.draw(in: rect, withAttributes:attributes)
        
        if let result = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            self.init(cgImage: result.cgImage!, scale: UIImage.screenScale(), orientation: .up)
        } else {
            UIGraphicsEndImageContext()
            self.init(color: color)
        }
    }
    
    /// Create a dummy image.
    ///
    /// - Parameters:
    ///   - width: Width of dummy image.
    ///   - height: Height of dummy image.
    ///   - color: Color of dummy image. Can be HEX or color like "blue". Default color is lightGray.
    public convenience init?(width: CGFloat, height: CGFloat, color: String = "lightGray") {
        self.init(dummyImage: "\(Int(width))x\(Int(height)).\(color)")
    }
    
    /// Create a dummy image.
    ///
    /// - Parameters
    ///   - size: Size of dummy image.
    ///   - color: Color of dummy image. Can be HEX or color like "blue". Default color is lightGray.
    public convenience init?(size: CGSize, color: String = "lightGray") {
        self.init(width: size.height, height: size.width, color: color)
    }
    
    /// Create an image from a given text.
    ///
    /// - Parameters:
    ///   - text: Text.
    ///   - font: Text font name.
    ///   - fontSize: Text font size.
    ///   - imageSize: Image size.
    public convenience init?(text: String, font: FontName, fontSize: CGFloat, imageSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIImage.screenScale())
        
        text.draw(at: CGPoint(x: 0.0, y: 0.0), withAttributes: [NSAttributedStringKey.font: UIFont(fontName: font, size:fontSize)])
        
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        self.init(cgImage: image.cgImage!, scale: UIImage.screenScale(), orientation: .up)
    }
    
    /// Create an image with a background color and with a text with a mask.
    ///
    /// - Parameters:
    ///   - maskedText: Text to mask.
    ///   - font: Text font name.
    ///   - fontSize: Text font size.
    ///   - imageSize: Image size.
    ///   - backgroundColor: Image background color.
    public convenience init?(maskedText: String, font: FontName, fontSize: CGFloat, imageSize: CGSize, backgroundColor: UIColor) {
        let fontName: UIFont = UIFont(fontName: font, size: fontSize)
        let textAttributes = [NSAttributedStringKey.font: fontName]
        
        let textSize: CGSize = maskedText.size(withAttributes: textAttributes)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIImage.screenScale())
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        context.setFillColor(backgroundColor.cgColor)
        
        let path: UIBezierPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        context.addPath(path.cgPath)
        context.fillPath()
        
        context.setBlendMode(.destinationOut)
        let center: CGPoint = CGPoint(x: imageSize.width / 2 - textSize.width / 2, y: imageSize.height / 2 - textSize.height / 2)
        maskedText.draw(at: center, withAttributes: textAttributes)
        
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        self.init(cgImage: image.cgImage!, scale: UIImage.screenScale(), orientation: .up)
    }
    
    /// Create an image from a given color.
    ///
    /// - Parameter color: Color value.
    public convenience init?(color: UIColor) {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1 * UIImage.screenScale(), height: 1 * UIImage.screenScale())
        UIGraphicsBeginImageContext(rect.size)
        
        color.setFill()
        UIRectFill(rect)
        
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        UIGraphicsEndImageContext()
        
        self.init(cgImage: image.cgImage!, scale: UIImage.screenScale(), orientation: .up)
    }
    
    /// Create an image from a base64 String.
    ///
    /// - Parameter base64: Base64 String.
    public convenience init?(base64: String) {
        guard let data = Data(base64Encoded: base64, options: .ignoreUnknownCharacters) else {
            return nil
        }
        self.init(data: data)
    }
    
    /// Returns the screen scale, based on the device.
    ///
    /// - Returns: Returns the screen scale, based on the device.
    public static func screenScale() -> CGFloat {
        #if os(iOS)
            return UIScreen.main.scale
        #elseif os(watchOS)
            return WKInterfaceDevice.current().screenScale
        #endif
    }
    
    /// Create a CGSize with a given string (100x100).
    ///
    /// - Parameter sizeString: String with the size.
    /// - Returns: Returns the created CGSize.
    private static func size(sizeString: String) -> CGSize {
        let array: Array = sizeString.components(separatedBy: "x")
        guard array.count >= 2 else {
            return CGSize.zero
        }
        
        return CGSize(width: CGFloat(array[0].floatValue), height: CGFloat(array[1].floatValue))
    }
    
    /// Apply the given Blend Mode.
    ///
    /// - Parameters:
    ///   - image: Image to be added to blend.
    ///   - blendMode: Blend Mode.
    /// - Returns: Returns the image.
    public func blend(image: UIImage, blendMode: CGBlendMode) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        UIGraphicsBeginImageContextWithOptions(self.size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return self
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.fill(rect)
        
        self.draw(in: rect, blendMode: .normal, alpha: 1)
        image.draw(in: rect, blendMode: blendMode, alpha: 1)
        
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return result
    }
    
    /// Create an image from a given rect of self.
    ///
    /// - Parameter rect:  Rect to take the image.
    /// - Returns: Returns the image from a given rect.
    public func crop(in rect: CGRect) -> UIImage {
        let imageRef: CGImage = self.cgImage!.cropping(to: CGRect(x: rect.origin.x * self.scale, y: rect.origin.y * self.scale, width: rect.size.width * self.scale, height: rect.size.height * self.scale))!
        let subImage: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        return subImage
    }
    
    /// Scale the image to the minimum given size.
    ///
    /// - Parameter targetSize: The size to scale to.
    /// - Returns: Returns the scaled image.
    public func scaleProportionally(toMinimumSize targetSize: CGSize) -> UIImage {
        let sourceImage: UIImage = self
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
            
            scaleFactor = widthFactor > heightFactor ? widthFactor : heightFactor
            
            scaledWidth = width * scaleFactor
            scaledHeight = height * scaleFactor
            
            if widthFactor > heightFactor {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            } else if widthFactor < heightFactor {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(newTargetSize, false, UIImage.screenScale())
        var thumbnailRect: CGRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width  = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Scale the image to the maxinum given size.
    ///
    /// - Parameter targetSize: The site to scale to.
    /// - Returns: Returns the scaled image.
    public func scaleProportionally(toMaximumSize targetSize: CGSize) -> UIImage {
        let newTargetSize: CGSize = targetSize
        
        if (self.size.width > newTargetSize.width || newTargetSize.width == newTargetSize.height), self.size.width > self.size.height {
            let factor: CGFloat = (newTargetSize.width * 100)/self.size.width
            let newWidth: CGFloat = (self.size.width * factor)/100
            let newHeight: CGFloat = (self.size.height * factor)/100
            
            let newSize: CGSize = CGSize(width: newWidth, height: newHeight)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIImage.screenScale())
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        } else if (self.size.height > newTargetSize.height || newTargetSize.width == newTargetSize.height), self.size.width < self.size.height {
            let factor: CGFloat = (newTargetSize.width * 100)/self.size.height
            let newWidth: CGFloat = (self.size.width * factor)/100
            let newHeight: CGFloat = (self.size.height * factor)/100
            
            let newSize: CGSize = CGSize(width: newWidth, height: newHeight)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIImage.screenScale())
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        } else if (self.size.height > newTargetSize.height || self.size.width > newTargetSize.width ), self.size.width == self.size.height {
            let factor: CGFloat = (newTargetSize.height * 100) / self.size.height
            let newDimension: CGFloat = (self.size.height * factor) / 100
            
            let newSize: CGSize = CGSize(width: newDimension, height: newDimension)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIImage.screenScale())
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        } else {
            let newSize: CGSize = CGSize(width: self.size.width, height: self.size.height)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIImage.screenScale())
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        }
        
        guard let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Scale the image proportionally to the given size.
    ///
    /// - Parameter targetSize: The site to scale to.
    /// - Returns: Returns the scaled image.
    public func scaleProportionally(toSize targetSize: CGSize) -> UIImage {
        let sourceImage: UIImage = self
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
        
        UIGraphicsBeginImageContextWithOptions(newTargetSize, false, UIImage.screenScale())
        
        var thumbnailRect: CGRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Scele the image to the given size.
    ///
    /// - Parameter targetSize: The site to scale to.
    /// - Returns: Returns the scaled image.
    public func scale(toSize targetSize: CGSize) -> UIImage {
        let sourceImage: UIImage = self
        
        let targetWidth: CGFloat = targetSize.width
        let targetHeight: CGFloat = targetSize.height
        
        let scaledWidth: CGFloat = targetWidth
        let scaledHeight: CGFloat = targetHeight
        
        let thumbnailPoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, UIImage.screenScale())
        
        var thumbnailRect: CGRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Flip the image horizontally, like a mirror.
    ///
    /// Example: Image -> egamI.
    ///
    /// - Returns: Returns the flipped image.
    public func flipHorizontally() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIImage.screenScale())
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return self
        }
            
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        context.translateBy(x: self.size.width, y: 0)
        context.scaleBy(x: -1.0, y: 1.0)
        
        context.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Flip the image vertically.
    ///
    /// Example: Image -> Iɯɐƃǝ.
    ///
    /// - Returns: Returns the flipped image.
    public func flipVertically() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIImage.screenScale())
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        
        context.translateBy(x: 0, y: 0)
        context.scaleBy(x: 1.0, y: 1.0)
        
        context.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return newImage
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
        let newImage: UIImage = UIImage(cgImage: mainViewContentBitmapContext)
        
        return newImage
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
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIImage.screenScale())
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        context.setFillColor(cgColor)
        context.fill(imageRect)
        self.draw(in: imageRect)
        
        guard let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Check if the image is in grayscale.
    ///
    /// - Returns: Returns true if is in grayscale, otherwise false.
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
        let context: CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: 0)!

        context.draw(self.cgImage!, in: rect)
        
        let grayscale: CGImage = context.makeImage()!
        let newImage: UIImage = UIImage(cgImage: grayscale)
        
        return newImage
    }
    
    /// Transform the image to black and white.
    ///
    /// - Returns: Returns the transformed image.
    public func toBlackAndWhite() -> UIImage {
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let context: CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: 0)!
        
        context.interpolationQuality = .high
        context.setShouldAntialias(false)
        context.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let bwImage: CGImage = context.makeImage()!
        let newImage: UIImage = UIImage(cgImage: bwImage)
        
        return newImage
    }
    
    /// Invert the color of the image.
    ///
    /// - Returns: Returns the transformed image.
    public func invertColors() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIImage.screenScale())
        UIGraphicsGetCurrentContext()?.setBlendMode(.copy)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        UIGraphicsGetCurrentContext()?.setBlendMode(.difference)
        UIGraphicsGetCurrentContext()?.setFillColor(UIColor.white.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    #if os(iOS)
        /// Creates an image from an UIView.
        ///
        /// - Parameter view: UIView.
        public convenience init?(view: UIView) {
            UIGraphicsBeginImageContext(view.frame.size)
            guard let context = UIGraphicsGetCurrentContext() else {
                return nil
            }
            view.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            guard let cgImage = image?.cgImage else {
                return nil
            }
            self.init(cgImage: cgImage)
        }
    
        /// Rotate the image to the given radians.
        ///
        /// - Parameter radians: Radians to rotate to
        /// - Returns: Returns the rotated image.
        public func rotate(radians: Float) -> UIImage {
            return self.rotate(degrees: radiansToDegrees(radians))
        }
        
        /// Rotate the image to the given degrees.
        ///
        /// - Parameter degrees: Degrees to rotate to.
        /// - Returns: Returns the rotated image.
        public func rotate(degrees: Float) -> UIImage {
            let rotatedViewBox: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
            let transformation: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(degreesToRadians(degrees)))
            rotatedViewBox.transform = transformation
            let rotatedSize: CGSize = CGSize(width: Int(rotatedViewBox.frame.size.width), height: Int(rotatedViewBox.frame.size.height))
            
            UIGraphicsBeginImageContextWithOptions(rotatedSize, false, UIImage.screenScale())
            guard let context: CGContext = UIGraphicsGetCurrentContext() else {
                UIGraphicsEndImageContext()
                return self
            }
            
            context.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
            
            context.rotate(by: CGFloat(degreesToRadians(Float(degrees))))
            
            context.scaleBy(x: 1.0, y: -1.0)
            context.draw(self.cgImage!, in: CGRect(x: -self.size.width / 2, y: -self.size.height / 2, width: self.size.width, height: self.size.height))
            
            guard let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
                UIGraphicsEndImageContext()
                return self
            }
            UIGraphicsEndImageContext()
            
            return newImage
        }
        
        /// Apply a filter to the image.
        /// Full list of CIFilters [here](https://developer.apple.com/library/prerelease/content/documentation/GraphicsImaging/Reference/CoreImageFilterReference/).
        ///
        /// - Parameters:
        ///   - name: Filter name.
        ///   - parameters: Keys and values of the filter. A key example is kCIInputCenterKey.
        /// - Returns: Returns the transformed image.
        public func filter(name: String, parameters: [String: Any] = [:]) -> UIImage {
            let context: CIContext = CIContext(options: nil)
            guard let filter = CIFilter(name: name), let ciImage: CIImage = CIImage(image: self) else {
                return self
            }
            
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            
            for (key, value) in parameters {
                filter.setValue(value, forKey: key)
            }
            
            guard let outputImage = filter.outputImage, let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
                return self
            }
            
            let newImage: UIImage = UIImage(cgImage: cgImage, scale: UIImage.screenScale(), orientation: self.imageOrientation)
            
            return newImage.scale(toSize: self.size)
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
            return self.filter(name: "CICircleSplashDistortion", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius])
        }
        
        /// Apply the circular wrap effect to the image.
        ///
        /// - Parameters:
        ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
        ///   - radius: Radius of the effect.
        ///   - angle: Angle of the effect in radians.
        /// - Returns: Returns the transformed image.
        public func circularWrap(center: CIVector, radius: Float, angle: Float) -> UIImage {
            return self.filter(name: "CICircularWrap", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius, kCIInputAngleKey: angle])
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
        public func sepiaTone(intensity: Float) -> UIImage {
            return self.filter(name: "CISepiaTone", parameters: [kCIInputIntensityKey: intensity])
        }
        
        /// Apply the blur effect to the image.
        ///
        /// - Parameters:
        ///   - blurRadius: Blur radius.
        ///   - saturation: Saturation delta factor, leave it default (1.8) if you don't what is.
        ///   - tintColor: Blur tint color, default is nil.
        ///   - maskImage: Apply a mask image, leave it default (nil) if you don't want to mask.
        /// - Returns: Return the transformed image.
        public func blur(radius blurRadius: CGFloat, saturation: CGFloat = 1.8, tintColor: UIColor? = nil, maskImage: UIImage? = nil) -> UIImage {
            guard size.width > 1 && size.height > 1, let selfCGImage = cgImage else {
                return self
            }
            
            let imageRect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
            var effectImage = self
            
            let hasBlur = Float(blurRadius) > Float.ulpOfOne
            let hasSaturationChange = Float(abs(saturation - 1)) > Float.ulpOfOne
            
            if hasBlur || hasSaturationChange {
                UIGraphicsBeginImageContextWithOptions(size, false, UIImage.screenScale())
                guard let effectInContext = UIGraphicsGetCurrentContext() else {
                    UIGraphicsEndImageContext()
                    return self
                }
                effectInContext.scaleBy(x: 1, y: -1)
                effectInContext.translateBy(x: 0, y: -size.height)
                effectInContext.draw(selfCGImage, in: imageRect)
                var effectInBuffer = vImage_Buffer(data: effectInContext.data, height: UInt(effectInContext.height), width: UInt(effectInContext.width), rowBytes: effectInContext.bytesPerRow)
                
                UIGraphicsBeginImageContextWithOptions(size, false, UIImage.screenScale())
                guard let effectOutContext = UIGraphicsGetCurrentContext() else {
                    UIGraphicsEndImageContext()
                    return self
                }
                var effectOutBuffer = vImage_Buffer(data: effectOutContext.data, height: UInt(effectOutContext.height), width: UInt(effectOutContext.width), rowBytes: effectOutContext.bytesPerRow)
                
                if hasBlur {
                    var inputRadius = blurRadius * UIImage.screenScale()
                    inputRadius = inputRadius * 3.0 * CGFloat(sqrt(2 * Double.pi)) / 4 + 0.5
                    var radius = UInt32(floor(inputRadius))
                    if radius % 2 != 1 {
                        radius += 1
                    }
                    
                    let imageEdgeExtendFlags = vImage_Flags(kvImageEdgeExtend)
                    vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                    vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                    vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                }
                
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
                    } else {
                        vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
                    }
                }
                
                effectImage = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
            }
            
            UIGraphicsBeginImageContextWithOptions(size, false, UIImage.screenScale())
            guard let outputContext = UIGraphicsGetCurrentContext() else {
                UIGraphicsEndImageContext()
                return self
            }
            outputContext.scaleBy(x: 1, y: -1)
            outputContext.translateBy(x: 0, y: -size.height)
            
            outputContext.draw(selfCGImage, in: imageRect)
            
            if hasBlur {
                outputContext.saveGState()
                if let maskImage = maskImage {
                    outputContext.clip(to: imageRect, mask: maskImage.cgImage!)
                }
                outputContext.draw(effectImage.cgImage!, in: imageRect)
                outputContext.restoreGState()
            }
            
            if let tintColor = tintColor {
                outputContext.saveGState()
                outputContext.setFillColor(tintColor.cgColor)
                outputContext.fill(imageRect)
                outputContext.restoreGState()
            }
            
            guard let outputImage = UIGraphicsGetImageFromCurrentImageContext() else {
                UIGraphicsEndImageContext()
                return self
            }
            UIGraphicsEndImageContext()
            
            return outputImage
        }
    #endif
}
