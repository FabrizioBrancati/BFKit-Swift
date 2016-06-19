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
        
        let infoButton: UIButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(UserInterfaceViewController.showInfo(_:)), for: .touchUpInside)
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
        return "By \(BFKIT_AUTHOR) - BFKit v\(APP_VERSION) (\(APP_BUILD))"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UIKitArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if UIKitArray[(indexPath as NSIndexPath).row] == "UIToolbar" {
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifierSubtitle)!
            
            cell.detailTextLabel?.text = "+ UIBarButtonItem"
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)!
        }
        
        cell.textLabel?.text = UIKitArray[(indexPath as NSIndexPath).row]
        cell.tag = (indexPath as NSIndexPath).row
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is DetailViewController {
            let detailViewController: DetailViewController = segue.destinationViewController as! DetailViewController

            detailViewController.prepareForDetail(UIKitArray[sender!.tag!])
        }
    }
}
