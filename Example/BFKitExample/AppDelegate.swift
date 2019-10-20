//
//  AppDelegate.swift
//  BFKitDemo
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati.
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

import UIKit

// MARK: - Global variables

let BFKitArray = [  "BFApp",
                    "BFBiometrics",
                    "BFButton",
                    "BFDataStructures",
                    "BFLog",
                    "BFPassword",
                    "BFSystemSound",
                    "BFTextField"]

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
                    "UIWindow"]

let FoundationArray = [ "Array",
                        "Collection",
                        "Data",
                        "Date",
                        "FileManager",
                        "Number",
                        "NSObject",
                        "Thread",
                        "String"]

let InfoViewControllerSegueID = "InfoViewControllerSegueID"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Variables
    
    var window: UIWindow?

    // MARK: - Functions
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0)]
        UINavigationBar.appearance().tintColor = UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0)
        UITabBar.appearance().tintColor = UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0)
        UIBarButtonItem.appearance().tintColor = UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0)
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
