//
//  AppDelegate.swift
//  iOS11AdapterDemo
//
//  Created by XH-LWR on 2017/9/22.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 1. 创建一个window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        // 2. 设置根视图
        let viewController = ViewController()
        let nav = UINavigationController(rootViewController: viewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
}

