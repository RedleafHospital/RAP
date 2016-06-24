//
//  SideBarTableViewController.swift
//  SideBar
//
//  Created by 刘颖奥 on 16/5/20.
//  Copyright © 2016年 刘颖奥. All rights reserved.
//

import UIKit

protocol SideBarTableViewContrillerDelegate {
    func sideBarDidSelectRow(index: NSIndexPath)
}

class SideBarTableViewController: UITableViewController {
    var tableData = [String]()
    var delegate: SideBarTableViewContrillerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel?.textColor = UIColor.lightTextColor()
            cell!.textLabel?.font = UIFont(name: ConstantValue.boldFont, size: 17.0)
            
            cell!.selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            cell!.selectedBackgroundView?.backgroundColor = UIColor.darkPinkColor().colorWithAlphaComponent(0.2)
        }
        
        cell?.textLabel?.text = tableData[indexPath.row]

        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.sideBarDidSelectRow(indexPath)
    }
}
