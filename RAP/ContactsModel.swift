//
//  ContactsModel.swift
//  RAP
//
//  Created by 刘颖奥 on 16/6/6.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit


struct Contacts{
    var name: String
    var department: String
    var mobilePhone: String
    var telephone: String?
    var email: String?
    var photo: NSData?
}

class ContactsModel{
    var contactItems = [Contacts]()
    
    func updateAllContacts(){
        print("Update all contacts")
    }
    
    func getAllContacts(){
        //测试代码，后续填入正确的取值逻辑
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: UIImagePNGRepresentation(UIImage(named: "defaultphoto")!)))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
        contactItems.append(Contacts(name: "刘颖奥", department: "信息部", mobilePhone: "18930337826", telephone: "1553", email: "yingao.liu@redleafhospital.com", photo: nil))
    }
    
    deinit{
        print("ContactsModel deinit")
    }
}