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
    
    init(userName: String, passWord: String){
        self.userName = userName
        self.passWord = passWord
    }
}

class LoginModel: NSObject, LoginDelegate {
    
    func login(user: User, success: (() -> Void)?, error: (() -> Void)?){
        let result = true
        
        //远程链接服务器检查账户密码逻辑
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
        var userArray = [String: String]()
        userArray[ConstantValue.userName] = user.userName
        userArray[ConstantValue.passWord] = user.passWord

        NSUserDefaults.standardUserDefaults().removeObjectForKey(ConstantValue.userInfo)
        NSUserDefaults.standardUserDefaults().setObject(userArray, forKey: ConstantValue.userInfo)
    }
    
    func getLocalSavedUser() -> User?{
        if let userArray = NSUserDefaults.standardUserDefaults().objectForKey(ConstantValue.userInfo) as? [String: String]{
            return User(userName: userArray[ConstantValue.userName]!, passWord: userArray[ConstantValue.passWord]!)
        }else{
            return nil
        }
    }
    
    deinit{
        print("LoginModel")
    }
}
