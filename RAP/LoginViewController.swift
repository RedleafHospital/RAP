//
//  LoginViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/27.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

protocol LoginDelegate {
    func getLocalSavedUser() -> User?
    func login(user: User) -> Bool
    func setLocalUser(user: User)
}

class LoginViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    private var logined: Bool = false
    private var loginModel = LoginModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    private func setup(){
        //检查本地是否有存储的帐号
        if let user = loginModel.getLocalSavedUser(){
            //如果存在，直接跳转到功能界面
        }else{
            //如果不存在，跳入登录界面
            setupBackgroundColor()
            setupGesture()
        }
    }
    
    private func setupBackgroundColor(){
        self.view.backgroundColor = UIColor.pinkColor()
    }
    
    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tapGesture))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func tapGesture(sender: UITapGestureRecognizer){
        resignAllFieldsFirstResponder()
    }
    
    private func resignAllFieldsFirstResponder(){
        self.userName.resignFirstResponder()
        self.passWord.resignFirstResponder()
    }
    
    @IBAction func userNameDidEnd(sender: UITextField) {
        self.userName.resignFirstResponder()
        self.passWord.becomeFirstResponder()
    }
    
    @IBAction func passWordDidEnd(sender: UITextField) {
        accept()
    }

    @IBAction func accept(sender: UIButton) {
        accept()
    }
    
    private func checkAccountIsNotEmpty() -> Bool{
        if self.userName.text?.isEmpty == true{
            return false
        }
        
        if self.passWord.text?.isEmpty == true{
            return false
        }
        
        return true
    }
    
    private func accept(){
        //去掉键盘
        resignAllFieldsFirstResponder()
        //检查账户名、密码是否为空
        guard checkAccountIsNotEmpty() else { return }
        //登录
        login()
    }
    
    private func login(){
        print("logined")
    }
}
