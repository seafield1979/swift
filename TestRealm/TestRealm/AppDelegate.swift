//
//  AppDelegate.swift
//  TestRealm
//
//  Created by Shusuke Unno on 2017/07/18.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.main.bounds)
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        
        InitSystem()
        
        return true
    }
    
    func InitSystem() {
        let realm = try! Realm()
        TestDataDao.setRealm(realm)
    }
}

