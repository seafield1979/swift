//
//  AppDelegate.swift
//  MostSimpleView
//
//  Created by Shusuke Unno on 2016/08/25.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// 超シンプルなアプリ
// xibもstoryboardも使わないで、windowに自前で作成したViewControllerをセットしているだけ
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        // 最初に表示されるViewControllerを生成
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.whiteColor()
        
        // なにも表示されないのはあれなので Hello World ラベルを表示
        let label1 : UILabel = UILabel(frame: CGRect(x:50, y:100, width:100, height: 50))
        label1.text = "Hello World!!"
        viewController.view.addSubview(label1)
        
        window!.rootViewController = viewController
        window!.makeKeyAndVisible();
        return true
    }
}

