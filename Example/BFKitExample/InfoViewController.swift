//
//  InfoViewController.swift
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

class InfoViewController : UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        let profileImage: UIImageView = UIImageView(image: UIImage(named: "Profile")!, size: CGSize(width: 200, height: 200), center: CGPoint(x: UIScreen.screenWidth / 2, y: UIScreen.screenWidth / 2.5))
        profileImage.cornerRadius(corners: .allCorners, radius: profileImage.frame.size.width / 2)
        profileImage.border(color: UIColor(red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0), radius: 100, width: 5)
        let shadowLayer: UIView = UIView(frame: CGRect(x: profileImage.frame.origin.x, y: profileImage.frame.origin.y, width: profileImage.frame.size.width, height: profileImage.frame.size.height))
        shadowLayer.shadow(offset: CGSize(width: 0, height: 0), opacity: 0.5, radius: 10, cornerRadius: profileImage.frame.size.width / 2)
        scrollView.addSubview(shadowLayer)
        scrollView.addSubview(profileImage)
        
        let logoImage: UIImageView = UIImageView(image: UIImage(named: "Logo2")!, size: CGSize(width: 80, height: 80), center: CGPoint(x: profileImage.frame.origin.x + profileImage.frame.size.width - 30, y: profileImage.frame.origin.y + profileImage.frame.size.height - 30))
        scrollView.addSubview(logoImage)
        
        let nameLabel: UILabel = UILabel(frame: CGRect(x: 0, y: profileImage.frame.origin.y + profileImage.frame.size.height + 50, width: UIScreen.screenWidth, height: 30), text: "Fabrizio Brancati", font: .helveticaNeueMedium, fontSize: 25, color: UIColor.black, alignment: .center, lines: 1)
        scrollView.addSubview(nameLabel)
        
        let workLabel: UILabel = UILabel(frame: CGRect(x: 0, y: nameLabel.frame.origin.y + nameLabel.frame.size.height + 40, width: UIScreen.screenWidth, height: 80), text: "iOS Developer\n&\nWeb Developer", font: .helveticaNeue, fontSize: 22, color: UIColor.black, alignment: .center, lines: 3)
        scrollView.addSubview(workLabel)
        
        let siteButton: UIButton = UIButton(frame: CGRect(x: 0, y: workLabel.frame.origin.y + workLabel.frame.size.height + 35, width: UIScreen.screenWidth, height: 44), title: "www.fabriziobrancati.com")
        siteButton.setTitleColor(UIColor ( red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0 ))
        siteButton.setTitleFont(.helveticaNeueMedium, size: 20)
        siteButton.addTarget(self, action: #selector(InfoViewController.openWebsite), for: .touchDown)
        scrollView.addSubview(siteButton)
        
        scrollView.contentSize = CGSize(width: UIScreen.screenWidth, height: profileImage.frame.origin.y + profileImage.frame.size.height + 50 + nameLabel.frame.size.height + 40 + workLabel.frame.size.height + 35 + siteButton.frame.size.height + 20)
    }
    
    @IBAction func closeInfo(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func openWebsite() {
        UIApplication.shared.openURL(URL(string: "http://www.fabriziobrancati.com")!)
    }
}
