//
//  BFKitViewController.swift
//  BFKitDemo
//
//  Created by Fabrizio on 24/06/15.
//  Copyright (c) 2015 Fabrizio Brancati. All rights reserved.
//

import UIKit

class BFKitViewController: UITableViewController {
    let CellIdentifier = "BFKitCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let infoButton: UIButton = UIButton(type: .InfoLight)
        infoButton.addTarget(self, action: "showInfo:", forControlEvents: .TouchUpInside)
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
        return BFKitArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)!
        
        cell.textLabel?.text = BFKitArray[indexPath.row]
        cell.tag = indexPath.row
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(DetailViewController) {
            let detailViewController: DetailViewController = segue.destinationViewController as! DetailViewController
            
            detailViewController.prepareForDetail(BFKitArray[sender!.tag!])
        }
    }
}