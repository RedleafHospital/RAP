//
//  LoginModel.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/27.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import Foundation

struct User {
    var userName: String
    var passWord: String
}

class LoginModel: NSObject, LoginDelegate {
    
    func getLocalSavedUser() -> User?{
        return nil
    }
    
    func login(user: User) -> Bool{
        return true
    }
    
    func setLocalUser(user: User){
    
    }
}
