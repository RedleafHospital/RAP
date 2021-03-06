//
//  ContactsTableViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/6/6.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    var contactModel = ContactsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupDefaultProperty()
        contactModel.getAllContacts()
        setupTableView()
    }
    
    func setupTableView(){
        //加入预计高度和自动决定高度参数
        tableView.estimatedRowHeight = 92.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorColor = UIColor.whiteColor()
        tableView.tableFooterView = UIView()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "phone"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ContactsTableViewController.updateContacts))
    }
    
    func updateContacts(){
        contactModel.updateAllContacts()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactModel.contactItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactsTableViewCell") as? ContactsTableViewCell
        
        //设置颜色
        cell?.backgroundColor = UIColor.clearColor()
        cell?.nameLabel?.textColor = UIColor.whiteColor()
        cell?.descriptionLabel?.textColor = UIColor.whiteColor()
        //设置分割线顶格
        cell?.layoutMargins = UIEdgeInsetsZero
        cell?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -200)//UIEdgeInsetsZero
        //字体
        cell?.nameLabel?.font = UIFont(name: ConstantValue.boldFont, size: 19.0)
        cell?.descriptionLabel?.font = UIFont(name: ConstantValue.lightFont, size: 14.0)
        cell?.nameLabel?.text = contactModel.contactItems[indexPath.row].name
        cell?.descriptionLabel?.text = contactModel.contactItems[indexPath.row].department
        
        cell?.selectedBackgroundView = UIView(frame: cell!.frame)
        cell?.selectedBackgroundView!.backgroundColor = UIColor.darkPinkColor()
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard?.instantiateViewControllerWithIdentifier("ContactsDetailViewController") as? ContactsDetailViewController
        
        detailController?.navigationItem.title = contactModel.contactItems[indexPath.row].name
        detailController?.detailContact = contactModel.contactItems[indexPath.row]
        
        self.navigationController?.pushViewController(detailController!, animated: true)
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let phone = UITableViewRowAction(style: .Normal, title: "Call") { action, index in
            print("phone button tapped")
            
            let contact = self.contactModel.contactItems[indexPath.row]
            let phoneNumber = "tel://" + contact.mobilePhone
            UIApplication.sharedApplication().openURL(NSURL(string: phoneNumber)!)
        }
        phone.backgroundColor = UIColor.darkPinkColor()
        
        let email = UITableViewRowAction(style: .Normal, title: "Email") { action, index in
            print("email button tapped")
            
            let contact = self.contactModel.contactItems[indexPath.row]
            var email = "mailto://"
            if contact.email != nil{
                email += contact.email!
            }
            UIApplication.sharedApplication().openURL(NSURL(string: email)!)
        }
        email.backgroundColor = UIColor.darkPinkColor()
        
        return [email, phone]
    }
    
    deinit{
        print("ContactsTableViewController deinit")
    }
}
