//
//  MainScreenModel.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/31.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import Foundation

struct MainScreenItem{
    var logoImageURL: String
    var logoLabelText: String
    var viewControllerName: String
}

class MainScreenModel{
    var items = [MainScreenItem]()
    
    init(){
        items.append(MainScreenItem(logoImageURL: "chart", logoLabelText: "Outpatient", viewControllerName: "OutpatientReportViewController"))
        items.append(MainScreenItem(logoImageURL: "chat", logoLabelText: "Inpatient", viewControllerName: "InpatientReportViewController"))
        items.append(MainScreenItem(logoImageURL: "friend", logoLabelText: "Contacts", viewControllerName: "ContactsTableViewController"))
        items.append(MainScreenItem(logoImageURL: "setting", logoLabelText: "Revenue", viewControllerName: "testcontroller"))
        items.append(MainScreenItem(logoImageURL: "user", logoLabelText: "user", viewControllerName: "testcontroller"))
        
        items.append(MainScreenItem(logoImageURL: "chart", logoLabelText: "chart", viewControllerName: "testcontroller"))
        items.append(MainScreenItem(logoImageURL: "chat", logoLabelText: "chat", viewControllerName: "testcontroller"))
        items.append(MainScreenItem(logoImageURL: "friend", logoLabelText: "friend", viewControllerName: "testcontroller"))
        items.append(MainScreenItem(logoImageURL: "setting", logoLabelText: "setting", viewControllerName: "testcontroller"))
    }
    
    deinit{
        print("MainScreenModel deinit")
    }
}