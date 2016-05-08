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
    public func blendMode(blendMode: CGBlendMode) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), false, UIScreen.mainScreen().scale)
        self.drawInRect(CGRectMake(0.0, 0.0, self.size.width, self.size.height), blendMode: blendMode, alpha: 1)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /**
     Apply the Blend Mode Overlay
    
     - returns: Returns the image
     */
    public func blendOverlay() -> UIImage {
        return self.blendMode(.Overlay)
    }
    
    /**
     Create an image from a given rect of self
    
     - parameter rect: Rect to take the image
    
     - returns: Returns the image from a given rect
     */
    public func imageAtRect(rect: CGRect) -> UIImage {
        let imageRef: CGImageRef = CGImageCreateWithImageInRect(self.CGImage, rect)!
        let subImage: UIImage = UIImage(CGImage: imageRef)
        
        return subImage
    }
    
    /**
     Scale the image to the minimum given size
    
     - parameter targetSize: The site to scale to
    
     - returns: Returns the scaled image
     */
    public func imageByScalingProportionallyToMinimumSize(targetSize: CGSize) -> UIImage? {
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
        
        var thumbnailPoint: CGPoint = CGPointMake(0.0,0.0)
        
        if CGSizeEqualToSize(imageSize, newTargetSize) == false {
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
        
        UIGraphicsBeginImageContextWithOptions(newTargetSize, false, UIScreen.mainScreen().scale)
        var thumbnailRect: CGRect = CGRectZero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width  = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.drawInRect(thumbnailRect)
        
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
    public func imageByScalingProportionallyToMaximumSize(targetSize: CGSize) -> UIImage {
        let newTargetSize: CGSize = targetSize
        
        if (self.size.width > newTargetSize.width || newTargetSize.width == newTargetSize.height) && self.size.width > self.size.height {
            let factor: CGFloat = (newTargetSize.width * 100)/self.size.width
            let newWidth: CGFloat = (self.size.width * factor)/100
            let newHeight: CGFloat = (self.size.height * factor)/100
            
            let newSize: CGSize = CGSizeMake(newWidth, newHeight)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.mainScreen().scale)
            self.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        } else if (self.size.height > newTargetSize.height || newTargetSize.width == newTargetSize.height) && self.size.width < self.size.height {
            let factor: CGFloat = (newTargetSize.width * 100)/self.size.height
            let newWidth: CGFloat = (self.size.width * factor)/100
            let newHeight: CGFloat = (self.size.height * factor)/100
            
            let newSize: CGSize = CGSizeMake(newWidth, newHeight)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.mainScreen().scale)
            self.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        } else if (self.size.height > newTargetSize.height || self.size.width > newTargetSize.width ) && self.size.width == self.size.height {
            let factor: CGFloat = (newTargetSize.height * 100) / self.size.height
            let newDimension: CGFloat = (self.size.height * factor) / 100
            
            let newSize: CGSize = CGSizeMake(newDimension, newDimension)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.mainScreen().scale)
            self.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        } else {
            let newSize: CGSize = CGSizeMake(self.size.width, self.size.height)
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.mainScreen().scale)
            self.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        }
        
        let returnImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return returnImage
    }
    
    /**
     Scale the image proportionally to the given size
    
     - parameter targetSize: The site to scale to
    
     - returns: Returns the scaled image
     */
    public func imageByScalingProportionallyToSize(targetSize: CGSize) -> UIImage? {
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
        
        var thumbnailPoint: CGPoint = CGPointMake(0.0, 0.0)
        
        if CGSizeEqualToSize(imageSize, newTargetSize) == false {
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
        
        UIGraphicsBeginImageContextWithOptions(newTargetSize, false, UIScreen.mainScreen().scale)
        
        var thumbnailRect: CGRect = CGRectZero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.drawInRect(thumbnailRect)
        
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
    public func imageByScalingToSize(targetSize: CGSize) -> UIImage? {
        let sourceImage: UIImage = self
        var newImage: UIImage? = nil
        
        let targetWidth: CGFloat = targetSize.width
        let targetHeight: CGFloat = targetSize.height
        
        let scaledWidth: CGFloat = targetWidth
        let scaledHeight: CGFloat = targetHeight
        
        let thumbnailPoint: CGPoint = CGPointMake(0.0, 0.0)
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, UIScreen.mainScreen().scale)
        
        var thumbnailRect: CGRect = CGRectZero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.drawInRect(thumbnailRect)
        
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
    public func imageRotatedByRadians(radians: CGFloat) -> UIImage {
        return self.imageRotatedByDegrees(CGFloat(RadiansToDegrees(Float(radians))))
    }
    
    /**
     Rotate the image to the given degrees
    
     - parameter degrees: Degrees to rotate to
    
     - returns: Returns the rotated image
     */
    public func imageRotatedByDegrees(degrees: CGFloat) -> UIImage {
        let rotatedViewBox: UIView = UIView(frame: CGRectMake(0, 0, self.size.width, self.size.height))
        let t: CGAffineTransform = CGAffineTransformMakeRotation(CGFloat(DegreesToRadians(Float(degrees))))
        rotatedViewBox.transform = t
        let rotatedSize: CGSize = rotatedViewBox.frame.size
        
        UIGraphicsBeginImageContextWithOptions(rotatedSize, false, UIScreen.mainScreen().scale)
        let bitmap: CGContextRef = UIGraphicsGetCurrentContext()!
        
        CGContextTranslateCTM(bitmap, rotatedSize.width / 2, rotatedSize.height / 2)
        
        CGContextRotateCTM(bitmap, CGFloat(DegreesToRadians(Float(degrees))))
        
        CGContextScaleCTM(bitmap, 1.0, -1.0)
        CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), self.CGImage)
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /**
     Flip the image horizontally
     
     - returns: Returns the flipped image
     */
    public func flipImageHorizontally() -> UIImage {
        return UIImage(CGImage: self.CGImage!, scale: self.scale, orientation: .UpMirrored)
    }
    
    /**
     Flip the image vertically
     
     - returns: Returns the flipped image
     */
    public func flipImageVertically() -> UIImage {
        return UIImage(CGImage: self.CGImage!, scale: self.scale, orientation: .LeftMirrored)
    }
    
    /**
     Check if the image has alpha
    
     - returns: Returns true if has alpha, false if not
     */
    public func hasAlpha() -> Bool {
        let alpha: CGImageAlphaInfo = CGImageGetAlphaInfo(self.CGImage)
        return (alpha == .First || alpha == .Last || alpha == .PremultipliedFirst || alpha == .PremultipliedLast)
    }
    
    /**
     Remove the alpha of the image
    
     - returns: Returns the image without alpha
     */
    public func removeAlpha() -> UIImage{
        if !self.hasAlpha() {
            return self
        }
        
        let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
        let mainViewContentContext: CGContextRef = CGBitmapContextCreate(nil, Int(self.size.width), Int(self.size.height), 8, 0, colorSpace, CGImageGetBitmapInfo(self.CGImage).rawValue)!
        
        CGContextDrawImage(mainViewContentContext, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage)
        let mainViewContentBitmapContext: CGImageRef = CGBitmapContextCreateImage(mainViewContentContext)!
        let returnImage: UIImage = UIImage(CGImage: mainViewContentBitmapContext)
        
        return returnImage
    }
    
    /**
     Fill the alpha with the white color
    
     - returns: Returns the filled image
     */
    public func fillAlpha() -> UIImage {
        return self.fillAlphaWithColor(UIColor.whiteColor())
    }
    
    /**
     Fill the alpha with the given color
    
     - parameter color: Color to fill
    
     - returns: Returns the filled image
     */
    public func fillAlphaWithColor(color: UIColor) -> UIImage {
        let imageRect: CGRect = CGRect(origin: CGPointZero, size: self.size)
        
        let cgColor: CGColorRef = color.CGColor
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.mainScreen().scale)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, cgColor)
        CGContextFillRect(context,imageRect)
        self.drawInRect(imageRect)
        
        let returnImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return returnImage
    }
    
    /**
     Check if the image is in grayscale
    
     - returns: Returns true if is in grayscale, false if not
     */
    public func isGrayscale() -> Bool {
        let imgRef: CGImageRef = self.CGImage!
        let clrMod: CGColorSpaceModel = CGColorSpaceGetModel(CGImageGetColorSpace(imgRef))
        
        if clrMod == CGColorSpaceModel.Monochrome {
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
        let rect: CGRect = CGRectMake(0.0, 0.0, size.width, size.height)
        
        let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceGray()!
        let context: CGContextRef = CGBitmapContextCreate(nil, Int(self.size.width), Int(self.size.height), 8, 0, colorSpace, CGImageGetBitmapInfo(self.CGImage).rawValue)!

        CGContextDrawImage(context, rect, self.CGImage)
        let grayscale: CGImageRef = CGBitmapContextCreateImage(context)!
        let returnImage: UIImage = UIImage(CGImage: grayscale)
        
        return returnImage
    }
    
    /**
     Transform the image to black and white
    
     - returns: Returns the transformed image
     */
    public func imageToBlackAndWhite() -> UIImage {
        let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceGray()!
        let context: CGContextRef = CGBitmapContextCreate(nil, Int(self.size.width), Int(self.size.height), 8, 0, colorSpace, CGImageGetBitmapInfo(self.CGImage).rawValue)!
        CGContextSetInterpolationQuality(context, .High)
        CGContextSetShouldAntialias(context, false)
        CGContextDrawImage(context, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage)
        
        let bwImage: CGImageRef = CGBitmapContextCreateImage(context)!
        
        let returnImage: UIImage = UIImage(CGImage: bwImage)
        
        return returnImage
    }
    
    /**
     Invert the color of the image
    
     - returns: Returns the transformed image
     */
    public func invertColors() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen .mainScreen().scale)
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(), .Copy)
        self.drawInRect(CGRectMake(0, 0, self.size.width, self.size.height))
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(), .Difference)
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), UIColor.whiteColor().CGColor)
        CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, self.size.width, self.size.height))
        
        let returnImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return returnImage
    }
    
    /**
     Apply the bloom effect to the image
    
     - parameter radius:    Radius of the bloom
     - parameter intensity: Intensity of the bloom
    
     - returns: Returns the transformed image
     */
    public func bloom(radius: Float, intensity: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CIBloom")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        filter.setValue(intensity, forKey: kCIInputIntensityKey)
        
        let returnImage: UIImage = UIImage(CGImage: context.createCGImage(filter.outputImage!, fromRect: filter.outputImage!.extent))
        
        return returnImage
    }
    
    /**
     Apply the bump distortion effect to the image
    
     - parameter center: Vector of the distortion. Use CIVector(x: X, y: Y)
     - parameter radius: Radius of the effect
     - parameter scale:  Scale of the effect
    
     - returns: Returns the transformed image
     */
    public func bumpDistortion(center: CIVector, radius: Float, scale: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CIBumpDistortion")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(center, forKey: kCIInputCenterKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        filter.setValue(scale, forKey: kCIInputScaleKey)
        
        let returnImage: UIImage = UIImage(CGImage: context.createCGImage(filter.outputImage!, fromRect: filter.outputImage!.extent))
        
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
    public func bumpDistortionLinear(center: CIVector, radius: Float, angle: Float, scale: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CIBumpDistortionLinear")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(center, forKey: kCIInputCenterKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        filter.setValue(angle, forKey: kCIInputAngleKey)
        filter.setValue(scale, forKey: kCIInputScaleKey)
        
        let returnImage: UIImage = UIImage(CGImage: context.createCGImage(filter.outputImage!, fromRect: filter.outputImage!.extent))
        
        return returnImage
    }
    
    /**
     Apply the circular splash distortion effect to the image
    
     - parameter center: Vector of the distortion. Use CIVector(x: X, y: Y)
     - parameter radius: Radius of the effect
    
     - returns: Returns the transformed image
     */
    public func circleSplashDistortion(center: CIVector, radius: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CICircleSplashDistortion")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(center, forKey: kCIInputCenterKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        
        let returnImage: UIImage = UIImage(CGImage: context.createCGImage(filter.outputImage!, fromRect: filter.outputImage!.extent))
        
        return returnImage
    }
    
    /**
     Apply the circular wrap effect to the image
    
     - parameter center: Vector of the distortion. Use CIVector(x: X, y: Y)
     - parameter radius: Radius of the effect
     - parameter angle:  Angle of the effect in radians
    
     - returns: Returns the transformed image
     */
    public func circularWrap(center: CIVector, radius: Float, angle: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CICircularWrap")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(center, forKey: kCIInputCenterKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        filter.setValue(angle, forKey: kCIInputAngleKey)
        
        let returnImage: UIImage = UIImage(CGImage: context.createCGImage(filter.outputImage!, fromRect: filter.outputImage!.extent))
        
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
    public func cmykHalftone(center: CIVector, width: Float, angle: Float, sharpness: Float, gcr: Float, ucr: Float) -> UIImage {
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
        
        let returnImage: UIImage = UIImage(CGImage: context.createCGImage(filter.outputImage!, fromRect: filter.outputImage!.extent))
        
        return returnImage
    }
    
    /**
     Apply the sepia filter to the image
    
     - parameter intensity: Intensity of the filter
    
     - returns: Returns the transformed image
     */
    public func sepiaToneWithIntensity(intensity: Float) -> UIImage {
        let context: CIContext = CIContext(options: nil)
        let filter: CIFilter = CIFilter(name: "CISepiaTone")!
        
        let ciimage: BFCIImage = BFCIImage(image: self)!
        
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(intensity, forKey: kCIInputIntensityKey)
        
        let returnImage: UIImage = UIImage(CGImage: context.createCGImage(filter.outputImage!, fromRect: filter.outputImage!.extent))
        
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
        
        if CGImage == nil {
            BFLog("Image must be backed by a CGImage: \(self)")
            return nil
        }
        
        if let maskImage = maskImage where maskImage.CGImage == nil {
            BFLog("maskImage must be backed by a CGImage: \(maskImage)")
            return nil
        }
        
        let imageRect = CGRect(origin: CGPointZero, size: size)
        var effectImage = self
        
        let hasBlur = Float(blurRadius) > FLT_EPSILON
        let hasSaturationChange = Float(abs(saturationDeltaFactor - 1)) > FLT_EPSILON
        
        if hasBlur || hasSaturationChange {
            UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
            let effectInContext = UIGraphicsGetCurrentContext()
            CGContextScaleCTM(effectInContext, 1, -1)
            CGContextTranslateCTM(effectInContext, 0, -size.height)
            CGContextDrawImage(effectInContext, imageRect, CGImage)
            var effectInBuffer = vImage_Buffer(data: CGBitmapContextGetData(effectInContext), height: UInt(CGBitmapContextGetHeight(effectInContext)), width: UInt(CGBitmapContextGetWidth(effectInContext)), rowBytes: CGBitmapContextGetBytesPerRow(effectInContext))
            
            UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
            let effectOutContext = UIGraphicsGetCurrentContext()
            var effectOutBuffer = vImage_Buffer(data: CGBitmapContextGetData(effectOutContext), height: UInt(CGBitmapContextGetHeight(effectOutContext)), width: UInt(CGBitmapContextGetWidth(effectOutContext)), rowBytes: CGBitmapContextGetBytesPerRow(effectOutContext))
            
            if hasBlur {
                let inputRadius = blurRadius * UIScreen.mainScreen().scale
                var radius = UInt32(floor(inputRadius * 3.0 * CGFloat(sqrt(2 * M_PI)) / 4 + 0.5))
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
                effectImage = UIGraphicsGetImageFromCurrentImageContext()
            }
            UIGraphicsEndImageContext()
            
            if effectImageBuffersAreSwapped {
                effectImage = UIGraphicsGetImageFromCurrentImageContext()
            }
            UIGraphicsEndImageContext()
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        let outputContext = UIGraphicsGetCurrentContext()
        CGContextScaleCTM(outputContext, 1, -1)
        CGContextTranslateCTM(outputContext, 0, -size.height)
        
        CGContextDrawImage(outputContext, imageRect, CGImage)

        if hasBlur {
            CGContextSaveGState(outputContext)
            if let image = maskImage {
                CGContextClipToMask(outputContext, imageRect, image.CGImage)
            }
            CGContextDrawImage(outputContext, imageRect, effectImage.CGImage)
            CGContextRestoreGState(outputContext)
        }
        
        if let tintColor = tintColor {
            CGContextSaveGState(outputContext)
            CGContextSetFillColorWithColor(outputContext, tintColor.CGColor)
            CGContextFillRect(outputContext, imageRect)
            CGContextRestoreGState(outputContext)
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
    private static func sizeForSizeString(sizeString: String) -> CGSize {
        let array: Array = sizeString.componentsSeparatedByString("x")
        if array.count != 2 {
            return CGSizeZero
        }
        
        return CGSizeMake(CGFloat(array[0].floatValue), CGFloat(array[1].floatValue))
    }
    
    // MARK: - Init functions -
    
    /**
     Create a dummy image
    
     - parameter dummy: To use it, name parameter must contain: "dummy.100x100" and "dummy.100x100.#FFFFFF" or "dummy.100x100.blue" (if it's a color defined in UIColor class) if you want to define a color
    
     - returns: Returns the created dummy image
     */
    public convenience init?(dummyImageWithSizeAndColor dummy: String) {
        var size: CGSize = CGSizeZero, color: UIColor = UIColor.lightGrayColor()
        
        let array: Array = dummy.componentsSeparatedByString(".")
        if array.count > 0 {
            let sizeString: String = array[0]
            
            if array.count >= 2 {
                color = UIColor.colorForColorString(array[1])
            }
            
            size = UIImage.sizeForSizeString(sizeString)
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        
        let rect: CGRect = CGRectMake(0.0, 0.0, size.width, size.height)
        
        color.setFill()
        CGContextFillRect(context, rect)
        
        let sizeString: String = "\(Int(size.width)) x \(Int(size.height))"
        let style: NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        style.alignment = .Center
        style.minimumLineHeight = size.height / 2
        let attributes: Dictionary = [NSParagraphStyleAttributeName : style]
        sizeString.drawInRect(rect, withAttributes:attributes)
        
        let result: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.init(CGImage: result.CGImage!)
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
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.mainScreen().scale)
        
        text.drawAtPoint(CGPointMake(0.0, 0.0), withAttributes: [NSFontAttributeName : UIFont(fontName: font, size:fontSize)!])
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.init(CGImage: image.CGImage!)
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
        
        let textSize: CGSize = maskedText.sizeWithAttributes(textAttributes)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.mainScreen().scale)
        let ctx: CGContextRef = UIGraphicsGetCurrentContext()!
        
        CGContextSetFillColorWithColor(ctx, backgroundColor.CGColor)
        
        let path: UIBezierPath = UIBezierPath(rect: CGRectMake(0, 0, imageSize.width, imageSize.height))
        CGContextAddPath(ctx, path.CGPath)
        CGContextFillPath(ctx)
        
        CGContextSetBlendMode(ctx, .DestinationOut)
        let center: CGPoint = CGPointMake(imageSize.width / 2 - textSize.width / 2, imageSize.height / 2 - textSize.height / 2)
        maskedText.drawAtPoint(center, withAttributes: textAttributes)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.init(CGImage: image.CGImage!)
    }
    
    /**
     Create an image from a given color
    
     - parameter color: Color value
    
     - returns: Returns the created UIImage
     */
    public convenience init?(color: UIColor) {
        let rect: CGRect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, color.CGColor)
        
        CGContextFillRect(context, rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.init(CGImage: image.CGImage!)
    }
}
