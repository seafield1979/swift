//
//  AppDelegate.swift
//  ViewController
//
//  Created by B02681 on 2015/09/10.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
// シンプルなUIViewControllerのサンプル

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    enum Mode {
        case ViewController
        case ModalViewController
        case NavigationController
        case SimpleTableView
        case SimpleTableView2
        case TableView
        case EditableTableView
        case TabBar
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        let mode = Mode.ModalViewController

        window = UIWindow(frame:UIScreen.main.bounds);

        switch mode {
        case .ViewController:
            let viewController = ViewController(nibName: "ViewController", bundle: nil)
            window!.rootViewController = viewController
            
        case .ModalViewController:
            let viewController = ViewControllerModal(nibName: "ViewControllerModal", bundle: nil)
            window!.rootViewController = viewController

//            let viewController = ModalViewController1(nibName: "ModalViewController1", bundle: nil)
//            window!.rootViewController = viewController


        case .NavigationController:
            let viewController = ViewController2(nibName: "ViewController2", bundle: nil)
            let navigationController = NavigationController1(rootViewController: viewController)
            window!.rootViewController = navigationController
        case .SimpleTableView:
            let viewController = SimpleTableViewController()
            window!.rootViewController = viewController
            
        case .SimpleTableView2:
            let viewController = SimpleTableViewController2()
            window!.rootViewController = viewController
            
            
        case .TableView:
            let viewController = TableViewController()
            window!.rootViewController = viewController
            
         case .EditableTableView:
            let viewController = EditableTableViewController()
            
            let navigationController = NavigationController1(rootViewController: viewController)
            navigationController.setNavigationBarHidden(false, animated: true)
            
            window!.rootViewController = navigationController
            
        case .TabBar:
            let viewController = MyTabBarController()
            window!.rootViewController = viewController
        }

        window?.makeKeyAndVisible();
        return true
    }
}

