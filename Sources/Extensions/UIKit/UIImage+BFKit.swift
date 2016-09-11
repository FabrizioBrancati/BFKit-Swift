//
//  UIImage+BFKit.swift
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

/// Due to a bug in Xcode (typecasting Fails only inside the extension block) I created this alias of CIImage
typealias BFCIImage = CIImage

/// This extesion adds some useful functions to UIImage
public extension UIImage {
    // MARK: - Instance functions -
    
    /**
     Apply the given Blend Mode
    
     - parameter blendMode: The choosed Blend Mode
    
     - returns: Returns the image
     */
    public func blendMode(_ blendMode: CGBlendMode) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.size.width, height: self.size.height), false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height), blendMode: blendMode, alpha: 1)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /**
     Apply the Blend Mode Overlay
    
     - returns: Returns the image
     */
    public func blendOverlay() -> UIImage {
        return self.blendMode(.overlay)
    }
    
    /**
     Create an image from a given rect of self
    
     - parameter rect: Rect to take the image
    
     - returns: Returns the image from a given rect
     */
    public func imageAtRect(_ rect: CGRect) -> UIImage {
        let imageRef: CGImage = self.cgImage!.cropping(to: rect)!
        let subImage: UIImage = UIImage(cgImage: imageRef)
        
        return subImage
    }
    
    /**
     Scale the image to the minimum given size
    
     - parameter targetSize: The site to scale to
    
     - returns: Returns the scaled image
     */
    public func imageByScalingProportionallyToMinimumSize(_ targetSize: CGSize) -> UIImage? {
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
        
        var thumbnailPoint: CGPoint = CGPoint(x: 0.0,y: 0.0)
        
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
        
        if newImage == nil {
            BFLog("Could not scale image")
        }
        
        return newImage
    }
    
    /**
     Scale the image to the maxinum given size
    
     - parameter targetSize: The site to scale to
    
     - returns: Returns the scaled image
     */
    public func imageByScalingProportionallyToMaximumSize(_ targetSize: CGSize) -> UIImage {
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
        
        let returnImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return returnImage
    }
    
    /**
     Scale the image proportionally to the given size
    
     - parameter targetSize: The site to scale to
    
     - returns: Returns the scaled image
     */
    public func imageByScalingProportionallyToSize(_ targetSize: CGSize) -> UIImage? {
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
        
        if newImage == nil {
            BFLog("Could not scale image")
        }
        
        return newImage
    }
    
    /**
     Scele the iamge to the given size
    
     - parameter targetSize: The site to scale to
    
     - returns: Returns the scaled image
     */
    public func imageByScalingToSize(_ targetSize: CGSize) -> UIImage? {
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
        
        if newImage == nil {
            BFLog("Could not scale image")
        }
        
        return newImage
    }
    
    /**
     Rotate the image to the given radians
    
     - parameter radians: Radians to rotate to
    
     - returns: Returns the rotated image
     */
    public func imageRotatedByRadians(_ radians: CGFloat) -> UIImage {
        return self.imageRotatedByDegrees(CGFloat(RadiansToDegrees(Float(radians))))
    }
    
    /**
     Rotate the image to the given degrees
    
     - parameter degrees: Degrees to rotate to
    
     - returns: Returns the rotated image
     */
    public func imageRotatedByDegrees(_ degrees: CGFloat) -> UIImage {
        let rotatedViewBox: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let t: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(DegreesToRadians(Float(degrees))))
        rotatedViewBox.transform = t
        let rotatedSize: CGSize = rotatedViewBox.frame.size
        
        UIGraphicsBeginImageContextWithOptions(rotatedSize, false, UIScreen.main.scale)
        let bitmap: CGContext = UIGraphicsGetCurrentContext()!
        
        bitmap.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
        
        bitmap.rotate(by: CGFloat(DegreesToRadians(Float(degrees))))
        
        bitmap.scaleBy(x: 1.0, y: -1.0)
        bitmap.draw(self.cgImage!, in: CGRect(x: -self.size.width / 2, y: -self.size.height / 2, width: self.size.width, height: self.size.height))
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /**
     Flip the image horizontally
     
     - returns: Returns the flipped image
     */
    public func flipImageHorizontally() -> UIImage {
        return UIImage(cgImage: self.cgImage!, scale: self.scale, orientation: .upMirrored)
    }
    
    /**
     Flip the image vertically
     
     - returns: Returns the flipped image
     */
    public func flipImageVertically() -> UIImage {
        return UIImage(cgImage: self.cgImage!, scale: self.scale, orientation: .leftMirrored)
    }
    
    /**
     Check if the image has alpha
    
     - returns: Returns true if has alpha, false if not
     */
    public func hasAlpha() -> Bool {
        let alpha: CGImageAlphaInfo = self.cgImage!.alphaInfo
        return (alpha == .first || alpha == .last || alpha == .premultipliedFirst || alpha == .premultipliedLast)
    }
    
    /**
     Remove the alpha of the image
    
     - returns: Returns the image without alpha
     */
    public func removeAlpha() -> UIImage{
        if !self.hasAlpha() {
            return self
        }
        
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let mainViewContentContext: CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: self.cgImage!.bitmapInfo.rawValue)!
        
        mainViewContentContext.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let mainViewContentBitmapContext: CGImage = mainViewContentContext.makeImage()!
        let returnImage: UIImage = UIImage(cgImage: mainViewContentBitmapContext)
        
        return returnImage
    }
    
    /**
     Fill the alpha with the white color
    
     - returns: Returns the filled image
     */
    public func fillAlpha() -> UIImage {
        return self.fillAlphaWithColor(UIColor.white)
    }
    
    /**
     Fill the alpha with the given color
    
     - parameter color: Color to fill
    
     - returns: Returns the filled image
     */
    public func fillAlphaWithColor(_ color: UIColor) -> UIImage {
        let imageRect: CGRect = CGRect(origin: CGPoint.zero, size: self.size)
        
        let cgColor: CGColor = color.cgColor
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(cgColor)
        context.fill(imageRect)
        self.draw(in: imageRect)
        
        let returnImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return returnImage
    }
    
    /**
     Check if the image is in grayscale
    
     - returns: Returns true if is in grayscale, false if not
     */
    public func isGrayscale() -> Bool {
        let imgRef: CGImage = self.cgImage!
        let clrMod: CGColorSpaceModel = imgRef.colorSpace!.model
        
        if clrMod == CGColorSpaceModel.monochrome {
            return true
        } else {
            return false
        }
    }
    
    /**
     Transform the image to grayscale
    
     - returns: Returns the transformed image
     */
    public func imageToGrayscale() -> UIImage {
        let rect: CGRect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let context: CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: .allZeros)!

        context.draw(self.cgImage!, in: rect)
        let grayscale: CGImage = context.makeImage()!
        let returnImage: UIImage = UIImage(cgImage: grayscale)
        
        return returnImage
    }
    
    /**
     Transform the image to black and white
    
     - returns: Returns the transformed image
     */
    public func imageToBlackAndWhite() -> UIImage {
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let context: CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: .allZeros)!
        context.interpolationQuality = .high
        context.setShouldAntialias(false)
        context.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let bwImage: CGImage = context.makeImage()!
        
        let returnImage: UIImage = UIImage(cgImage: bwImage)
        
        return returnImage
    }
    
    /**
     Invert the color of the image
    
     - returns: Returns the transformed image
     */
    public func invertColors() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        UIGraphicsGetCurrentContext()?.setBlendMode(.copy)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        UIGraphicsGetCurrentContext()?.setBlendMode(.difference)
        UIGraphicsGetCurrentContext()?.setFillColor(UIColor.white.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let returnImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return returnImage
    }
    
    /**
     Apply the bloom effect to the image
    
     - parameter radius:    Radius of the bloom
     - parameter intensity: Intensity of the bloom
    
     - returns: Returns the transformed image
     */
    public func bloom(_ radius: Float, intensity: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CIBloom")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        filter.setValue(intensity, forKey: kCIInputIntensityKey)
        
        let returnImage: UIImage = UIImage(cgImage: context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)!)
        
        return returnImage
    }
    
    /**
     Apply the bump distortion effect to the image
    
     - parameter center: Vector of the distortion. Use CIVector(x: X, y: Y)
     - parameter radius: Radius of the effect
     - parameter scale:  Scale of the effect
    
     - returns: Returns the transformed image
     */
    public func bumpDistortion(_ center: CIVector, radius: Float, scale: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CIBumpDistortion")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(center, forKey: kCIInputCenterKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        filter.setValue(scale, forKey: kCIInputScaleKey)
        
        let returnImage: UIImage = UIImage(cgImage: context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)!)
        
        return returnImage
    }
    
    /**
     Apply the bump distortion linear effect to the image
    
     - parameter center: Vector of the distortion. Use CIVector(x: X, y: Y)
     - parameter radius: Radius of the effect
     - parameter angle:  Angle of the effect in radians
     - parameter scale:  Scale of the effect
    
     - returns: Returns the transformed image
     */
    public func bumpDistortionLinear(_ center: CIVector, radius: Float, angle: Float, scale: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CIBumpDistortionLinear")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(center, forKey: kCIInputCenterKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        filter.setValue(angle, forKey: kCIInputAngleKey)
        filter.setValue(scale, forKey: kCIInputScaleKey)
        
        let returnImage: UIImage = UIImage(cgImage: context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)!)
        
        return returnImage
    }
    
    /**
     Apply the circular splash distortion effect to the image
    
     - parameter center: Vector of the distortion. Use CIVector(x: X, y: Y)
     - parameter radius: Radius of the effect
    
     - returns: Returns the transformed image
     */
    public func circleSplashDistortion(_ center: CIVector, radius: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CICircleSplashDistortion")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(center, forKey: kCIInputCenterKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        
        let returnImage: UIImage = UIImage(cgImage: context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)!)
        
        return returnImage
    }
    
    /**
     Apply the circular wrap effect to the image
    
     - parameter center: Vector of the distortion. Use CIVector(x: X, y: Y)
     - parameter radius: Radius of the effect
     - parameter angle:  Angle of the effect in radians
    
     - returns: Returns the transformed image
     */
    public func circularWrap(_ center: CIVector, radius: Float, angle: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CICircularWrap")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(center, forKey: kCIInputCenterKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        filter.setValue(angle, forKey: kCIInputAngleKey)
        
        let returnImage: UIImage = UIImage(cgImage: context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)!)
        
        return returnImage
    }
    
    /**
     Apply the CMY halftone effect to the image
    
     - parameter center:    Vector of the distortion. Use CIVector(x: X, y: Y)
     - parameter width:     Width value
     - parameter angle:     Angle of the effect in radians
     - parameter sharpness: Sharpness Value
     - parameter gcr:       GCR value
     - parameter ucr:       UCR value
    
     - returns: Returns the transformed image
     */
    public func cmykHalftone(_ center: CIVector, width: Float, angle: Float, sharpness: Float, gcr: Float, ucr: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CICMYKHalftone")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(center, forKey: kCIInputCenterKey)
        filter.setValue(width, forKey: kCIInputWidthKey)
        filter.setValue(sharpness, forKey: kCIInputSharpnessKey)
        filter.setValue(angle, forKey: kCIInputAngleKey)
        filter.setValue(gcr, forKey: "inputGCR")
        filter.setValue(ucr, forKey: "inputUCR")
        
        let returnImage: UIImage = UIImage(cgImage: context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)!)
        
        return returnImage
    }
    
    /**
     Apply the sepia filter to the image
    
     - parameter intensity: Intensity of the filter
    
     - returns: Returns the transformed image
     */
    public func sepiaToneWithIntensity(_ intensity: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CISepiaTone")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(intensity, forKey: kCIInputIntensityKey)
        
        let returnImage: UIImage = UIImage(cgImage: context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)!)
        
        return returnImage
    }
    
    /**
     Apply the blur effect to the image
    
     - parameter blurRadius:            Blur radius
     - parameter tintColor:             Blur tint color
     - parameter saturationDeltaFactor: Saturation delta factor, leave it default (1.8) if you don't what is
     - parameter maskImage:             Apply a mask image, leave it default (nil) if you don't want to mask
    
     - returns: Return the transformed image
     */
    public func blur(radius blurRadius: CGFloat, tintColor: UIColor? = nil, saturationDeltaFactor: CGFloat = 1.8, maskImage: UIImage? = nil) -> UIImage? {
        if size.width < 1 || size.height < 1 {
            BFLog("Invalid size: \(size.width) x \(size.height). Both dimensions must be >= 1: \(self)")
            return nil
        }
        
        if cgImage == nil {
            BFLog("Image must be backed by a CGImage: \(self)")
            return nil
        }
        
        if let maskImage = maskImage, maskImage.cgImage == nil {
            BFLog("maskImage must be backed by a CGImage: \(maskImage)")
            return nil
        }
        
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        var effectImage = self
        
        let hasBlur = Float(blurRadius) > FLT_EPSILON
        let hasSaturationChange = Float(abs(saturationDeltaFactor - 1)) > FLT_EPSILON
        
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
                let s = saturationDeltaFactor
                let floatingPointSaturationMatrix = [
                    0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                    0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                    0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                    0,                    0,                    0,                    1
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
            if let image = maskImage {
                outputContext?.clip(to: imageRect, mask: image.cgImage!)
            }
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
    
    // MARK: - Class functions -
    
    /**
     Private, create a CGSize with a given string (100x100)
    
     - parameter sizeString: String with the size
    
     - returns: Returns the created CGSize
     */
    private static func sizeForSizeString(_ sizeString: String) -> CGSize {
        let array: Array = sizeString.components(separatedBy: "x")
        if array.count != 2 {
            return CGSize.zero
        }
        
        return CGSize(width: CGFloat(array[0].floatValue), height: CGFloat(array[1].floatValue))
    }
    
    // MARK: - Init functions -
    
    /**
     Create a dummy image
    
     - parameter dummy: To use it, name parameter must contain: "dummy.100x100" and "dummy.100x100.#FFFFFF" or "dummy.100x100.blue" (if it's a color defined in UIColor class) if you want to define a color
    
     - returns: Returns the created dummy image
     */
    public convenience init?(dummyImageWithSizeAndColor dummy: String) {
        var size: CGSize = CGSize.zero, color: UIColor = UIColor.lightGray
        
        let array: Array = dummy.components(separatedBy: ".")
        if array.count > 0 {
            let sizeString: String = array[0]
            
            if array.count >= 2 {
                color = UIColor.colorForColorString(array[1])
            }
            
            size = UIImage.sizeForSizeString(sizeString)
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
    
    /**
     Create an image from a given text
    
     - parameter text:      Text
     - parameter font:      Text's font name
     - parameter fontSize:  Text's font size
     - parameter imageSize: Image's size
    
     - returns: Returns the created UIImage
     */
    public convenience init?(fromText text: String, font: FontName, fontSize: CGFloat, imageSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        
        text.draw(at: CGPoint(x: 0.0, y: 0.0), withAttributes: [NSFontAttributeName : UIFont(fontName: font, size:fontSize)!])
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.init(cgImage: image.cgImage!)
    }
    
    /**
     Create an image with a background color and with a text with a mask
    
     - parameter maskedText:      Text to mask
     - parameter font:            Text's font name
     - parameter fontSize:        Text's font size
     - parameter imageSize:       Image's size
     - parameter backgroundColor: Image's background color
    
     - returns: Returns the created UIImage
     */
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
    
    /**
     Create an image from a given color
    
     - parameter color: Color value
    
     - returns: Returns the created UIImage
     */
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
}
