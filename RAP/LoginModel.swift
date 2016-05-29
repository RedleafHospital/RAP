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
//        return User(userName: "Liuyingao", passWord: "ddd")
    }
    
    func login(user: User, success: (() -> Void)?, error: (() -> Void)?){
        let result = false
        
        //远程链接服务器检查账户密码
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)) {
            for i in 0...500000000{}
            
            dispatch_async(dispatch_get_main_queue(), {
                if result == true{
                    success?()
                }else{
                    error?()
                }
                
            })
        }
    }
    
    func setLocalUser(user: User){
    
    }
}
