//
//  DetailViewController.swift
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

class DetailViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    
    var detailType: DetailType = .BFApp
    
    enum DetailType : String {
        case BFApp
        case BFBiometrics
        case BFButton
        case BFDataStructures
        case BFLog
        case BFPassword
        case BFSystemSound
        case BFTextField
        case UIButton
        case UIColor
        case UIDevice
        case UIFont
        case UIImage
        case UIImageView
        case UILabel
        case UINavigationBar
        case UIScreen
        case UIScrollView
        case UITableView
        case UITextField
        case UITextView
        case UIToolbar
        case UIView
        case UIWindow
        case Array
        case Collection
        case Data
        case Date
        case FileManager
        case Number
        case NSObject
        case Thread
        case String
    }
    
    override func viewDidLoad() {
        #if DEBUG
            BFLog.active = true
        #endif
        
        switch detailType {
        case .BFApp:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            BFLog.log("App name: \(BFApp.name)")
            BFLog.log("App build: \(BFApp.build)")
            BFLog.log("App version: \(BFApp.version)")
            BFLog.log("App set: \(BFApp.setAppSetting(object: "Test", forKey: "Test"))")
            BFLog.log("App get: \(BFApp.getAppSetting(objectKey: "Test") ?? "")")
            
            BFApp.onFirstStart { isFirstStart in
                if isFirstStart {
                    BFLog.log("Is first start!")
                } else {
                    BFLog.log("Is not first start!")
                }
            }
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .BFBiometrics:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
            let normalLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 50), text: "Waiting for Biometric...", font: .helveticaNeue, fontSize: 16, color: UIColor.black, alignment: .center, lines: 2)
            scrollView.addSubview(normalLabel)
            
            BFBiometrics.useBiometric(localizedReason: "This is a test", completion: { result in
                runOnMainThread {
                    if result == .success {
                        normalLabel.text = "Success"
                    } else {
                        normalLabel.text = "\(result.rawValue)"
                    }
                }
            })
        case .BFButton:
            scrollView.removeFromSuperview()
            
            let button: BFButton = BFButton(frame: CGRect(x: 20, y: 84, width: UIScreen.screenWidth - 40, height: 50), image: UIImage(maskedText: "BFKit", font: .helveticaNeueBold, fontSize: 20, imageSize: CGSize(width: UIScreen.screenWidth, height: 50), backgroundColor: UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ))!, highlightedImage: UIImage(maskedText: "BFKit", font: .helveticaNeueBold, fontSize: 20, imageSize: CGSize(width: UIScreen.screenWidth, height: 50), backgroundColor: UIColor ( red: 0.301, green: 0.55, blue: 0.686, alpha: 1.0 ))!, fadeDuration: 1)
            self.view.addSubview(button)
        case .BFDataStructures:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            var stack: Stack = Stack<String>()
            stack.push("1")
            stack.push("2")
            BFLog.log("Push: 1\nPush: 2\nStack: \(stack)")
            let removed = stack.pop()
            BFLog.log("Pop: \(removed!) \nStack: \(stack)")
            stack.empty() ? BFLog.log("Is empty") : BFLog.log("Is not empty")
            
            var list: List = List<String>()
            list.insert("1")
            list.insert("2")
            list.insert("3")
            BFLog.log("\n\nInsert: 1\nInsert: 2\nInsert: 3\nList: \(list)")
            BFLog.log("Search index 0: \(list.search(at: 0)!)")
            let search = list.search("3")
            BFLog.log("Search object \"3\": \(search)")
            let deleted = list.delete("3")
            BFLog.log("Delete: 3 - \(deleted) \nList: \(list)")
            list.delete(at: 0)
            BFLog.log("Delete index: 0\nList: \(list)")
            
            var queue: Queue = Queue<String>()
            queue.enqueue("1")
            queue.enqueue("2")
            queue.enqueue("3")
            BFLog.log("\n\nEnqueue: 1\nEnqueue: 2\nEnqueue: 3\nQueue: \(queue)")
            BFLog.log("Top: \(queue.top()!)")
            let dequeued = queue.dequeue()
            BFLog.log("Dequeue \(dequeued) \nQueue: \(queue)")
            queue.empty()
            BFLog.log("Empty queue: \(queue)")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .BFLog:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            BFLog.log("This will be shown only if in DEBUG mode")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .BFPassword:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            let pass1 = "Password"
            let passLevel1 = BFPassword.strength(password: pass1)
            BFLog.log("Password: \(pass1) - Level: \(passLevel1.rawValue) of \(BFPassword.PasswordStrengthLevel.verySecure.rawValue)")
            let pass2 = "kqi019ASC.v1|!-2"
            let passLevel2 = BFPassword.strength(password: pass2)
            BFLog.log("Password: \(pass2) - Level: \(passLevel2.rawValue) of \(BFPassword.PasswordStrengthLevel.verySecure.rawValue)")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .BFSystemSound:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            BFSystemSound.vibrate()
            BFLog.log("Vibrate")
            BFSystemSound.playSystemSound(audioID: .receivedMessage)
            BFLog.log("Play sound")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .BFTextField:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
            let textField: BFTextField = BFTextField(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 25))
            textField.borderStyle = .bezel
            textField.clearButtonMode = .always
            textField.maxNumberOfCharacters = 5
            
            scrollView.addSubview(textField)
        case .UIButton:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
            let clearButton: UIButton = UIButton(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 44), title: "Button with clear color")
            clearButton.setTitleColor(UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), highlightedColor: UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0))
            scrollView.addSubview(clearButton)
            
            let borderedButton: UIButton = UIButton(frame: CGRect(x: 20, y: 80, width: UIScreen.screenWidth - 40, height: 44), title: "Button with border")
            borderedButton.setTitleColor(UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), highlightedColor: UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0))
            borderedButton.border(color: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), radius: 10, width: 3)
            scrollView.addSubview(borderedButton)
            
            let coloredButton: UIButton = UIButton(frame: CGRect(x: 20, y: 140, width: UIScreen.screenWidth - 40, height: 44), title: "Button with color", color: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), highlightedColor: UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0))
            coloredButton.setTitleColor(UIColor.white, highlightedColor: UIColor.white)
            scrollView.addSubview(coloredButton)
            
            let coloredCornerRadiusButton: UIButton = UIButton(frame: CGRect(x: 20, y: 200, width: UIScreen.screenWidth - 40, height: 44), title: "Button with corner radius", color: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), highlightedColor: UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0))
            coloredCornerRadiusButton.setTitleColor(UIColor.white)
            coloredCornerRadiusButton.cornerRadius(corners: .allCorners, radius: 10)
            scrollView.addSubview(coloredCornerRadiusButton)
            
            let otherFontButton: UIButton = UIButton(frame: CGRect(x: 20, y: 260, width: UIScreen.screenWidth - 40, height: 44), title: "Button with other font")
            otherFontButton.setTitleFont(.chalkduster, size: 17)
            otherFontButton.setTitleColor(UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0))
            scrollView.addSubview(otherFontButton)
        case .UIColor:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
            let hexStringColor: UIView = UIView(frame: CGRect(x: 20, y: 80, width: UIScreen.screenWidth - 40, height: 44))
            hexStringColor.backgroundColor = UIColor(hex: "#36a9e0")
            let hexStringColorLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth - 40, height: 44), text: "HEX String Color", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            hexStringColor.addSubview(hexStringColorLabel)
            self.view.addSubview(hexStringColor)
            
            let hexColor: UIView = UIView(frame: CGRect(x: 20, y: 140, width: UIScreen.screenWidth - 40, height: 44))
            hexColor.backgroundColor = UIColor(hex: 0xEB9023)
            let hexColorLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth - 40, height: 44), text: "HEX Color", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            hexColor.addSubview(hexColorLabel)
            self.view.addSubview(hexColor)
            
            let randomColor: UIView = UIView(frame: CGRect(x: 20, y: 200, width: UIScreen.screenWidth - 40, height: 44))
            randomColor.backgroundColor = UIColor.random()
            let randomColorLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth - 40, height: 44), text: "Random Color", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            randomColor.addSubview(randomColorLabel)
            self.view.addSubview(randomColor)
        case .UIDevice:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
            var deviceInfoString: String = ""
            
            if UIDevice.isPhone() {
                deviceInfoString += "Device: iPhone\n"
            } else if UIDevice.isPad() {
                deviceInfoString += "Device: iPad\n"
            } else if UIDevice.isPod() {
                deviceInfoString += "Device: iPod\n"
            } else if UIDevice.isSimulator() {
                deviceInfoString += "Device: Simulator\n"
            }
            
            deviceInfoString += "iOS Version: \(UIDevice.osVersion)\n"
            
            deviceInfoString += "RAM Size: \(UIDevice.ramSize / 1024 / 1024) MB\n"
            
            deviceInfoString += "Unique Identifier: \(UIDevice.generateUniqueIdentifier())\n"
            
            let deviceInfoLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 200), text: deviceInfoString, font: .helveticaNeue, fontSize: 16, color: UIColor.black, alignment: .left, lines: 8)
            scrollView.addSubview(deviceInfoLabel)
        case .UIFont:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
            BFLog.log("\(UIFont.allFonts())")
            
            let fontLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Use a font with just an ENUM ^_^", font: .noteworthyLight, fontSize: 16, color: UIColor.black, alignment: .left, lines: 1)
            scrollView.addSubview(fontLabel)
            
            let otherFontLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 60, width: UIScreen.screenWidth - 40, height: 25), text: "It's awesome!", font: .americanTypewriterSemiBold, fontSize: 16, color: UIColor.black, alignment: .left, lines: 1)
            scrollView.addSubview(otherFontLabel)
        case .UIImage:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: ((UIScreen.screenWidth - 40) * 10) + (20 * 11))
            
            let blendOverlayImage: UIImage = #imageLiteral(resourceName: "Logo").blend(image: #imageLiteral(resourceName: "Logo2"), blendMode: .color)
            let blendOverlayImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: blendOverlayImage)
            let blendOverlayLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Blend Filter", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            blendOverlayImageView.addSubview(blendOverlayLabel)
            scrollView.addSubview(blendOverlayImageView)
            
            let imageAtRectImage: UIImage = #imageLiteral(resourceName: "Logo").crop(in: CGRect(x: 0, y: 0, width: 100, height: 100))
            let imageAtRectImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: 20 + blendOverlayImageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: imageAtRectImage)
            let imageAtRectLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Crop Rect", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            imageAtRectImageView.addSubview(imageAtRectLabel)
            scrollView.addSubview(imageAtRectImageView)
            
            let rotatedImage: UIImage = #imageLiteral(resourceName: "Logo").rotate(degrees: 90)
            let rotatedImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: rotatedImage)
            let rotatedLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Rotated Image", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            rotatedImageView.addSubview(rotatedLabel)
            scrollView.addSubview(rotatedImageView)
            
            let filledImage: UIImage = #imageLiteral(resourceName: "Logo2").fillAlpha(color: UIColor ( red: 0.9255, green: 0.6929, blue: 0.1188, alpha: 1.0 ))
            let filledImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: filledImage)
            let filledLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 40, width: UIScreen.screenWidth - 40, height: 25), text: "Filled Image", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            filledImageView.addSubview(filledLabel)
            scrollView.addSubview(filledImageView)
            
            let invertedImage: UIImage = #imageLiteral(resourceName: "Logo").invertColors()
            let invertedImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: 20 + blendOverlayImageView.frame.size.height + 20  + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: invertedImage)
            let invertedLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 40, width: UIScreen.screenWidth - 40, height: 25), text: "Inverted Image", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            invertedImageView.addSubview(invertedLabel)
            scrollView.addSubview(invertedImageView)
            
            let blurredImage: UIImage = #imageLiteral(resourceName: "Logo").blur(radius: 10)
            let blurredImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: blurredImage)
            let blurredLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Blurred Image", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            blurredImageView.addSubview(blurredLabel)
            scrollView.addSubview(blurredImageView)
            
            let distance = 20 + blendOverlayImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20
            
            let bumpedImage: UIImage = #imageLiteral(resourceName: "Logo").bumpDistortionLinear(center: CIVector(x: UIScreen.screenWidth - 40, y:UIScreen.screenWidth - 40), radius: 100, scale: 2, angle: Float.pi)
            let bumpedImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: distance + blurredImageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: bumpedImage)
            let bumpedLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Bump Distortion Linear Image", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            bumpedImageView.addSubview(bumpedLabel)
            scrollView.addSubview(bumpedImageView)
            
            let sepiaImage: UIImage = #imageLiteral(resourceName: "Logo").sepiaTone(intensity: 1)
            let sepiaImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: distance + blurredImageView.frame.size.height + 20 + bumpedImageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: sepiaImage)
            let sepiaLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Sepia Tone Image", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            sepiaImageView.addSubview(sepiaLabel)
            scrollView.addSubview(sepiaImageView)
            
            let colorImage: UIImage = UIImage(color: UIColor(red: 0.8784, green: 0.7106, blue: 0.0, alpha: 1.0 ))!
            let colorImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: distance + blurredImageView.frame.size.height + 20 + bumpedImageView.frame.size.height + 20 + sepiaImageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: colorImage)
            let colorLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Color Image", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            colorImageView.addSubview(colorLabel)
            scrollView.addSubview(colorImageView)
            
            let dummyImage: UIImage = UIImage(dummyImage: "200x200.#ECB11E")!
            let dummyImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: distance + blurredImageView.frame.size.height + 20 + bumpedImageView.frame.size.height + 20 + sepiaImageView.frame.size.height + 20 + colorImageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: dummyImage)
            let dummyLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Dummy Image", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            dummyImageView.addSubview(dummyLabel)
            scrollView.addSubview(dummyImageView)
        case .UIImageView:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: ((UIScreen.screenWidth - 40) * 2) + (20 * 3))
            
            let imageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: #imageLiteral(resourceName: "Logo"))
            scrollView.addSubview(imageView)
            
            let maskedImageView: UIImageView = UIImageView(frame: CGRect(x: 20, y: 20 + imageView.frame.size.height + 20, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40), image: #imageLiteral(resourceName: "Logo"))
            maskedImageView.mask(image: #imageLiteral(resourceName: "Logo2"))
            let maskedImageLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 40, width: UIScreen.screenWidth - 40, height: 25), text: "Masked Image", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            maskedImageView.addSubview(maskedImageLabel)
            scrollView.addSubview(maskedImageView)
        case .UILabel:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
            let normalLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Normal Label", font: .helveticaNeue, fontSize: 16, color: UIColor.black, alignment: .center, lines: 1)
            scrollView.addSubview(normalLabel)
            
            let shadowLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 60, width: UIScreen.screenWidth - 40, height: 25), text: "Label with Shadow and other font", font: .hoeflerTextBlack, fontSize: 12, color: UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ), alignment: .center, lines: 1, shadowColor: UIColor.black)
            scrollView.addSubview(shadowLabel)
        case .UINavigationBar:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
            self.navigationController?.navigationBar.setTransparent(true)
            
            let navigationInfoLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 200), text: "Check the transparent UINavigationBar 🔝", font: .helveticaNeue, fontSize: 16, color: UIColor.black, alignment: .left, lines: 1)
            scrollView.addSubview(navigationInfoLabel)
        case .UIScreen:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
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
            
            let screenInfoLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 200), text: screenInfoString, font: .helveticaNeue, fontSize: 16, color: UIColor.black, alignment: .left, lines: 8)
            scrollView.addSubview(screenInfoLabel)
        case .UIScrollView:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: 1000)
            
            let scrollLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "You are just using an UIScrollView!", font: .helveticaNeue, fontSize: 16, color: UIColor.black, alignment: .center, lines: 1)
            scrollView.addSubview(scrollLabel)
        case .UITableView:
            scrollView.removeFromSuperview()
            
            let tableView: UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), style: .plain, cellSeparatorStyle: .singleLine, separatorInset: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0), dataSource: nil, delegate: nil)
            self.view.addSubview(tableView)
        case .UITextField:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 120)
            
            let textField: UITextField = UITextField(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 25), placeholder: "Text field placeholder", font: .verdana, fontSize: 18, textColor: UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ), returnKeyType: .done, keyboardType: .emailAddress, secure: true, borderStyle: .bezel, autocapitalizationType: .words, keyboardAppearance: .light, enablesReturnKeyAutomatically: true, clearButtonMode: .whileEditing, autocorrectionType: .default, delegate: nil)
            scrollView.addSubview(textField)
        case .UITextView:
            scrollView.removeFromSuperview()
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: "This is a text view\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse lacinia blandit eros, sit amet aliquet tellus sollicitudin et. Nullam a ipsum nec libero hendrerit aliquet. Pellentesque faucibus pretium odio, sit amet accumsan arcu malesuada ut. Cras rhoncus volutpat nisl consequat eleifend. Donec tincidunt consectetur justo, molestie hendrerit justo dictum vel. Vestibulum nec commodo arcu. Donec sodales, augue vel fermentum ultrices, nunc augue vulputate tortor, sit amet eleifend nisl sapien eget magna. Donec aliquet mattis mi vel fermentum. Donec elementum pellentesque libero, in aliquam mauris luctus vel. In et vulputate nibh, id tristique ipsum. Donec fermentum ante et augue cursus aliquam. Vivamus nisi justo, pulvinar porta dolor id, tristique pretium augue. Nulla blandit felis felis, ut rutrum eros rutrum eu. Morbi mauris dolor, feugiat non placerat non, ultrices nec eros. Sed at eleifend felis. Mauris blandit feugiat nulla eget tempor. Nunc semper suscipit magna et semper. Suspendisse a arcu vitae diam scelerisque vestibulum ut eu dolor. Suspendisse accumsan venenatis leo, id maximus turpis. Pellentesque ac nunc augue. Etiam pharetra velit quis metus ornare vehicula. Cras eleifend sapien vitae est ultrices, a ullamcorper nibh scelerisque. Pellentesque tempor tortor dignissim, cursus tortor ac, sagittis felis. Praesent ultrices scelerisque odio, in fringilla sem tincidunt quis. Aenean sem augue, mattis luctus magna vel, accumsan volutpat felis. Nam blandit venenatis tincidunt. Pellentesque sodales lectus at orci tempus, vel pharetra massa vestibulum. Integer scelerisque ex aliquet quam molestie, a laoreet augue mattis. Etiam ut ex nisi. Mauris mollis tincidunt hendrerit. Nunc mi lectus, viverra ut nunc et, sagittis maximus augue. Pellentesque ullamcorper condimentum enim, vitae tempus risus. Maecenas facilisis lectus eget sem luctus porta. Etiam ut nunc non diam facilisis volutpat. Phasellus a augue feugiat, iaculis metus sit amet, pharetra lacus. Nulla facilisi. Maecenas sollicitudin justo ac auctor feugiat. Nunc ac dui sem. Aliquam fringilla porttitor massa, quis mattis nisl sodales a. Pellentesque iaculis non nisi aliquam malesuada. Aliquam erat volutpat. Donec arcu dui, rutrum ut tortor id, hendrerit aliquam ligula.", font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .UIToolbar:
            scrollView.removeFromSuperview()
            
            let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.screenHeight - 50 - 44, width: UIScreen.screenWidth, height: 44))
            toolbar.setItems([UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(DetailViewController.barButtonItemsAction(_:))), UIBarButtonItem(barButtonSpaceType: .flexibleSpace), UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(DetailViewController.barButtonItemsAction(_:)))], animated: true)
            toolbar.setTransparent(true, translucent: true)
            self.view.addSubview(toolbar)
        case .UIView:
            scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: 260 + UIScreen.screenWidth + UIScreen.screenWidth)
            
            let borderedView: UIView = UIView(frame: CGRect(x: 20, y: 20, width: UIScreen.screenWidth - 40, height: 44), backgroundColor: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0))
            borderedView.border(color: UIColor(red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0), radius: 10, width: 3)
            let borderedLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth - 40, height: 44), text: "Bordered View", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            borderedView.addSubview(borderedLabel)
            scrollView.addSubview(borderedView)
            
            let shadowView: UIView = UIView(frame: CGRect(x: 20, y: 100, width: UIScreen.screenWidth - 40, height: 44), backgroundColor: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0))
            shadowView.shadow(offset: CGSize(width: 10, height: 10), opacity: 0.5, radius: 10)
            let shadowLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth - 40, height: 44), text: "Shadow View", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            shadowView.addSubview(shadowLabel)
            scrollView.addSubview(shadowView)
            
            let shakeButton: UIButton = UIButton(frame: CGRect(x: 20, y: 180, width: UIScreen.screenWidth - 40, height: 44), title: "Touch me!", color: UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ), highlightedColor: UIColor ( red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0 ))
            shakeButton.setTitleColor(UIColor.white, highlightedColor: UIColor.white)
            shakeButton.addTarget(self, action: #selector(DetailViewController.shakeButtonAction(_:)), for: .touchUpInside)
            scrollView.addSubview(shakeButton)
            
            let gradientView: UIView = UIView(frame: CGRect(x: 20, y: 260, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40))
            gradientView.gradient(colors: [UIColor.blue, UIColor.red], direction: .diagonalLeftDownToRightTop)
            let gradientLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Gradient View", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            gradientView.addSubview(gradientLabel)
            scrollView.addSubview(gradientView)
            
            let smoothGradientView: UIView = UIView(frame: CGRect(x: 20, y: 260 + UIScreen.screenWidth, width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40))
            smoothGradientView.smoothGradient(colors: [UIColor.blue, UIColor.green, UIColor.red], direction: .diagonalLeftDownToRightTop)
            let smoothGradientLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.screenWidth - 40, height: 25), text: "Smooth Gradient View", font: .helveticaNeue, fontSize: 16, color: UIColor.white, alignment: .center, lines: 1, shadowColor: UIColor.black)
            smoothGradientView.addSubview(smoothGradientLabel)
            scrollView.addSubview(smoothGradientView)
        case .UIWindow:
            scrollView.removeFromSuperview()
            
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.windowScreenshot(delay: 1, save: false, completion: { screenshot in
                let _screenshot = screenshot?.scaleProportionally(toSize: CGSize(width: UIScreen.screenWidth - 40, height: UIScreen.screenHeight - 40 - 64 - 50 - 20))
                let screenshotView: UIImageView = UIImageView(image: _screenshot)
                screenshotView.center = CGPoint(x: UIScreen.screenWidth / 2, y: (UIScreen.screenHeight / 2) + 64 - 50 - 10)
                screenshotView.shadow(offset: CGSize.zero, opacity: 10, radius: 10)
                self.view.addSubview(screenshotView)
            })
            
            showTouchOnScreen()
        case .Array:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            let array: Array<Int> = [1, 2, 3, 4, 5]
            
            BFLog.log("Normal Array: \(array)")
            BFLog.log("Array to JSON: \(try! array.json())")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .Collection:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            let today: Date = Date()
            
            let dictionary: Dictionary<String, AnyObject> = ["Today" : today.description as AnyObject, "Description of today" : Date().description as AnyObject]
            
            BFLog.log("Normal Dictionary: \(dictionary)")
            BFLog.log("Dictionary to JSON: \(try! dictionary.json())")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .Data:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            var string = "This is a test"
            BFLog.log("String: \(string)")
            
            let data = string.dataValue
            BFLog.log("Converted to Data: \(data!)")
            
            string = (data?.utf8())!
            BFLog.log("Data converted to String: \(string)");
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .Date:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            let today: Date = Date()
            
            BFLog.log("Today: \(today)")
            BFLog.log("Yesterday: \(today.yesterday())")
            BFLog.log("Current month: \(today.localizedMonth())")
            BFLog.log("Today is: \(today.localizedWeekday())")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .FileManager:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            let array: [Int] = [1, 2, 3, 4, 5]
            
            let saving: String = FileManager.default.savePlist(object: array, in: .documents, filename: "temp") ? "Saved array: Yes" : "Saved array: No"
            let directory: String = FileManager.default.documentsPath(file: "temp.plist")!
            var deleting: String = ""
            do {
                try FileManager.default.delete(file: "temp.plist", from: .documents)
                deleting = "Deleted file: Yes"
            } catch {
                deleting = "Deleted file: No"
            }
            
            BFLog.log("\(saving)")
            BFLog.log("Directory: \(directory)")
            BFLog.log("\(deleting)")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .Number:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            BFLog.log("Radians to degrees: \(radiansToDegrees(Double.pi))")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .NSObject:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            let nilObject: NSObject = NSNull()
            let object: NSObject = "Object" as NSObject
            
            let invalid: String = nilObject.isValid() ? "Object is valid" : "Object is not valid"
            let valid: String = object.isValid() ? "Object is valid" : "Object is not valid"
            
            BFLog.log("\(invalid)")
            BFLog.log("\(valid)")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        case .Thread:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            runInBackground({
                self.threadFunciton()
            })
        case .String:
            scrollView.removeFromSuperview()
            
            BFLog.clear()
            
            let string: String = "Search in this string!"
            let isEmail: String = string.isEmail() ? "Is email: Yes" : "Is email: No"
            BFLog.log("\(isEmail)")
            BFLog.log("Char at index 5: \(string.character(at: 5))")
            BFLog.log("Substring with range: \(string.substring(with: 0..<5))")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        switch detailType {
        case .UINavigationBar:
            self.navigationController?.navigationBar.setTransparent(false)
        case .UIWindow:
            hideTouchOnScreen()
        default:
            break
        }
    }
    
    func prepareForDetail(_ detailTypeString: String) {
        detailType = DetailType(rawValue: detailTypeString)!
        
        self.title = detailTypeString
    }
    
    @objc func shakeButtonAction(_ button: UIButton) {
        button.shake()
    }
    
    @objc func barButtonItemsAction(_ button: UIBarButtonItem) {
        BFLog.log("Bar button pressed")
    }
    
    func threadFunciton() {
        BFLog.log("Background: \(Thread.current)")
        
        runOnMainThread {
            BFLog.log("Main: \(Thread.current)")
            
            let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 64, width: UIScreen.screenWidth, height: UIScreen.screenHeight), text: BFLog.logged, font: .helveticaNeue, fontSize: 16, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: false, selectable: false, returnKeyType: .default, keyboardType: .default, secure: false, autocapitalizationType: .none, keyboardAppearance: .default, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
            self.view.addSubview(textView)
        }
    }
}
