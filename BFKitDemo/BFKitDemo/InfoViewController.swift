//
//  InfoViewController.swift
//  BFKitDemo
//
//  Created by Fabrizio on 24/06/15.
//  Copyright (c) 2015 Fabrizio Brancati. All rights reserved.
//

import UIKit

class InfoViewController : UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        let profileImage: UIImageView = UIImageView(image: UIImage(named: "Profile")!, size: CGSizeMake(200, 200), center: CGPointMake(SCREEN_WIDTH / 2, SCREEN_WIDTH / 2.5))
        profileImage.setCornerRadius(profileImage.frame.size.width / 2)
        profileImage.createBordersWithColor(UIColor ( red: 0.9218, green: 0.565, blue: 0.139, alpha: 1.0 ), radius: 100, width: 5)
        let shadowLayer: UIView = UIView(frame: CGRectMake(profileImage.frame.origin.x, profileImage.frame.origin.y, profileImage.frame.size.width, profileImage.frame.size.height))
        shadowLayer.createCornerRadiusShadowWithCornerRadius(profileImage.frame.size.width / 2, offset: CGSizeMake(0, 0), opacity: 0.5, radius: 10)
        scrollView.addSubview(shadowLayer)
        scrollView.addSubview(profileImage)
        
        let logoImage: UIImageView = UIImageView(image: UIImage(named: "Logo2")!, size: CGSizeMake(80, 80), center: CGPointMake(profileImage.frame.origin.x + profileImage.frame.size.width - 30, profileImage.frame.origin.y + profileImage.frame.size.height - 30))
        scrollView.addSubview(logoImage)
        
        let nameLabel: UILabel = UILabel(frame: CGRectMake(0, profileImage.frame.origin.y + profileImage.frame.size.height + 50, SCREEN_WIDTH, 30), text: "Fabrizio Brancati", font: .HelveticaNeueMedium, size: 25, color: UIColor.blackColor(), alignment: .Center, lines: 1)
        scrollView.addSubview(nameLabel)
        
        let workLabel: UILabel = UILabel(frame: CGRectMake(0, nameLabel.frame.origin.y + nameLabel.frame.size.height + 40, SCREEN_WIDTH, 80), text: "iOS Developer\n&\nWeb Developer", font: .HelveticaNeue, size: 22, color: UIColor.blackColor(), alignment: .Center, lines: 3)
        scrollView.addSubview(workLabel)
        
        let siteButton: UIButton = UIButton(frame: CGRectMake(0, workLabel.frame.origin.y + workLabel.frame.size.height + 35, SCREEN_WIDTH, 44), title: "www.fabriziobrancati.com")
        siteButton.setTitleColor(UIColor ( red: 0.8934, green: 0.3935, blue: 0.0746, alpha: 1.0 ))
        siteButton.setTitleFont(.HelveticaNeueMedium, size: 20)
        siteButton.addTarget(self, action: "openWebsite", forControlEvents: .TouchDown)
        scrollView.addSubview(siteButton)
        
        scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, profileImage.frame.origin.y + profileImage.frame.size.height + 50 + nameLabel.frame.size.height + 40 + workLabel.frame.size.height + 35 + siteButton.frame.size.height + 20)
    }
    
    @IBAction func closeInfo(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func openWebsite() {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.fabriziobrancati.com")!)
    }
}
