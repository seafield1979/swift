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
 
    enum testMode {
        case vc
        case gesture
        case gesture2
        case button
        case imageView
        case label
        case scrollView
        case progress
        case pageControl
        case picker
        case segmented
        case slider
        case `switch`
        case stepper
        case textField
        case webview
        case autolayout
        case autolayout2
        case alertView
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.main.bounds)
        
        let mode = testMode.imageView
        
        
        // 最初に表示されるViewControllerを生成
        switch (mode) {
        case .alertView:
            let viewController = AlertViewController(nibName: "AlertViewController", bundle: nil)
            window!.rootViewController = viewController
            
        case .autolayout:
            self.autoLayoutViewController = AutolayoutViewController(nibName: "AutolayoutViewController", bundle: nil)
            window!.rootViewController = autoLayoutViewController
        
        case .autolayout2:
            self.autoLayout2ViewController = Autolayout2ViewController()
            window!.rootViewController = autoLayout2ViewController
        
        case .vc:
            self.viewController = ViewController(nibName: "ViewController", bundle: nil)
            
            // Viewの色を変える
            self.viewController!.view.backgroundColor = UIColor.yellow
            window!.rootViewController = viewController
            
        case .gesture:
            self.gestureViewController = GestureViewController(nibName: "GestureViewController", bundle: nil)
            
            // Viewの色を変える
            self.gestureViewController!.view.backgroundColor = UIColor.yellow
            window!.rootViewController = self.gestureViewController
        case .gesture2:
            self.gestureViewController2 = GestureViewController2(nibName: "GestureViewController2", bundle: nil)
            
            // Viewの色を変える
            self.gestureViewController2!.view.backgroundColor = UIColor.yellow
            window!.rootViewController = self.gestureViewController2
            
        case .button:
            self.buttonViewController = ButtonViewController(nibName: "ButtonViewController", bundle: nil)
            
            // Viewの色を変える
            self.buttonViewController!.view.backgroundColor = UIColor.white
            window!.rootViewController = self.buttonViewController
            
        case .imageView:
            self.imageViewController = ImageViewController(nibName: "ImageViewController", bundle: nil)
            // Viewの色を変える
            self.imageViewController!.view.backgroundColor = UIColor.white
            window!.rootViewController = self.imageViewController
            
        case .label:
            self.labelViewController = LabelViewController(nibName: "LabelViewController", bundle: nil)
            window!.rootViewController = self.labelViewController

        case .progress:
            self.progressViewController = ProgressViewController(nibName: "ProgressViewController", bundle: nil)
            window!.rootViewController = self.progressViewController
            
        case .pageControl:
            self.pageControlViewController = PageControlViewController(nibName: "PageControlViewController", bundle: nil)
            window!.rootViewController = self.pageControlViewController
            
        case .picker:
            self.pickerViewController = PickerViewController(nibName: "PickerViewController", bundle: nil)
            window!.rootViewController = self.pickerViewController
            
        case .scrollView:
            self.scrollViewController = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
            window!.rootViewController = self.scrollViewController
            
        case .segmented:
            self.segmentedViewController = SegmentedViewController(nibName: "SegmentedViewController", bundle: nil)
            window!.rootViewController = self.segmentedViewController
            
        case .slider:
            self.sliderViewController = SliderViewController(nibName: "SliderViewController", bundle: nil)
            window!.rootViewController = self.sliderViewController
            
        case .switch:
            self.switchViewController = SwitchViewController(nibName: "SwitchViewController", bundle: nil)
            window!.rootViewController = self.switchViewController
            
        case .stepper:
            self.stepperViewController = StepperViewController(nibName: "StepperViewController", bundle: nil)
            window!.rootViewController = self.stepperViewController
            
        case .textField:
            self.textViewController = TextViewController(nibName: "TextViewController", bundle: nil)
            window!.rootViewController = self.textViewController
            
        case .webview:
            self.webViewController = WebViewController(nibName: "WebViewController", bundle: nil)
            window!.rootViewController = self.webViewController
        }
        
        window!.makeKeyAndVisible();
        return true
    }
}

