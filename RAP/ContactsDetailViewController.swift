//
//  ContactsDetailViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/6/13.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class ContactsDetailViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!{
        didSet{
            if let photoData = detailContact?.photo{
                logoImageView?.image = UIImage(data: photoData)
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!{
        didSet{
            if let name = detailContact?.name{
                nameLabel?.text = name
            }
        }
    }
    @IBOutlet weak var mobileLabel: UIButton!{
        didSet{
            if let mobile = detailContact?.mobilePhone{
                self.mobileLabel?.setTitle(mobile, forState: UIControlState.Normal)
            }
        }
    }

    @IBOutlet weak var emailLabel: UIButton!{
        didSet{
            if let email = detailContact?.email{
                self.emailLabel?.setTitle(email, forState: UIControlState.Normal)
            }
        }
    }

    @IBOutlet weak var phoneLabel: UIButton!{
        didSet{
            if let phone = detailContact?.telephone{
                self.phoneLabel?.setTitle(phone, forState: UIControlState.Normal)
            }
        }
    }

    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel?.text = detailContact?.department
        }
    }
    
    var detailContact: Contacts!{
        didSet{
            if let photoData = detailContact?.photo{
                self.logoImageView?.image = UIImage(data: photoData)
            }
            
            self.nameLabel?.text = detailContact?.name
            self.mobileLabel?.setTitle(detailContact?.mobilePhone, forState: UIControlState.Normal)
            self.emailLabel?.setTitle(detailContact?.email, forState: UIControlState.Normal)
            self.phoneLabel?.setTitle(detailContact?.telephone, forState: UIControlState.Normal)
            self.descriptionLabel?.text = detailContact?.department
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDefaultProperty()
        setupInitScreen()
    }
    
    func setupInitScreen(){
        logoImageView.layer.cornerRadius = logoImageView.bounds.width / 2
    }
    
    @IBAction func clickMobile(sender: UIButton) {
        print("clickMobile")
        
        let contact = detailContact
        let phoneNumber = "tel://" + contact.mobilePhone
        UIApplication.sharedApplication().openURL(NSURL(string: phoneNumber)!)
    }
    
    @IBAction func clickEmail(sender: UIButton) {
        print("clickEmail")
        
        let contact = detailContact
        var email = "mailto://"
        if contact.email != nil{
            email += contact.email!
        }
        UIApplication.sharedApplication().openURL(NSURL(string: email)!)
    }
    
    @IBAction func clickPhone(sender: UIButton) {
        
    }
    
    deinit{
        print("ContactsDetailViewController deinit")
    }
    
}
