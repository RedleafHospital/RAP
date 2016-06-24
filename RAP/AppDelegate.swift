//
//  AppDelegate.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/24.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit
import APESuperHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setupHUD()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

private func setupHUD(){
    APESuperHUD.appearance.fontName = ConstantValue.lightFont
    APESuperHUD.appearance.backgroundColor = UIColor.clearColor()
    APESuperHUD.appearance.foregroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
}

extension UIColor{
    public class func darkPinkColor() -> UIColor{
        return UIColor(red: 240 / 255, green: 116 / 255, blue: 117 / 255, alpha: 1)
    }
    
    public class func pinkColor() -> UIColor{
        return UIColor(red: 255 / 255, green: 125 / 255, blue: 125 / 255, alpha: 1)
    }
    
    public class func pink1Color() -> UIColor{
        return UIColor(red: 148 / 255, green: 34 / 255, blue: 81 / 255, alpha: 1)
    }
    
    public class func pink2Color() -> UIColor{
        return UIColor(red: 207 / 255, green: 96 / 255, blue: 98 / 255, alpha: 1)
    }
    
    public class func pink3Color() -> UIColor{
        return UIColor(red: 252 / 255, green: 180 / 255, blue: 158 / 255, alpha: 1)
    }
    
    public class func darkRedColor() -> UIColor{
        return UIColor(red: 190 / 255, green: 72 / 255, blue: 72 / 255, alpha: 1)
    }
    
    public class func moneyRedColor() -> UIColor{
        return UIColor(red: 255 / 255, green: 72 / 255, blue: 72 / 255, alpha: 1)
    }
}

extension UIViewController{
    func setupDefaultProperty(){
        //设置状态栏为白色字
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        self.navigationController?.navigationBar.barStyle = .Black
        //导航栏半透明、底色
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.darkPinkColor()
        //导航栏字体颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: ConstantValue.lightFont, size: 23.0)!]
        //导航栏按钮颜色
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //内容背景颜色
        self.view.backgroundColor = UIColor.pinkColor()
        //后退按钮去掉描述
        self.navigationItem.backBarButtonItem = UIBarButtonItem()
        self.navigationItem.backBarButtonItem?.title = ""
    }
}

struct ConstantValue{
    static let regularFont: String = "OpenSans"
    static let lightFont: String = "OpenSans-Light"
    static let boldFont: String = "OpenSans-ExtraBold"
    static let userInfo: String = "UserInfo"
    static let userName: String = "userName"
    static let passWord: String = "passWord"
}

