//
//  InfoViewController.swift
//  BFKitDemo
//
//  Created by Fabrizio on 24/06/15.
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//

import UIKit

class InfoViewController : UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        let profileImage: UIImageView = UIImageView(image: UIImage(named: "Profile")!, size: CGSize(width: 200, height: 200), center: CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_WIDTH / 2.5))
        profileImage.setCornerRadius(profileImage.frame.size.width / 2)
        profileImage.createBordersWithColor(UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ), radius: 100, width: 5)
        let shadowLayer: UIView = UIView(frame: CGRect(x: profileImage.frame.origin.x, y: profileImage.frame.origin.y, width: profileImage.frame.size.width, height: profileImage.frame.size.height))
        shadowLayer.createCornerRadiusShadowWithCornerRadius(profileImage.frame.size.width / 2, offset: CGSize(width: 0, height: 0), opacity: 0.5, radius: 10)
        scrollView.addSubview(shadowLayer)
        scrollView.addSubview(profileImage)
        
        let logoImage: UIImageView = UIImageView(image: UIImage(named: "Logo2")!, size: CGSize(width: 80, height: 80), center: CGPoint(x: profileImage.frame.origin.x + profileImage.frame.size.width - 30, y: profileImage.frame.origin.y + profileImage.frame.size.height - 30))
        scrollView.addSubview(logoImage)
        
        let nameLabel: UILabel = UILabel(frame: CGRect(x: 0, y: profileImage.frame.origin.y + profileImage.frame.size.height + 50, width: SCREEN_WIDTH, height: 30), text: "Fabrizio Brancati", font: .HelveticaNeueMedium, size: 25, color: UIColor.black(), alignment: .center, lines: 1)
        scrollView.addSubview(nameLabel)
        
        let workLabel: UILabel = UILabel(frame: CGRect(x: 0, y: nameLabel.frame.origin.y + nameLabel.frame.size.height + 40, width: SCREEN_WIDTH, height: 80), text: "iOS Developer\n&\nWeb Developer", font: .HelveticaNeue, size: 22, color: UIColor.black(), alignment: .center, lines: 3)
        scrollView.addSubview(workLabel)
        
        let siteButton: UIButton = UIButton(frame: CGRect(x: 0, y: workLabel.frame.origin.y + workLabel.frame.size.height + 35, width: SCREEN_WIDTH, height: 44), title: "www.fabriziobrancati.com")
        siteButton.setTitleColor(UIColor ( red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0 ))
        siteButton.setTitleFont(.HelveticaNeueMedium, size: 20)
        siteButton.addTarget(self, action: #selector(InfoViewController.openWebsite), for: .touchDown)
        scrollView.addSubview(siteButton)
        
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH, height: profileImage.frame.origin.y + profileImage.frame.size.height + 50 + nameLabel.frame.size.height + 40 + workLabel.frame.size.height + 35 + siteButton.frame.size.height + 20)
    }
    
    @IBAction func closeInfo(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func openWebsite() {
        UIApplication.shared().openURL(URL(string: "http://www.fabriziobrancati.com")!)
    }
}
