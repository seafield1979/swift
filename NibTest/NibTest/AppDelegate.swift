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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.mainScreen().bounds);
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        viewController.view.backgroundColor = .greenColor()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

