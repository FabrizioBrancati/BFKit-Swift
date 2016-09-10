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
        
        let infoButton: UIButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(FoundationViewController.showInfo(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showInfo(_ sender: UIButton) {
        self.performSegue(withIdentifier: InfoViewControllerSegueID, sender: self.navigationItem.rightBarButtonItem)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "By \(BFKIT_AUTHOR) - BFKit v\(BFApp.version) (\(BFApp.build))"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoundationArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) as UITableViewCell!
        
        cell?.textLabel?.text = FoundationArray[(indexPath as NSIndexPath).row]
        cell?.tag = (indexPath as NSIndexPath).row
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is DetailViewController {
            let detailViewController: DetailViewController = segue.destinationViewController as! DetailViewController
            
            detailViewController.prepareForDetail(FoundationArray[sender!.tag!])
        }
    }
}
