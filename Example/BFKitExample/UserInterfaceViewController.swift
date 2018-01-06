//
//  UserInterfaceViewController.swift
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
    
    @objc func showInfo(_ sender: UIButton) {
        self.performSegue(withIdentifier: InfoViewControllerSegueID, sender: self.navigationItem.rightBarButtonItem)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "By \(BFKitAuthor) - BFKit v\(BFApp.version) (\(BFApp.build))"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailViewController {
            let detailViewController: DetailViewController = segue.destination as! DetailViewController

            detailViewController.prepareForDetail(UIKitArray[(sender! as AnyObject).tag!])
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        smoothlyDeselectRows(tableView: tableView)
    }
}
