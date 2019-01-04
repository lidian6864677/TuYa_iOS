//
//  AppDelegate.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/3.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
#if DEBUG
import CocoaDebug
#endif
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
  
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        #if DEBUG
        CocoaDebug.enable()
        

        #endif
        
        
//        UIApplication.shared.isStatusBarHidden = false
//        UIApplication.shared.statusBarStyle = .lightContent
        
        let tabBar = BaseTabBarViewController()
        self.window?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        self.rootNavigationController.viewControllers = @[self.tabBarVC];
//        self.window.rootViewController = self.rootNavigationController;
        rootNavigationController.viewControllers = [tabBar]
        
        self.window?.rootViewController = rootNavigationController
        /// 启动前准备
//        AMapServices.shared().apiKey = AMapAppKey
//        UIPress.getTopBannerImage() /// 获取首页Banner图片
        Prefs.share.getTopBannerImage()
        
        
        // Override point for customization after application launch.
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    var rootNavigationController: BaseNavgationController = {
        let rootNavigationController = BaseNavgationController()
        rootNavigationController.setNavigationBarHidden(true, animated: true)
        return rootNavigationController;
    }()


}

//normal print
public func print<T>(file: String = #file, function: String = #function, line: Int = #line, _ message: T, color: UIColor = .white) {
    #if DEBUG
    Swift.print("\(Date()) \((file as NSString).lastPathComponent)-\(function) [L:\(line)]:")
    swiftLog(file, function, line, message, color, true)
    #endif
}
