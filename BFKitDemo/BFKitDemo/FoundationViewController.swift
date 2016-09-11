//
//  FoundationViewController.swift
//  BFKitDemo
//
//  Created by Fabrizio on 24/06/15.
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//

import UIKit

class FoundationViewController: UITableViewController {
    let CellIdentifier = "FoundationCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let infoButton: UIButton = UIButton(type: .InfoLight)
        infoButton.addTarget(self, action: #selector(FoundationViewController.showInfo(_:)), forControlEvents: .TouchUpInside)
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
        return "By \(BFKIT_AUTHOR) - BFKit v\(BFApp.version) (\(BFApp.build))"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoundationArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = FoundationArray[indexPath.row]
        cell.tag = indexPath.row
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(DetailViewController) {
            let detailViewController: DetailViewController = segue.destinationViewController as! DetailViewController
            
            detailViewController.prepareForDetail(FoundationArray[sender!.tag!])
        }
    }
}
