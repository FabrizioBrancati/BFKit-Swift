//
//  UIImage+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2019 Fabrizio Brancati.
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

import CoreGraphics
import Foundation
import UIKit
#if canImport(CoreImage)
    import Accelerate
    import CoreImage
#elseif canImport(WatchKit)
    import WatchKit
#endif

// MARK: - UIImage extension

/// This extesion adds some useful functions to UIImage.
public extension UIImage {
    // MARK: - Functions
    
    /// Create a dummy image.
    ///
    /// - Parameter dummy: This parameter must contain: "100x100", "100x100.#FFFFFF" or "100x100.blue" (if it is a color defined in UIColor class) if you want to define a color. Default color is lightGray.
    convenience init?(dummyImage dummy: String) {
        var size = CGSize.zero, color = UIColor.lightGray
        
        let array = dummy.components(separatedBy: ".")
        if !array.isEmpty {
            let sizeString: String = array[0]
            
            if array.count > 1 {
                color = UIColor.color(string: array[1])
            }
            
            size = UIImage.size(sizeString: sizeString)
        }
        
        UIGraphicsBeginImageContextWithOptions(size, true, UIImage.screenScale())
        
        let rect = CGRect(origin: .zero, size: size)
        
        color.setFill()
        UIRectFill(rect)
        
        let widthInt = Int(size.width)
        let heightInt = Int(size.height)
        let sizeString = "\(widthInt) x \(heightInt)"
        guard let paragraphStyle = NSParagraphStyle.default.mutableCopy() as? NSMutableParagraphStyle else {
            return nil
        }
        
        let style = paragraphStyle
        style.alignment = .center
        style.minimumLineHeight = size.height / 2
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        sizeString.draw(in: rect, withAttributes: attributes)
        
        if let result = UIGraphicsGetImageFromCurrentImageContext(), let cgImage = result.cgImage {
            UIGraphicsEndImageContext()
            self.init(cgImage: cgImage, scale: UIImage.screenScale(), orientation: .up)
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
    convenience init?(width: CGFloat, height: CGFloat, color: String = "lightGray") {
        self.init(dummyImage: "\(Int(width))x\(Int(height)).\(color)")
    }
    
    /// Create a dummy image.
    ///
    /// - Parameters
    ///   - size: Size of dummy image.
    ///   - color: Color of dummy image. Can be HEX or color like "blue". Default color is lightGray.
    convenience init?(size: CGSize, color: String = "lightGray") {
        self.init(width: size.height, height: size.width, color: color)
    }
    
    /// Create an image from a given text.
    ///
    /// - Parameters:
    ///   - text: Text.
    ///   - font: Text font name.
    ///   - fontSize: Text font size.
    ///   - imageSize: Image size.
    convenience init?(text: String, font: FontName, fontSize: CGFloat, imageSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIImage.screenScale())
        
        text.draw(at: CGPoint(x: 0.0, y: 0.0), withAttributes: [NSAttributedString.Key.font: UIFont(fontName: font, size: fontSize) as Any])
        
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext(), let cgImage = image.cgImage else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        self.init(cgImage: cgImage, scale: UIImage.screenScale(), orientation: .up)
    }
    
    /// Create an image with a background color and with a text with a mask.
    ///
    /// - Parameters:
    ///   - maskedText: Text to mask.
    ///   - font: Text font name.
    ///   - fontSize: Text font size.
    ///   - imageSize: Image size.
    ///   - backgroundColor: Image background color.
    convenience init?(maskedText: String, font: FontName, fontSize: CGFloat, imageSize: CGSize, backgroundColor: UIColor) {
        guard let fontName = UIFont(fontName: font, size: fontSize) else {
            return nil
        }
        
        let textAttributes = [NSAttributedString.Key.font: fontName]
        let textSize = maskedText.size(withAttributes: textAttributes)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIImage.screenScale())
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        context.setFillColor(backgroundColor.cgColor)
        
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        
        context.addPath(path.cgPath)
        context.fillPath()
        
        context.setBlendMode(.destinationOut)
        
        let center = CGPoint(x: imageSize.width / 2 - textSize.width / 2, y: imageSize.height / 2 - textSize.height / 2)
        
        maskedText.draw(at: center, withAttributes: textAttributes)
        
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext(), let cgImage = image.cgImage else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        self.init(cgImage: cgImage, scale: UIImage.screenScale(), orientation: .up)
    }
    
    /// Create an image from a given color.
    ///
    /// - Parameter color: Color value.
    convenience init?(color: UIColor) {
        let rect = CGRect(x: 0, y: 0, width: 1 * UIImage.screenScale(), height: 1 * UIImage.screenScale())
        
        UIGraphicsBeginImageContext(rect.size)
        
        color.setFill()
        UIRectFill(rect)
        
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext(), let cgImage = image.cgImage else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        self.init(cgImage: cgImage, scale: UIImage.screenScale(), orientation: .up)
    }
    
    /// Create an image from a base64 String.
    ///
    /// - Parameter base64: Base64 String.
    convenience init?(base64: String) {
        guard let data = Data(base64Encoded: base64, options: .ignoreUnknownCharacters) else {
            return nil
        }
        
        self.init(data: data)
    }
    
    /// Returns the screen scale, based on the device.
    ///
    /// - Returns: Returns the screen scale, based on the device.
    static func screenScale() -> CGFloat {
        #if canImport(CoreImage)
            return UIScreen.main.scale
        #elseif canImport(WatchKit)
            return WKInterfaceDevice.current().screenScale
        #endif
    }
    
    /// Create a CGSize with a given string (100x100).
    ///
    /// - Parameter sizeString: String with the size.
    /// - Returns: Returns the created CGSize.
    private static func size(sizeString: String) -> CGSize {
        let array = sizeString.components(separatedBy: "x")
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
    func blend(image: UIImage, blendMode: CGBlendMode) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return self
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.fill(rect)
        
        draw(in: rect, blendMode: .normal, alpha: 1)
        image.draw(in: rect, blendMode: blendMode, alpha: 1)
        
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return result
    }
    
    /// Create an image from a given rect of 
    ///
    /// - Parameter rect:  Rect to take the image.
    /// - Returns: Returns the image from a given rect.
    func crop(in rect: CGRect) -> UIImage {
        guard let imageRef = cgImage?.cropping(to: CGRect(x: rect.origin.x * scale, y: rect.origin.y * scale, width: rect.size.width * scale, height: rect.size.height * scale)) else {
            return self
        }
        
        let subImage = UIImage(cgImage: imageRef, scale: scale, orientation: imageOrientation)
        
        return subImage
    }
    
    /// Scale the image to the minimum given size.
    ///
    /// - Parameter targetSize: The size to scale to.
    /// - Returns: Returns the scaled image.
    func scaleProportionally(toMinimumSize targetSize: CGSize) -> UIImage {
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
        
        var thumbnailPoint = CGPoint(x: 0.0, y: 0.0)
        
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
        var thumbnailRect = CGRect.zero
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
    
    /// Scale the image to the maxinum given size.
    ///
    /// - Parameter targetSize: The site to scale to.
    /// - Returns: Returns the scaled image.
    func scaleProportionally(toMaximumSize targetSize: CGSize) -> UIImage {
        let newTargetSize: CGSize = targetSize
        
        if size.width > newTargetSize.width || newTargetSize.width == newTargetSize.height, size.width > size.height {
            let factor: CGFloat = (newTargetSize.width * 100) / size.width
            let newWidth: CGFloat = (size.width * factor) / 100
            let newHeight: CGFloat = (size.height * factor) / 100
            
            let newSize = CGSize(width: newWidth, height: newHeight)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIImage.screenScale())
            draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        } else if size.height > newTargetSize.height || newTargetSize.width == newTargetSize.height, size.width < size.height {
            let factor: CGFloat = (newTargetSize.width * 100) / size.height
            let newWidth: CGFloat = (size.width * factor) / 100
            let newHeight: CGFloat = (size.height * factor) / 100
            
            let newSize = CGSize(width: newWidth, height: newHeight)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIImage.screenScale())
            draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        } else if size.height > newTargetSize.height || size.width > newTargetSize.width, size.width == size.height {
            let factor: CGFloat = (newTargetSize.height * 100) / size.height
            let newDimension: CGFloat = (size.height * factor) / 100
            
            let newSize = CGSize(width: newDimension, height: newDimension)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIImage.screenScale())
            draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        } else {
            let newSize = CGSize(width: size.width, height: size.height)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIImage.screenScale())
            draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
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
    func scaleProportionally(toSize targetSize: CGSize) -> UIImage {
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
        
        var thumbnailPoint = CGPoint(x: 0.0, y: 0.0)
        
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
        
        var thumbnailRect = CGRect.zero
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
    func scale(toSize targetSize: CGSize) -> UIImage {
        let sourceImage: UIImage = self
        
        let targetWidth: CGFloat = targetSize.width
        let targetHeight: CGFloat = targetSize.height
        
        let scaledWidth: CGFloat = targetWidth
        let scaledHeight: CGFloat = targetHeight
        
        let thumbnailPoint = CGPoint(x: 0.0, y: 0.0)
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, UIImage.screenScale())
        
        var thumbnailRect = CGRect.zero
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
    func flipHorizontally() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIImage.screenScale())
        guard let context: CGContext = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
            UIGraphicsEndImageContext()
            return self
        }
            
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        context.translateBy(x: size.width, y: 0)
        context.scaleBy(x: -1.0, y: 1.0)
        
        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
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
    func flipVertically() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIImage.screenScale())
        guard let context: CGContext = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
            UIGraphicsEndImageContext()
            return self
        }
        
        context.translateBy(x: 0, y: 0)
        context.scaleBy(x: 1.0, y: 1.0)
        
        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
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
    func hasAlpha() -> Bool {
        guard let cgImage = cgImage else {
            return false
        }
        
        let alpha: CGImageAlphaInfo = cgImage.alphaInfo
        return (alpha == .first || alpha == .last || alpha == .premultipliedFirst || alpha == .premultipliedLast)
    }
    
    /// Remove the alpha of the image.
    ///
    /// - Returns: Returns the image without alpha.
    func removeAlpha() -> UIImage {
        guard hasAlpha(), let cgImage = cgImage else {
            return self
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let mainViewContentContext = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: cgImage.bitmapInfo.rawValue) else {
            return self
        }
        
        mainViewContentContext.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        guard let mainViewContentBitmapContext = mainViewContentContext.makeImage() else {
            return self
        }
        
        let newImage = UIImage(cgImage: mainViewContentBitmapContext)
        
        return newImage
    }
    
    /// Fill the alpha with the given color.
    ///
    /// Default is white.
    ///
    /// - Parameter color: Color to fill.
    /// - Returns: Returns the filled image.
    func fillAlpha(color: UIColor = UIColor.white) -> UIImage {
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        
        let cgColor = color.cgColor
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIImage.screenScale())
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        context.setFillColor(cgColor)
        context.fill(imageRect)
        draw(in: imageRect)
        
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
    func isGrayscale() -> Bool {
        guard let model: CGColorSpaceModel = cgImage?.colorSpace?.model else {
            return false
        }
        
        return model == CGColorSpaceModel.monochrome
    }
    
    /// Transform the image to grayscale.
    ///
    /// - Returns: Returns the transformed image.
    func toGrayscale() -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        
        guard let cgImage = cgImage, let context = CGContext(data: nil, width: Int(rect.width), height: Int(rect.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: 0) else {
            return self
        }

        context.draw(cgImage, in: rect)
        
        guard let grayscale: CGImage = context.makeImage() else {
            return self
        }
        
        let newImage = UIImage(cgImage: grayscale)
        
        return newImage
    }
    
    /// Transform the image to black and white.
    ///
    /// - Returns: Returns the transformed image.
    func toBlackAndWhite() -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        
        guard let cgImage = cgImage, let context = CGContext(data: nil, width: Int(rect.width), height: Int(rect.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: 0) else {
            return self
        }
        
        context.interpolationQuality = .high
        context.setShouldAntialias(false)
        context.draw(cgImage, in: rect)
        
        guard let bwImage = context.makeImage() else {
            return self
        }
        
        let newImage = UIImage(cgImage: bwImage)
        
        return newImage
    }
    
    /// Invert the color of the image.
    ///
    /// - Returns: Returns the transformed image.
    func invertColors() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIImage.screenScale())
        UIGraphicsGetCurrentContext()?.setBlendMode(.copy)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        UIGraphicsGetCurrentContext()?.setBlendMode(.difference)
        UIGraphicsGetCurrentContext()?.setFillColor(UIColor.white.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return self
        }
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    #if canImport(CoreImage)
        /// Creates an image from an UIView.
        ///
        /// - Parameter view: UIView.
        convenience init?(view: UIView) {
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
        func rotate(radians: Double) -> UIImage {
            return rotate(degrees: radiansToDegrees(radians))
        }
        
        /// Rotate the image to the given degrees.
        ///
        /// - Parameter degrees: Degrees to rotate to.
        /// - Returns: Returns the rotated image.
        func rotate(degrees: Double) -> UIImage {
            let rotatedViewBox = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let transformation = CGAffineTransform(rotationAngle: CGFloat(degreesToRadians(degrees)))
            rotatedViewBox.transform = transformation
            let rotatedSize = CGSize(width: Int(rotatedViewBox.frame.size.width), height: Int(rotatedViewBox.frame.size.height))
            
            UIGraphicsBeginImageContextWithOptions(rotatedSize, false, UIImage.screenScale())
            guard let context: CGContext = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
                UIGraphicsEndImageContext()
                return self
            }
            
            context.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
            
            context.rotate(by: CGFloat(degreesToRadians(degrees)))
            
            context.scaleBy(x: 1.0, y: -1.0)
            context.draw(cgImage, in: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))
            
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
        func filter(name: String, parameters: [String: Any] = [:]) -> UIImage {
            let context = CIContext(options: nil)
            guard let filter = CIFilter(name: name), let ciImage = CIImage(image: self) else {
                return self
            }
            
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            
            for (key, value) in parameters {
                filter.setValue(value, forKey: key)
            }
            
            guard let outputImage = filter.outputImage, let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
                return self
            }
            
            let newImage = UIImage(cgImage: cgImage, scale: UIImage.screenScale(), orientation: imageOrientation)
            
            return newImage.scale(toSize: size)
        }
        
        /// Apply the bloom effect to the image.
        ///
        /// - Parameters:
        ///   - radius: Radius of the bloom.
        ///   - intensity: Intensity of the bloom.
        /// - Returns: Returns the transformed image.
        func bloom(radius: Float, intensity: Float) -> UIImage {
            return filter(name: "CIBloom", parameters: [kCIInputRadiusKey: radius, kCIInputIntensityKey: intensity])
        }
        
        /// Apply the bump distortion effect to the image.
        ///
        /// - Parameters:
        ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
        ///   - radius: Radius of the effect.
        ///   - scale: Scale of the effect.
        /// - Returns: Returns the transformed image.
        func bumpDistortion(center: CIVector, radius: Float, scale: Float) -> UIImage {
            return filter(name: "CIBumpDistortion", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius, kCIInputScaleKey: scale])
        }
        
        /// Apply the bump distortion linear effect to the image.
        ///
        /// - Parameters:
        ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
        ///   - radius: Radius of the effect.
        ///   - scale: Scale of the effect.
        ///   - angle: Angle of the effect in radians.
        /// - Returns: Returns the transformed image.
        func bumpDistortionLinear(center: CIVector, radius: Float, scale: Float, angle: Float) -> UIImage {
            return filter(name: "CIBumpDistortionLinear", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius, kCIInputScaleKey: scale, kCIInputAngleKey: angle])
        }
        
        /// Apply the circular splash distortion effect to the image
        ///
        /// - Parameters:
        ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
        ///   - radius: Radius of the effect.
        /// - Returns: Returns the transformed image.
        func circleSplashDistortion(center: CIVector, radius: Float) -> UIImage {
            return filter(name: "CICircleSplashDistortion", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius])
        }
        
        /// Apply the circular wrap effect to the image.
        ///
        /// - Parameters:
        ///   - center: Vector of the distortion. Use CIVector(x: X, y: Y).
        ///   - radius: Radius of the effect.
        ///   - angle: Angle of the effect in radians.
        /// - Returns: Returns the transformed image.
        func circularWrap(center: CIVector, radius: Float, angle: Float) -> UIImage {
            return filter(name: "CICircularWrap", parameters: [kCIInputCenterKey: center, kCIInputRadiusKey: radius, kCIInputAngleKey: angle])
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
        func cmykHalftone(center: CIVector, width: Float, angle: Float, sharpness: Float, gcr: Float, ucr: Float) -> UIImage { // swiftlint:disable:this function_parameter_count
            return filter(name: "CICMYKHalftone", parameters: [kCIInputCenterKey: center, kCIInputWidthKey: width, kCIInputSharpnessKey: sharpness, kCIInputAngleKey: angle, "inputGCR": gcr, "inputUCR": ucr])
        }
        
        /// Apply the sepia filter to the image.
        ///
        /// - Parameter intensity: Intensity of the filter.
        /// - Returns: Returns the transformed image.
        func sepiaTone(intensity: Float) -> UIImage {
            return filter(name: "CISepiaTone", parameters: [kCIInputIntensityKey: intensity])
        }
        
        /// Apply the blur effect to the image.
        ///
        /// - Parameters:
        ///   - blurRadius: Blur radius.
        ///   - saturation: Saturation delta factor, leave it default (1.8) if you don't what is.
        ///   - tintColor: Blur tint color, default is nil.
        ///   - maskImage: Apply a mask image, leave it default (nil) if you don't want to mask.
        /// - Returns: Return the transformed image.
        func blur(radius blurRadius: CGFloat, saturation: CGFloat = 1.8, tintColor: UIColor? = nil, maskImage: UIImage? = nil) -> UIImage {
            guard size.width > 1 && size.height > 1, let selfCGImage = cgImage else {
                return self
            }
            
            let imageRect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
            var effectImage = self
            
            let hasBlur = Float(blurRadius) > Float.ulpOfOne
            let saturationABS = abs(saturation - 1)
            let saturationABSFloat = Float(saturationABS)
            let hasSaturationChange = saturationABSFloat > Float.ulpOfOne
            
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
                    let sqrt2PI = CGFloat(sqrt(2 * Double.pi))
                    inputRadius = inputRadius * 3.0 * sqrt2PI / 4 + 0.5
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
                    let floatingPointSaturationMatrix = [
                        0.0722 + 0.9278 * saturation, 0.0722 - 0.0722 * saturation, 0.0722 - 0.0722 * saturation, 0,
                        0.7152 - 0.7152 * saturation, 0.7152 + 0.2848 * saturation, 0.7152 - 0.7152 * saturation, 0,
                        0.2126 - 0.2126 * saturation, 0.2126 - 0.2126 * saturation, 0.2126 + 0.7873 * saturation, 0,
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
                
                guard let imageContext = UIGraphicsGetImageFromCurrentImageContext() else {
                    return self
                }
                
                effectImage = imageContext
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
                
                if let maskImage = maskImage, let maskCGImage = maskImage.cgImage {
                    outputContext.clip(to: imageRect, mask: maskCGImage)
                } else if let effectCGImage = effectImage.cgImage {
                    outputContext.draw(effectCGImage, in: imageRect)
                }
                
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
