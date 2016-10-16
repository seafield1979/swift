//
//  AppDelegate.swift
//  ViewController
//
//  Created by B02681 on 2015/09/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
// シンプルなUIViewControllerのサンプル

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController1: ViewController?
    var viewController2: ViewController2?
    var navigationController : NavigationController1?
    var simpleTableViewController : SimpleTableViewController?
    var simpleTableViewController2 : SimpleTableViewController2?
    var tableViewController : TableViewController?
    var editableTableVC : EditableTableViewController?
    var tabBarController : MyTabBarController?
    
    enum Mode {
        case ViewController
        case NavigationController
        case SimpleTableView
        case SimpleTableView2
        case TableView
        case EditableTableView
        case TabBar
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        let mode = Mode.TabBar

        window = UIWindow(frame:UIScreen.mainScreen().bounds);

        switch mode {
        case .ViewController:
            viewController1 = ViewController(nibName: "ViewController", bundle: nil)
            window!.rootViewController = viewController1
            
        case .NavigationController:
            viewController1 = ViewController(nibName: "ViewController", bundle: nil)
            navigationController = NavigationController1(rootViewController: viewController1!)
            window!.rootViewController = navigationController
            
        case .TableView:
            tableViewController = TableViewController()
            window!.rootViewController = tableViewController
            
        case .SimpleTableView:
            simpleTableViewController = SimpleTableViewController()
            window!.rootViewController = simpleTableViewController
            
        case .SimpleTableView2:
            simpleTableViewController2 = SimpleTableViewController2()
            window!.rootViewController = simpleTableViewController2
            
        case .EditableTableView:
            editableTableVC = EditableTableViewController()
            
            navigationController = NavigationController1(rootViewController: editableTableVC!)
            navigationController?.setNavigationBarHidden(false, animated: true)
            
            window!.rootViewController = navigationController
            
        case .TabBar:
            tabBarController = MyTabBarController()
            window!.rootViewController = tabBarController
        }

        window?.makeKeyAndVisible();
        return true
    }
}

