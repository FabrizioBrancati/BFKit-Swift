//
//  DetailViewController.swift
//  BFKitDemo
//
//  Created by Fabrizio on 24/06/15.
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    
    var detailType: DetailType = .UIButton
    
    enum DetailType : String {
        case BFApp = "BFApp"
        case BFButton = "BFButton"
        case BFDataStructures = "BFDataStructures"
        case BFLog = "BFLog"
        case BFPassword = "BFPassword"
        case BFSystemSound = "BFSystemSound"
        case BFTextField = "BFTextField"
        case BFTouchID = "BFTouchID"
        case UIButton = "UIButton"
        case UIColor = "UIColor"
        case UIDevice = "UIDevice"
        case UIFont = "UIFont"
        case UIImage = "UIImage"
        case UIImageView = "UIImageView"
        case UILabel = "UILabel"
        case UINavigationBar = "UINavigationBar"
        case UIScreen = "UIScreen"
        case UIScrollView = "UIScrollView"
        case UITableView = "UITableView"
        case UITextField = "UITextField"
        case UITextView = "UITextView"
        case UIToolbar = "UIToolbar"
        case UIView = "UIView"
        case UIWebView = "UIWebView"
        case UIWindow = "UIWindow"
        case Array = "Array"
        case Dictionary = "Dictionary"
        case NSArray = "NSArray"
        case NSData = "NSData"
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
    }
    
    override func viewDidLoad() {
        switch detailType {
        case .BFApp:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            BFLog("App name: \(APP_NAME)")
            BFLog("App build: \(APP_BUILD)")
            BFLog("App version: \(APP_VERSION)")
            let openString = BFLocalizedString("OPEN")
            BFLog("Localized string from BFKit: \(openString)")
            
            BFApp.onFirstStart({ (isFirstStart) -> () in
                if isFirstStart {
                    BFLog("Is first start!")
                } else {
                    BFLog("Is not first start!")
                }
            })
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .BFButton:
            scrollView.removeFromSuperview()
            
            let button: BFButton = BFButton(frame: CGRectMake(20, 84, SCREEN_WIDTH - 40, 50), image: UIImage(maskedText: "BFKit", font: .HelveticaNeueBold, fontSize: 20, imageSize: CGSizeMake(SCREEN_WIDTH, 50), backgroundColor: UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ))!, highlightedImage: UIImage(maskedText: "BFKit", font: .HelveticaNeueBold, fontSize: 20, imageSize: CGSizeMake(SCREEN_WIDTH, 50), backgroundColor: UIColor ( red: 0.301, green: 0.55, blue: 0.686, alpha: 1.0 ))!, fadeDuration: 1)
            self.view.addSubview(button)
        case .BFDataStructures:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let stack: Stack = Stack()
            stack.push("1")
            stack.push("2")
            BFLog("Push: 1\nPush: 2\nStack: \(stack)")
            stack.pop()
            BFLog("Pop\nStack: \(stack)")
            stack.empty() ? BFLog("Is empty") : BFLog("Is not empty")
            
            let list: List = List()
            list.insert("1")
            list.insert("2")
            list.insert("3")
            BFLog("\n\nInsert: 1\nInsert: 2\nInsert: 3\nList: \(list)")
            BFLog("Search index 0: \(list.search(0))")
            let search = list.search("3")
            BFLog("Search object \"3\": \(search)")
            list.delete("3")
            BFLog("Delete: 3\nList: \(list)")
            list.delete(0)
            BFLog("Delete index: 0\nList: \(list)")
            
            let queue: Queue = Queue()
            queue.enqueue("1")
            queue.enqueue("2")
            queue.enqueue("3")
            BFLog("\n\nEnqueue: 1\nEnqueue: 2\nEnqueue: 3\nQueue: \(queue)")
            BFLog("Top: \(queue.top())")
            queue.dequeue()
            BFLog("Dequeue\nQueue: \(queue)")
            queue.emptyQueue()
            BFLog("Empty queue: \(queue)")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
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
        case .BFTextField:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            let textField: BFTextField = BFTextField(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 25))
            textField.borderStyle = .Bezel
            textField.maxNumberOfCharacters = 5
            
            scrollView.addSubview(textField)
        case .BFTouchID:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            let normalLabel: UILabel = UILabel(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 50), text: "Waiting for Touch ID...", font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Center, lines: 2)
            scrollView.addSubview(normalLabel)
            
            if #available(iOS 8.0, *) {
                BFTouchID.showTouchIDAuthenticationWithReason(BFLocalizedString("AUTHENTICATION"), completion: { (result) -> () in
                    switch result {
                    case .Success:
                        runOnMainThread({
                            normalLabel.text = BFLocalizedString("AUTHORIZED")
                        })
                    case .AuthenticationFailed:
                        runOnMainThread({
                            normalLabel.text = BFLocalizedString("NOT_OWNER")
                        })
                    default:
                        runOnMainThread({
                            let error = BFLocalizedString("ERROR")
                            normalLabel.text = "\(error): \(result.rawValue)"
                        })
                    }
                })
            } else {
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
            
            if UIDevice.isiPhone() {
                deviceInfoString += "Device: iPhone\n"
            } else if UIDevice.isiPad() {
                deviceInfoString += "Device: iPad\n"
            } else if UIDevice.isiPod() {
                deviceInfoString += "Device: iPod\n"
            } else if UIDevice.isSimulator() {
                deviceInfoString += "Device: Simulator\n"
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
            
            let dummyImage: UIImage = UIImage(dummyImageWithSizeAndColor: "200x200.#ECB11E")!
            let dummyImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20 + blurredImageView.frame.size.height + 20 + bumpedImageView.frame.size.height + 20 + sepiaImageView.frame.size.height + 20 + colorImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: dummyImage)
            let dummyLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Dummy Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            dummyImageView.addSubview(dummyLabel)
            scrollView.addSubview(dummyImageView)
        case .UIImageView:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, ((SCREEN_WIDTH - 40) * 2) + (20 * 3))
            
            let imageView: UIImageView = UIImageView(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: UIImage(named: "Logo")!)
            scrollView.addSubview(imageView)
            
            let maskedImageView: UIImageView = UIImageView(frame: CGRectMake(20, 20 + imageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40), image: UIImage(named: "Logo")!)
            maskedImageView.setMaskImage(UIImage(named: "Logo2")!)
            let maskedImageLabel: UILabel = UILabel(frame: CGRectMake(0, 40, SCREEN_WIDTH - 40, 25), text: "Masked Image", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            maskedImageView.addSubview(maskedImageLabel)
            scrollView.addSubview(maskedImageView)
        case .UILabel:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            let normalLabel: UILabel = UILabel(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 25), text: "Normal Label", font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Center, lines: 1)
            scrollView.addSubview(normalLabel)
            
            let shadowLabel: UILabel = UILabel(frame: CGRectMake(20, 60, SCREEN_WIDTH - 40, 25), text: "Label with Shadow and other font", font: .HoeflerTextBlack, size: 12, color: UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            scrollView.addSubview(shadowLabel)
        case .UINavigationBar:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            self.navigationController?.navigationBar.setTransparent(true)
            
            let navigationInfoLabel: UILabel = UILabel(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 200), text: "Check the transparent UINavigationBar 🔝", font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, lines: 1)
            scrollView.addSubview(navigationInfoLabel)
        case .UIScreen:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            var screenInfoString: String = ""
            
            if UIScreen.isRetina() {
                screenInfoString += "Retina: Yes\n"
            } else {
                screenInfoString += "Retina: No\n"
            }
            
            if UIScreen.isRetinaHD() {
                screenInfoString += "Retina HD: Yes\n"
            } else {
                screenInfoString += "Retina HD: No\n"
            }
            
            let screenInfoLabel: UILabel = UILabel(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 200), text: screenInfoString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, lines: 8)
            scrollView.addSubview(screenInfoLabel)
        case .UIScrollView:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 1000)
            
            let scrollLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "You are just using an UIScrollView!", font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Center, lines: 1)
            scrollView.addSubview(scrollLabel)
        case .UITableView:
            scrollView.removeFromSuperview()
            
            let tableView: UITableView = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), style: .Plain, cellSeparatorStyle: .SingleLine, separatorInset: UIEdgeInsetsMake(0, 15, 0, 0), dataSource: nil, delegate: nil)
            self.view.addSubview(tableView)
        case .UITextField:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)
            
            let textField: UITextField = UITextField(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 25), placeholder: "Text field placeholder", font: .Verdana, size: 18, color: UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ), returnType: .Done, keyboardType: .EmailAddress, secure: true, borderStyle: .Bezel, autoCapitalization: .Words, keyboardAppearance: .Light, enablesReturnKeyAutomatically: true, clearButtonMode: .WhileEditing, autoCorrectionType: .Default, delegate: nil)
            scrollView.addSubview(textField)
        case .UITextView:
            scrollView.removeFromSuperview()
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: "This is a text view\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse lacinia blandit eros, sit amet aliquet tellus sollicitudin et. Nullam a ipsum nec libero hendrerit aliquet. Pellentesque faucibus pretium odio, sit amet accumsan arcu malesuada ut. Cras rhoncus volutpat nisl consequat eleifend. Donec tincidunt consectetur justo, molestie hendrerit justo dictum vel. Vestibulum nec commodo arcu. Donec sodales, augue vel fermentum ultrices, nunc augue vulputate tortor, sit amet eleifend nisl sapien eget magna. Donec aliquet mattis mi vel fermentum. Donec elementum pellentesque libero, in aliquam mauris luctus vel. In et vulputate nibh, id tristique ipsum. Donec fermentum ante et augue cursus aliquam. Vivamus nisi justo, pulvinar porta dolor id, tristique pretium augue. Nulla blandit felis felis, ut rutrum eros rutrum eu. Morbi mauris dolor, feugiat non placerat non, ultrices nec eros. Sed at eleifend felis. Mauris blandit feugiat nulla eget tempor. Nunc semper suscipit magna et semper. Suspendisse a arcu vitae diam scelerisque vestibulum ut eu dolor. Suspendisse accumsan venenatis leo, id maximus turpis. Pellentesque ac nunc augue. Etiam pharetra velit quis metus ornare vehicula. Cras eleifend sapien vitae est ultrices, a ullamcorper nibh scelerisque. Pellentesque tempor tortor dignissim, cursus tortor ac, sagittis felis. Praesent ultrices scelerisque odio, in fringilla sem tincidunt quis. Aenean sem augue, mattis luctus magna vel, accumsan volutpat felis. Nam blandit venenatis tincidunt. Pellentesque sodales lectus at orci tempus, vel pharetra massa vestibulum. Integer scelerisque ex aliquet quam molestie, a laoreet augue mattis. Etiam ut ex nisi. Mauris mollis tincidunt hendrerit. Nunc mi lectus, viverra ut nunc et, sagittis maximus augue. Pellentesque ullamcorper condimentum enim, vitae tempus risus. Maecenas facilisis lectus eget sem luctus porta. Etiam ut nunc non diam facilisis volutpat. Phasellus a augue feugiat, iaculis metus sit amet, pharetra lacus. Nulla facilisi. Maecenas sollicitudin justo ac auctor feugiat. Nunc ac dui sem. Aliquam fringilla porttitor massa, quis mattis nisl sodales a. Pellentesque iaculis non nisi aliquam malesuada. Aliquam erat volutpat. Donec arcu dui, rutrum ut tortor id, hendrerit aliquam ligula.", font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .UIToolbar:
            scrollView.removeFromSuperview()
            
            let toolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, SCREEN_HEIGHT - 50 - 44, SCREEN_WIDTH, 44))
            toolbar.setItems([UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(DetailViewController.barButtonItemsAction(_:))), UIBarButtonItem(barButtonSpaceType: .FlexibleSpace), UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(DetailViewController.barButtonItemsAction(_:)))], animated: true)
            toolbar.setTransparent(true)
            self.view.addSubview(toolbar)
        case .UIView:
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 240 + SCREEN_WIDTH)
            
            let borderedView: UIView = UIView(frame: CGRectMake(20, 20, SCREEN_WIDTH - 40, 44), backgroundColor: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0))
            borderedView.createBordersWithColor(UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0), radius: 10, width: 3)
            let borderedLabel: UILabel = UILabel(frame: CGRectMake(0, 0, SCREEN_WIDTH - 40, 44), text: "Bordered View", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            borderedView.addSubview(borderedLabel)
            scrollView.addSubview(borderedView)
            
            let shadowView: UIView = UIView(frame: CGRectMake(20, 100, SCREEN_WIDTH - 40, 44), backgroundColor: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0))
            shadowView.createRectShadowWithOffset(CGSizeMake(10, 10), opacity: 0.5, radius: 10)
            let shadowLabel: UILabel = UILabel(frame: CGRectMake(0, 0, SCREEN_WIDTH - 40, 44), text: "Shadow View", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            shadowView.addSubview(shadowLabel)
            scrollView.addSubview(shadowView)
            
            let shakeButton: UIButton = UIButton(frame: CGRectMake(20, 180, SCREEN_WIDTH - 40, 44), title: "Touch me!", color: UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ), highlightedColor: UIColor ( red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0 ))
            shakeButton.setTitleColor(UIColor.whiteColor(), highlightedColor: UIColor.whiteColor())
            shakeButton.addTarget(self, action: #selector(DetailViewController.shakeButtonAction(_:)), forControlEvents: .TouchUpInside)
            scrollView.addSubview(shakeButton)
            
            let gradientView: UIView = UIView(frame: CGRectMake(20, 260, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40))
            gradientView.createGradientWithColors([UIColor.blueColor(), UIColor.redColor()], direction: .DiagonalFromRightToLeftAndTopToDown)
            let gradientLabel: UILabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH - 40, 25), text: "Gradient View", font: .HelveticaNeue, size: 16, color: UIColor.whiteColor(), alignment: .Center, lines: 1, shadowColor: UIColor.blackColor())
            gradientView.addSubview(gradientLabel)
            scrollView.addSubview(gradientView)
        case .UIWebView:
            scrollView.removeFromSuperview()
            
            let webView: UIWebView = UIWebView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
            webView.loadWebsite("https://www.google.com")
            webView.removeShadow()
            self.view.addSubview(webView)
        case .UIWindow:
            scrollView.removeFromSuperview()
            
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.window?.takeScreenshotWithDelay(1, save: false, completion: { (screenshot) -> () in
                let _screenshot = screenshot.imageByScalingProportionallyToSize(CGSizeMake(SCREEN_WIDTH - 40, SCREEN_HEIGHT - 40 - 64 - 50 - 20))
                let screenshotView: UIImageView = UIImageView(image: _screenshot)
                screenshotView.center = CGPointMake(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) + 64 - 50 - 10)
                screenshotView.createRectShadowWithOffset(CGSizeZero, opacity: 10, radius: 10)
                self.view.addSubview(screenshotView)
            })
            
            BFShowTouchOnScreen()
        case .Array:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let array: Array<Int> = [1, 2, 3, 4, 5]
            
            BFLog("Normal Array: \(array)")
            BFLog("Reversed Array: \(array.reversedArray())")
            BFLog("Array to JSON: \(try! array.arrayToJSON())")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .Dictionary:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let today: NSDate = NSDate()
            
            let dictionary: Dictionary<String, AnyObject> = ["Today" : today.description, "Description of today" : NSDate.dateInformationDescriptionWithInformation(today.dateInformation()) ,"array" : [1, 2, 3, 4, 5]]
            
            BFLog("Normal Dictionary: \(dictionary)")
            BFLog("Dictionary to JSON: \(try! dictionary.dictionaryToJSON())")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSArray:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let array: NSArray = [1, 2, 3, 4, 5]
            
            BFLog("Normal Array: \(array)")
            BFLog("Reversed Array: \(array.reversedArray())")
            BFLog("Array to JSON: \(try! array.arrayToJSON())")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSData:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            var string = "This is a test"
            BFLog("String: \(string)")
            
            let data = string.convertToNSData()
            BFLog("Converted to NSData: \(data)")
            
            string = data.convertToUTF8String()
            BFLog("NSData converted to NSString: \(string)");
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSDate:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let today: NSDate = NSDate()
            
            BFLog("Today: \(today)")
            BFLog("Yesterday: \(NSDate.yesterday())")
            BFLog("Today is: \(today.dayFromWeekday())")
            BFLog("Description of today: \(NSDate.dateInformationDescriptionWithInformation(today.dateInformation()))")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSDictionary:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let today: NSDate = NSDate()
            
            let dictionary: NSDictionary = ["Today" : today.description, "Description of today" : NSDate.dateInformationDescriptionWithInformation(today.dateInformation()) ,"array" : [1, 2, 3, 4, 5]]
            
            BFLog("Normal Dictionary: \(dictionary)")
            BFLog("Dictionary to JSON: \(try! dictionary.dictionaryToJSON())")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSFileManager:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let array: Array<Int> = [1, 2, 3, 4, 5]
            
            let saving: String = NSFileManager.saveArrayToPath(.Documents, filename: "temp", array: array) ? "Save array: Yes" : "Save array: No"
            let directory: String = NSFileManager.getDocumentsDirectoryForFile("temp.plist")
            let deleting: String = try! NSFileManager.deleteFile("temp.plist", fromDirectory: .Documents) ? "Delete file: Yes" : "Delete file: No"
            
            BFLog("\(saving)")
            BFLog("Directory: \(directory)")
            BFLog("\(deleting)")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSMutableArray:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let array: NSMutableArray = NSMutableArray(array: [1, 2, 3, 4, 5])
            
            array.moveObjectFromIndex(0, toIndex: 2)
            BFLog("Move objects: \(array)")
            BFLog("Reversed Array: \(array.reversedArray())")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSMutableDictionary:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let dictionary: NSMutableDictionary = NSMutableDictionary()
            
            dictionary.safeSetObject(UIImage(), forKey: "Image")
            BFLog("Dictionary: \(dictionary)")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSNumber:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            BFLog("Radians to degrees: \(RadiansToDegrees(Float(M_PI)))")
            BFLog("Random int: \(NSNumber.randomIntBetweenMin(10, andMax: 50))")
            BFLog("Random float: \(NSNumber.randomFloatBetweenMin(0.1, andMax: 0.9)))")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSObject:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let nilObject: NSObject = NSNull()
            let object: NSObject = "Object"
            
            let invalid: String = nilObject.isValid() ? "Object is valid" : "Object is not valid"
            let valid: String = object.isValid() ? "Object is valid" : "Object is not valid"
            
            BFLog("\(invalid)")
            BFLog("\(valid)")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSProcessInfo:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            BFLog("CPU Usage (currently doesn't work): \(0.0)")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSString:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let string: NSString = "Search in this string!"
            let search: NSString = string.searchCharStart("a", charEnd: "s")
            let isEmail: NSString = string.isEmail() ? "Is email: Yes" : "Is email: No"
            BFLog("Search: \(search)")
            BFLog("\(isEmail)")
            
            let testHEX: NSString = "68 65 6c 6c 6f"
            var testString: NSString = "hello"
            BFLog("String: \(testString) - To HEX: \(testString.stringToHEX())")
            BFLog("HEX: \(testHEX) - To String: \(testHEX.HEXToString())")
            
            testString = "This    is    a     test"
            BFLog("\(testString)")
            testString = testString.removeExtraSpaces()
            BFLog("\(testString)")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        case .NSThread:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            runInBackground({
                self.threadFunciton()
            })
        case .String:
            scrollView.removeFromSuperview()
            
            BFLogClear()
            
            let string: String = "Search in this string!"
            let search: String = string.searchCharStart("a", charEnd: "s")
            let isEmail: String = string.isEmail() ? "Is email: Yes" : "Is email: No"
            BFLog("Search: \(search)")
            BFLog("\(isEmail)")
            BFLog("Lenght: \(string.length)")
            BFLog("Char at index 5: \(string.characterAtIndex(5))")
            BFLog("Substring with range: \(string.substringWithRange(0...5))")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        switch detailType {
        case .UINavigationBar:
            self.navigationController?.navigationBar.setTransparent(false)
        case .UIWindow:
            BFHideTouchOnScreen()
        default:
            break
        }
    }
    
    func prepareForDetail(detailTypeString: String) {
        detailType = DetailType(rawValue: detailTypeString)!
        
        self.title = detailTypeString
    }
    
    func shakeButtonAction(button: UIButton) {
        button.shakeView()
    }
    
    func barButtonItemsAction(button: UIBarButtonItem) {
        BFLog("Bar button pressed")
    }
    
    func threadFunciton() {
        BFLog("Background: \(NSThread.currentThread())")
        
        runOnMainThread {
            BFLog("Main: \(NSThread.currentThread())")
            
            let textView: UITextView = UITextView(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT), text: BFLogString, font: .HelveticaNeue, size: 16, color: UIColor.blackColor(), alignment: .Left, dataDetectorTypes: .All, editable: false, selectable: false, returnType: .Default, keyboardType: .Default, secure: false, autoCapitalization: .None, keyboardAppearance: .Default, enablesReturnKeyAutomatically: true, autoCorrectionType: .Default, delegate: nil)
            self.view.addSubview(textView)
        }
    }
}
