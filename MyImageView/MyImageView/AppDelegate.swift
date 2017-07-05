//
//  AppDelegate.swift
//  MyImageView
//
//  Created by Shusuke Unno on 2016/09/08.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    enum TestMode {
        case makeImage
        case drawImage
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.main.bounds)
        
        let mode = TestMode.drawImage
        switch mode {
        case .makeImage:
            let viewController = ViewController()
            viewController.view.backgroundColor = .green
            window!.rootViewController = viewController
            
        case .drawImage:
            let viewController = CGContextViewController()
            viewController.view.backgroundColor = .green
            window!.rootViewController = viewController
        }
        
        window!.makeKeyAndVisible()
        
        return true
    }
}

