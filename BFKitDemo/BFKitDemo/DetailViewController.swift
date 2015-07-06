//
//  DetailViewController.swift
//  BFKitDemo
//
//  Created by Fabrizio on 24/06/15.
//  Copyright (c) 2015 Fabrizio Brancati. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet var scrollView: UIScrollView!
    
    var detailType: DetailType = .UIButton
    
    enum DetailType : String
    {
        case UIButton = "UIButton"
        case UIColor = "UIColor"
        case UIDevice = "UIDevice"
        case UIFont = "UIFont"
        case UIImage = "UIImage"
        case UIImageView = "UIImageView"
        case UILabel = "UILabel"
        case UIScrollView = "UIScrollView"
        case UITableView = "UITableView"
        case UITextField = "UITextField"
        case UITextView = "UITextView"
        case UIView = "UIView"
        case UIWebView = "UIWebView"
        case Array = "Array"
        case Dictionary = "Dictionary"
        case NSArray = "NSArray"
        case NSDate = "NSDate"
        case NSDictionary = "NSDictionary"
        case NSFileManager = "NSFileManager"
        case NSMutableArray = "NSMutableArray"
        case NSMutableDictionary = "NSMutableDictionary"
        case NSNumber = "NSNumber"
        case NSObject = "NSObject"
        case NSProcessInfo = "NSProcessInfo"
        case NSString = "NSString"
        case NSThread = "NSThread"
        case String = "String"
        case BFApp = "BFApp"
        case BFButton = "BFButton"
        case BFLog = "BFLog"
        case BFPassword = "BFPassword"
        case BFSystemSound = "BFSystemSound"
        case BFTouchID = "BFTouchID"
    }
    
    override func viewDidLoad()
    {
        switch detailType
        {
        case .BFApp:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            BFLog("App name: \(APP_NAME)")
            BFLog("App build: \(APP_BUILD)")
            BFLog("App version: \(APP_VERSION)")
            let openString = BFLocalizedString("OPEN")
            BFLog("Localized string from BFKit: \(openString)")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .BFButton:
            scrollView.removeFromSuperview()
            
            let button: BFButton = BFButton(frame: CGRectMake(20, 84, SCREEN_WIDTH - 40, 50), image: UIImage(maskedText: "BFKit", font: .HelveticaNeueBold, fontSize: 20, imageSize: CGSizeMake(SCREEN_WIDTH, 50), backgroundColor: UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ))!, highlightedImage: UIImage(maskedText: "BFKit", font: .HelveticaNeueBold, fontSize: 20, imageSize: CGSizeMake(SCREEN_WIDTH, 50), backgroundColor: UIColor ( red: 0.301, green: 0.55, blue: 0.686, alpha: 1.0 ))!, fadeDuration: 1)
            self.view.addSubview(button)
        case .BFLog:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            BFLog("This will be shown only if in DEBUG mode")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .BFPassword:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let pass1 = "Password"
            let passLevel1 = BFPassword.checkPasswordStrength(pass1)
            BFLog("Password: \(pass1) - Level: \(passLevel1.rawValue) of \(BFPassword.PasswordStrengthLevel.VerySecure.rawValue)")
            let pass2 = "kqi019ASC.v1|!-2"
            let passLevel2 = BFPassword.checkPasswordStrength(pass2)
            BFLog("Password: \(pass2) - Level: \(passLevel2.rawValue) of \(BFPassword.PasswordStrengthLevel.VerySecure.rawValue)")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .BFSystemSound:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            BFSystemSound.playSystemSoundVibrate()
            BFLog("Vibrate")
            BFSystemSound.playSystemSound(.ReceivedMessage)
            BFLog("Play sound")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .BFTouchID:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            let normalLabel: UILabel = UILabel(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 50), text: "Waiting for Touch ID...", font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Center, lines: 2)
            scrollView.addSubview(normalLabel)
            
            BFLog("\(scrollView)")
            
            if SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("8.0")
            {
                BFTouchID.showTouchIDAuthenticationWithReason(BFLocalizedString("AUTHENTICATION"), completion: { (result) -> () in
                    switch result
                    {
                    case .Success:
                        runOnMainThread({
                            normalLabel.text = "AUTHORIZED"
                        })
                    case .AuthenticationFailed:
                        runOnMainThread({
                            normalLabel.text = "NOT_OWNER"
                        })
                    default:
                        runOnMainThread({
                            let error = BFLocalizedString("ERROR")
                            normalLabel.text = "\(error): \(result.rawValue)"
                        })
                    }
                })
            }
            else
            {
                normalLabel.text = "BFTouchID is available on iOS 8 or later"
            }
        case .UIButton:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            let clearButton: UIButton = UIButton(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 44), title: "Button with clear color")
            clearButton.setTitleColor(UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), highlightedColor: UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0))
            scrollView.addSubview(clearButton)
            
            let borderedButton: UIButton = UIButton(frame: CGRectMake(20, 80, SCREEN_WIDTH - 40, 44), title: "Button with border")
            borderedButton.setTitleColor(UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), highlightedColor: UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0))
            borderedButton.createBordersWithColor(UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), radius: 10, width: 3)
            scrollView.addSubview(borderedButton)
            
            let coloredButton: UIButton = UIButton(frame: CGRectMake(20, 140, SCREEN_WIDTH - 40, 44), title: "Button with color", color: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), highlightedColor: UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0))
            coloredButton.setTitleColor(UIColor.whiteColor(), highlightedColor: UIColor.whiteColor())
            scrollView.addSubview(coloredButton)
            
            let coloredCornerRadiusButton: UIButton = UIButton(frame: CGRectMake(20, 200, SCREEN_WIDTH - 40, 44), title: "Button with corner radius", color: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), highlightedColor: UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0))
            coloredCornerRadiusButton.setTitleColor(UIColor.whiteColor())
            coloredCornerRadiusButton.setCornerRadius(10)
            scrollView.addSubview(coloredCornerRadiusButton)
            
            let otherFontButton: UIButton = UIButton(frame: CGRectMake(20, 260, SCREEN_WIDTH - 40, 44), title: "Button with other font")
            otherFontButton.setTitleFont(.Chalkduster, size: 17)
            otherFontButton.setTitleColor(UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0))
            scrollView.addSubview(otherFontButton)
        case .UIColor:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            let hexStringColor: UIView = UIView(frame: CGRectMake(20, 80, SCREEN_WIDTH - 40, 44))
            hexStringColor.backgroundColor = UIColor(hex: "#36a9e0")
            let hexStringColorLabel: UILabel = UILabel(frame: CGRectMake(0, 0, SCREEN_WIDTH - 40, 44), text: "HEX String Color", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            hexStringColor.addSubview(hexStringColorLabel)
            self.view.addSubview(hexStringColor)
            
            let hexColor: UIView = UIView(frame: CGRectMake(20, 140, SCREEN_WIDTH - 40, 44))
            hexColor.backgroundColor = UIColor(hex: 0xEB9023)
            let hexColorLabel: UILabel = UILabel(frame: CGRectMake(0, 0, SCREEN_WIDTH - 40, 44), text: "HEX Color", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            hexColor.addSubview(hexColorLabel)
            self.view.addSubview(hexColor)
            
            let randomColor: UIView = UIView(frame: CGRectMake(20, 200, SCREEN_WIDTH - 40, 44))
            randomColor.backgroundColor = UIColor.randomColor()
            let randomColorLabel: UILabel = UILabel(frame: CGRectMake(0, 0, SCREEN_WIDTH - 40, 44), text: "Random Color", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            randomColor.addSubview(randomColorLabel)
            self.view.addSubview(randomColor)
        case .UIDevice:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            var deviceInfoString: String = ""
            
            if UIDevice.isiPhone()
            {
                deviceInfoString += "Device: iPhone\n"
            }
            else if UIDevice.isiPad()
            {
                deviceInfoString += "Device: iPad\n"
            }
            else if UIDevice.isiPod()
            {
                deviceInfoString += "Device: iPod\n"
            }
            else if UIDevice.isSimulator()
            {
                deviceInfoString += "Device: Simulator\n"
            }
            
            if UIDevice.isRetina()
            {
                deviceInfoString += "Retina: Yes\n"
            }
            else
            {
                deviceInfoString += "Retina: No\n"
            }
            
            if UIDevice.isRetinaHD()
            {
                deviceInfoString += "Retina HD: Yes\n"
            }
            else
            {
                deviceInfoString += "Retina HD: No\n"
            }
            
            deviceInfoString += "iOS Version: \(UIDevice.iOSVersion())\n"
            
            deviceInfoString += "RAM Size: \(UIDevice.ramSize() / 1024 / 1024) MB\n"
            
            deviceInfoString += "Unique Identifier: \(UIDevice.uniqueIdentifier())\n"
            
            let deviceInfoLabel: UILabel = UILabel(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 200), text: deviceInfoString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, lines: 8)
            scrollView.addSubview(deviceInfoLabel)
        case .UIFont:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            UIFont.allFamilyAndFonts()
            
            let fontLabel: UILabel = UILabel(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 25), text: "Use a font with just an ENUM ^_^", font: .NoteworthyLight, size: 16, color: UIColor.blackColor(), alignment: .Left, lines: 1)
            scrollView.addSubview(fontLabel)
            
            let otherFontLabel: UILabel = UILabel(frame: CGRectMake(20, 60, SCREEN_WIDTH - 40, 25), text: "It's awesome!", font: .SuperclarendonBold, size: 16, color: UIColor.blackColor(), alignment: .Left, lines: 1)
            scrollView.addSubview(otherFontLabel)
        case .UIImage:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, ((SCREEN_WIDTH - 40) * 10) + (20 * 11))
            
            let blendOverlayImage: UIImage = UIImage(named: "Logo")!.blendOverlay()
            let blendOverlayImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: blendOverlayImage)
            let blendOverlayLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Blend Overlay", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            blendOverlayImageView.addSubview(blendOverlayLabel)
            scrollView.addSubview(blendOverlayImageView)
            
            let imageAtRectImage: UIImage = UIImage(named: "Logo")!.imageAtRect(CGRectMake(0, 0, 250, 250))
            let imageAtRectImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: imageAtRectImage)
            let imageAtRectLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Image At Rect", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            imageAtRectImageView.addSubview(imageAtRectLabel)
            scrollView.addSubview(imageAtRectImageView)
            
            let rotatedImage: UIImage = UIImage(named: "Logo")!.imageRotatedByDegrees(90)
            let rotatedImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: rotatedImage)
            let rotatedLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Rotated Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            rotatedImageView.addSubview(rotatedLabel)
            scrollView.addSubview(rotatedImageView)
            
            let filledImage: UIImage = UIImage(named: "Logo2")!.fillAlphaWithColor(UIColor ( red: 0.9255, green: 0.6929, blue: 0.1188, alpha: 1.0 ))
            let filledImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: filledImage)
            let filledLabel: UILabel = UILabel(frame: CGRectMake(0, 40, SCREEN_WIDTH - 40, 25), text: "Filled Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            filledImageView.addSubview(filledLabel)
            scrollView.addSubview(filledImageView)
            
            let invertedImage: UIImage = UIImage(named: "Logo")!.invertColors()
            let invertedImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20  + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: invertedImage)
            let invertedLabel: UILabel = UILabel(frame: CGRectMake(0, 40, SCREEN_WIDTH - 40, 25), text: "Inverted Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            invertedImageView.addSubview(invertedLabel)
            scrollView.addSubview(invertedImageView)
            
            let blurredImage: UIImage = UIImage(named: "Logo")!.blur(radius: 10)!
            let blurredImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: blurredImage)
            let blurredLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Blurred Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            blurredImageView.addSubview(blurredLabel)
            scrollView.addSubview(blurredImageView)
            
            let bumpedImage: UIImage = UIImage(named: "Logo")!.bumpDistortionLinear(CIVector(x: SCREEN_WIDTH - 40, y:SCREEN_WIDTH - 40), radius: 100, angle: Float(M_PI), scale: 2)
            let bumpedImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20 + blurredImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: bumpedImage)
            let bumpedLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Bump Distortion Linear Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            bumpedImageView.addSubview(bumpedLabel)
            scrollView.addSubview(bumpedImageView)
            
            let sepiaImage: UIImage = UIImage(named: "Logo")!.sepiaToneWithIntensity(1)
            let sepiaImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20 + blurredImageView.frame.size.height + 20 + bumpedImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: sepiaImage)
            let sepiaLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Sepia Tone Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            sepiaImageView.addSubview(sepiaLabel)
            scrollView.addSubview(sepiaImageView)
            
            let colorImage: UIImage = UIImage(color: UIColor(red: 0.8784, green: 0.7106, blue: 0.0, alpha: 1.0 ))!
            let colorImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20 + blurredImageView.frame.size.height + 20 + bumpedImageView.frame.size.height + 20 + sepiaImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: colorImage)
            let colorLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Color Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            colorImageView.addSubview(colorLabel)
            scrollView.addSubview(colorImageView)
            
            let dummyImage: UIImage = UIImage(dummyImageWithSizeAndColor: "100x100.#ECB11E")!
            let dummyImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20 + blurredImageView.frame.size.height + 20 + bumpedImageView.frame.size.height + 20 + sepiaImageView.frame.size.height + 20 + colorImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: dummyImage)
            let dummyLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Dummy Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            dummyImageView.addSubview(dummyLabel)
            scrollView.addSubview(dummyImageView)
        default:
            break
        }
    }
    
    func prepareForDetail(detailTypeString: String)
    {
        detailType = DetailType(rawValue: detailTypeString)!
        
        self.title = detailTypeString
    }
}
