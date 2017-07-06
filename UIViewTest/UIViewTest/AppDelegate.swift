//
//  AppDelegate.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/27.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController : ViewController?
    var gestureViewController : GestureViewController?
    var gestureViewController2 : GestureViewController2?
    var buttonViewController : ButtonViewController?
    var imageViewController : ImageViewController?
    var labelViewController : LabelViewController?
    var progressViewController : ProgressViewController?
    var pageControlViewController : PageControlViewController?
    var pickerViewController : PickerViewController?
    var scrollViewController : ScrollViewController?
    var segmentedViewController : SegmentedViewController?
    var sliderViewController : SliderViewController?
    var switchViewController : SwitchViewController?
    var stepperViewController : StepperViewController?
    var textViewController : TextViewController?
    var webViewController : WebViewController?
    var autoLayoutViewController : AutolayoutViewController?
    var autoLayout2ViewController : Autolayout2ViewController?
    
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.main.bounds)
        
        let viewController = TopTableViewController(nibName: "TopTableViewController", bundle: nil)
        
        let navigationVC = UINavigationController(rootViewController: viewController)
        window!.rootViewController = navigationVC
        
        window!.makeKeyAndVisible();
        return true
    }
}

