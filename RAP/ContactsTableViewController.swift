//
//  ContactsTableViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/6/6.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    var contactItems = [Contacts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupDefaultProperty()
        contactItems = getContactItems()
        
        setupTableView()
    }
    
    func setupTableView(){
        //加入预计高度和自动决定高度参数
        tableView.estimatedRowHeight = 92
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorColor = UIColor.whiteColor()
        tableView.tableFooterView = UIView()
    }
    
    func getContactItems() -> [Contacts]{
        var contactItems = [Contacts]()
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "13987655343", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        
        return contactItems
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactsTableViewCell") as? ContactsTableViewCell
        
        //设置颜色
        cell?.backgroundColor = UIColor.clearColor()
        cell?.nameLabel?.textColor = UIColor.whiteColor()
        cell?.descriptionLabel?.textColor = UIColor.whiteColor()
        //设置分割线顶格
        cell?.layoutMargins = UIEdgeInsetsZero
        cell?.separatorInset = UIEdgeInsetsZero
        //字体
        cell?.nameLabel?.font = UIFont(name: ConstantValue.boldFond, size: 19.0)
        cell?.descriptionLabel?.font = UIFont(name: ConstantValue.lightFont, size: 14.0)
        cell?.nameLabel?.text = contactItems[indexPath.row].name
        cell?.descriptionLabel?.text = contactItems[indexPath.row].department
        
        cell?.selectedBackgroundView = UIView(frame: cell!.frame)
        cell?.selectedBackgroundView!.backgroundColor = UIColor.darkPinkColor()
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 92.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    
}
