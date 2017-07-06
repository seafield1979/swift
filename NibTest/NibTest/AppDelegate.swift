//
//  AppDelegate.swift
//  NibTest
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.main.bounds);
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        viewController.view.backgroundColor = .green
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

