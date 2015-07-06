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
