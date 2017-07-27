//
//  AppDelegate.swift
//  UGui
//
//  Created by Shusuke Unno on 2017/07/06.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigation: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.main.bounds)
        
        // 最初に表示されるViewControllerを生成
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        viewController.view.backgroundColor = UIColor.white
        viewController.title = "hoge"
        
        // トップのNavigationControllerを生成
        navigation = UINavigationController(rootViewController: viewController)
        
        // システム初期化
        initSystem()
        
        UUtil.initialize(navigationC: navigation!)
        
        window!.rootViewController = navigation
        window!.makeKeyAndVisible();
        return true
    }

    func initSystem() {
        NanoTimer.initialize()
        ULog.initialize()
    }
}

