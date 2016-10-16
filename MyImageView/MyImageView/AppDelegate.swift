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
        case MakeImage
        case DrawImage
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        let mode = TestMode.DrawImage
        switch mode {
        case .MakeImage:
            let viewController = ViewController()
            viewController.view.backgroundColor = .greenColor()
            window!.rootViewController = viewController
            
        case .DrawImage:
            let viewController = CGContextViewController()
            viewController.view.backgroundColor = .greenColor()
            window!.rootViewController = viewController
        }
        
        window!.makeKeyAndVisible()
        
        return true
    }
}

