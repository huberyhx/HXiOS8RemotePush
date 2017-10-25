//
//  AppDelegate.swift
//  远程推送通知
//
//  Created by hubery on 2017/10/20.
//  Copyright © 2017年 hubery. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let type = UIUserNotificationType.alert.rawValue | UIUserNotificationType.badge.rawValue
        let set = UIUserNotificationSettings(types: UIUserNotificationType(rawValue : type), categories: nil)
        //注册通知
        UIApplication.shared.registerUserNotificationSettings(set)
        //注册远程通知获取deviceToken
        UIApplication.shared.registerForRemoteNotifications()
        return true
    }
    
    //收到deviceToken
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken as NSData)
    }
    //获取deviceToken失败
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("注册失败")
    }

    //iOS3.0-iOS7.0的方法,基本不用
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print("收到推送")
    }
    
    //iOS7.0以后
    //以下情况 收到通知会走这个方法:
    //在前台
    //在后台
    //完全退出时
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("收到推送")
        completionHandler(UIBackgroundFetchResult.newData)
        
        /**
         App未存活-didReceiveRemoteNotification:fetchCompletionHandler有则执行，无则-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions，其中lanchOptions中UIApplicationLaunchOptionsRemoteNotificationKey

    }
    

}

