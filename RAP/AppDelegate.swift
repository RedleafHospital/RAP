//
//  AppDelegate.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/24.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
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

extension UIColor{
    public class func darkPinkColor() -> UIColor{
        return UIColor(red: 240 / 255, green: 116 / 255, blue: 117 / 255, alpha: 1)
    }
    
    public class func pinkColor() -> UIColor{
        return UIColor(red: 255 / 255, green: 125 / 255, blue: 125 / 255, alpha: 1)
    }
}

extension UIViewController{
    func setupDefaultProperty(){
        //设置状态栏为白色字
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        //导航栏半透明、底色
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.darkPinkColor()
        //导航栏字体颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "OpenSans-Light", size: 23.0)!]
        //导航栏按钮颜色
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //内容背景颜色
        self.view.backgroundColor = UIColor.pinkColor()
    }
}

