//
//  AppDelegate.swift
//  BFKitDemo
//
//  Created by Fabrizio on 26/04/15.
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//

import UIKit

let BFKitArray = [  "BFApp",
                    "BFButton",
                    "BFDataStructures",
                    "BFLog",
                    "BFPassword",
                    "BFSystemSound",
                    "BFTextField",
                    "BFTouchID"]

let UIKitArray = [  "UIButton",
                    "UIColor",
                    "UIDevice",
                    "UIFont",
                    "UIImage",
                    "UIImageView",
                    "UILabel",
                    "UINavigationBar",
                    "UIScreen",
                    "UIScrollView",
                    "UITableView",
                    "UITextField",
                    "UITextView",
                    "UIToolbar",
                    "UIView",
                    "UIWebView",
                    "UIWindow"]

let FoundationArray = [ "Array",
                        "Dictionary",
                        "NSArray",
                        "NSData",
                        "NSDate",
                        "NSDictionary",
                        "NSFileManager",
                        "NSMutableArray",
                        "NSMutableDictionary",
                        "NSNumber",
                        "NSObject",
                        "NSProcessInfo",
                        "NSString",
                        "NSThread",
                        "String"]

let InfoViewControllerSegueID = "InfoViewControllerSegueID"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Variables -
    
    var window: UIWindow?

    // MARK: - Delegate functions -

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UINavigationBar.appearance().titleTextAttributes = [ NSForegroundColorAttributeName : UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0)]
        UINavigationBar.appearance().tintColor = UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0)
        UITabBar.appearance().tintColor = UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0)
        UIBarButtonItem.appearance().tintColor = UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0)
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
