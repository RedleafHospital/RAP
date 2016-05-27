//
//  LoginViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/27.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundColor()
        setupGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func userNameDidEnd(sender: UITextField) {
        self.userName.resignFirstResponder()
        self.passWord.becomeFirstResponder()
    }
    
    @IBAction func passWordDidEnd(sender: UITextField) {
        self.passWord.resignFirstResponder()
    }
    
    func setupBackgroundColor(){
        self.view.backgroundColor = UIColor.pinkColor()
    }
    
    func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tapGesture))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func tapGesture(sender: UITapGestureRecognizer){
        self.userName.resignFirstResponder()
        self.passWord.resignFirstResponder()
    }

}
