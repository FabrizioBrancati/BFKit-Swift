//
//  InfoViewController.swift
//  BFKitDemo
//
//  Created by Fabrizio on 24/06/15.
//  Copyright (c) 2015 Fabrizio Brancati. All rights reserved.
//

import UIKit

class InfoViewController : UIViewController
{
    @IBAction func closeInfo(sender: UIBarButtonItem)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
