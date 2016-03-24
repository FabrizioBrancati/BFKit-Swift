//
//  UserInterfaceViewController.swift
//  BFKitDemo
//
//  Created by Fabrizio on 26/04/15.
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//

import UIKit

class UserInterfaceViewController: UITableViewController {
    let CellIdentifier = "UIKitCell"
    let CellIdentifierSubtitle = "UIKitCellSubtitle"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let infoButton: UIButton = UIButton(type: .InfoLight)
        infoButton.addTarget(self, action: #selector(UserInterfaceViewController.showInfo(_:)), forControlEvents: .TouchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showInfo(sender: UIButton) {
        self.performSegueWithIdentifier(InfoViewControllerSegueID, sender: self.navigationItem.rightBarButtonItem)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "By \(BFKIT_AUTHOR) - BFKit v\(APP_VERSION) (\(APP_BUILD))"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UIKitArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if UIKitArray[indexPath.row] == "UIToolbar" {
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifierSubtitle)!
            
            cell.detailTextLabel?.text = "+ UIBarButtonItem"
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)!
        }
        
        cell.textLabel?.text = UIKitArray[indexPath.row]
        cell.tag = indexPath.row
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(DetailViewController) {
            let detailViewController: DetailViewController = segue.destinationViewController as! DetailViewController

            detailViewController.prepareForDetail(UIKitArray[sender!.tag!])
        }
    }
}
