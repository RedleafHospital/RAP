//
//  LoginViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/27.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit
import APESuperHUD

protocol LoginDelegate {
    func getLocalSavedUser() -> User?
    func login(user: User, success: (() -> Void)?, error: (() -> Void)?)
    func setLocalUser(user: User)
}

class LoginViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    private var loginModel = LoginModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化登录界面
        setupBackgroundColor()
        setupGesture()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loginAndInitFirstScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    private func loginAndInitFirstScreen(){
        //检查本地是否有存储的帐号
        if let user = loginModel.getLocalSavedUser(){
            //如果存在，直接跳转到功能界面
            login(user)
        }else{
            //如果不存在，跳入登录界面
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
    
    private func checkAccountIsNotEmpty() -> User?{
        if self.userName.text?.isEmpty == true{
            APESuperHUD.showOrUpdateHUD(icon: .SadFace, message: "Username is empty!", duration: 0.8, presentingView: self.view, completion: { _ in
                // Completed
            })
            return nil
        }
        
        if self.passWord.text?.isEmpty == true{
            APESuperHUD.showOrUpdateHUD(icon: .SadFace, message: "Password is empty!", duration: 0.8, presentingView: self.view, completion: { _ in
                // Completed
            })
            return nil
        }
        
        return User(userName: self.userName.text!, passWord: self.passWord.text!)
    }
    
    private func accept(){
        //去掉键盘
        resignAllFieldsFirstResponder()
        //检查账户名、密码是否为空
        guard let user = checkAccountIsNotEmpty() else { return }
        //登录
        login(user)
    }
    
    private func login(user: User){
        //处理标志开始
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .Standard, message: "Logining...", presentingView: self.view)

        //登录，并处理成功、失败时的闭包
        loginModel.login(user, success: {
            APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
            self.loginModel.setLocalUser(user)
            self.segueToMainScreen()
        }){
            APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
            APESuperHUD.showOrUpdateHUD(icon: .SadFace, message: "Incorrect username or password!", duration: 0.8, presentingView: self.view, completion: { _ in
                // Completed
                UIView.animateWithDuration(0.5, animations: {
                    self.userName.alpha = 0
                    self.passWord.alpha = 0
                    }, completion: { (_) in
                        UIView.animateWithDuration(0.5, animations: {
                            self.userName.text = user.userName
                            self.passWord.text = ""
                            self.userName.alpha = 1
                            self.passWord.alpha = 1
                        })
                })
            })
        }
    }
    
    private func segueToMainScreen(){
        let mainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainScreenNavigationController")
        mainViewController?.view.backgroundColor = UIColor.whiteColor()
        self.presentViewController(mainViewController!, animated: false, completion: nil)
    }
}
