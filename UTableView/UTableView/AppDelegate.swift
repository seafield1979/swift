//
//  AppDelegate.swift
//  UTableView
//
//  Created by Shusuke Unno on 2017/07/31.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
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
        let viewController = TopViewController(nibName: "TopViewController", bundle: nil)
        viewController.view.backgroundColor = UIColor.white
        viewController.title = "TableView テスト"
        
        // トップのNavigationControllerを生成
        navigation = UINavigationController(rootViewController: viewController)
        
        window!.rootViewController = navigation
        window!.makeKeyAndVisible();
        return true
    }
}
