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
    
    func prepareForDetail(detailTypeString: String)
    {
        let detailType: DetailType = DetailType(rawValue: detailTypeString)!
        
        self.title = detailTypeString

        switch detailType
        {
        case .UIDevice:
            BFLog("\(UIDevice.devicePlatform())")
            BFLog("\(UIDevice.isSimulator()) - \(UIDevice.isiPhone())")
            BFLog("\(UIDevice.devicePlatform().substringFromIndex(6))")
            BFLog("\(UIDevice.devicePlatform().substringToIndex(6))")
            BFLog("\(UIDevice.busFrequency()/1024/1024)")
            BFLog("\(UIDevice.cpuNumber())")
            BFLog("\(UIDevice.totalMemory()/1024/1024)")
            BFLog("\(UIDevice.userMemory()/1024/1024)")
            let respond = UIDevice.currentDevice().respondsToSelector("identifierForVendor")
            BFLog("\(respond)")
            BFLog("\(UIDevice.uniqueIdentifier())")
        case .UIFont:
            UIFont.allFamilyAndFonts()
        case .UIImage:
            let button = UIImageView(image: UIImage(dummyImageWithSizeAndColor: "100x100.blue"))
            self.view.addSubview(button)
        default:
            break
        }
    }
}
