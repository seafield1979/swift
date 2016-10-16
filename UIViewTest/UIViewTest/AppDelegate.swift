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
        case VC
        case Gesture
        case Gesture2
        case Button
        case ImageView
        case Label
        case ScrollView
        case Progress
        case PageControl
        case Picker
        case Segmented
        case Slider
        case Switch
        case Stepper
        case TextField
        case Webview
        case Autolayout
        case Autolayout2
        case AlertView
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        let mode = testMode.ImageView
        
        
        // 最初に表示されるViewControllerを生成
        switch (mode) {
        case .AlertView:
            let viewController = AlertViewController(nibName: "AlertViewController", bundle: nil)
            window!.rootViewController = viewController
            
        case .Autolayout:
            self.autoLayoutViewController = AutolayoutViewController(nibName: "AutolayoutViewController", bundle: nil)
            window!.rootViewController = autoLayoutViewController
        
        case .Autolayout2:
            self.autoLayout2ViewController = Autolayout2ViewController()
            window!.rootViewController = autoLayout2ViewController
        
        case .VC:
            self.viewController = ViewController(nibName: "ViewController", bundle: nil)
            
            // Viewの色を変える
            self.viewController!.view.backgroundColor = UIColor.yellowColor()
            window!.rootViewController = viewController
            
        case .Gesture:
            self.gestureViewController = GestureViewController(nibName: "GestureViewController", bundle: nil)
            
            // Viewの色を変える
            self.gestureViewController!.view.backgroundColor = UIColor.yellowColor()
            window!.rootViewController = self.gestureViewController
        case .Gesture2:
            self.gestureViewController2 = GestureViewController2(nibName: "GestureViewController2", bundle: nil)
            
            // Viewの色を変える
            self.gestureViewController2!.view.backgroundColor = UIColor.yellowColor()
            window!.rootViewController = self.gestureViewController2
            
        case .Button:
            self.buttonViewController = ButtonViewController(nibName: "ButtonViewController", bundle: nil)
            
            // Viewの色を変える
            self.buttonViewController!.view.backgroundColor = UIColor.whiteColor()
            window!.rootViewController = self.buttonViewController
            
        case .ImageView:
            self.imageViewController = ImageViewController(nibName: "ImageViewController", bundle: nil)
            // Viewの色を変える
            self.imageViewController!.view.backgroundColor = UIColor.whiteColor()
            window!.rootViewController = self.imageViewController
            
        case .Label:
            self.labelViewController = LabelViewController(nibName: "LabelViewController", bundle: nil)
            window!.rootViewController = self.labelViewController

        case .Progress:
            self.progressViewController = ProgressViewController(nibName: "ProgressViewController", bundle: nil)
            window!.rootViewController = self.progressViewController
            
        case .PageControl:
            self.pageControlViewController = PageControlViewController(nibName: "PageControlViewController", bundle: nil)
            window!.rootViewController = self.pageControlViewController
            
        case .Picker:
            self.pickerViewController = PickerViewController(nibName: "PickerViewController", bundle: nil)
            window!.rootViewController = self.pickerViewController
            
        case .ScrollView:
            self.scrollViewController = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
            window!.rootViewController = self.scrollViewController
            
        case .Segmented:
            self.segmentedViewController = SegmentedViewController(nibName: "SegmentedViewController", bundle: nil)
            window!.rootViewController = self.segmentedViewController
            
        case .Slider:
            self.sliderViewController = SliderViewController(nibName: "SliderViewController", bundle: nil)
            window!.rootViewController = self.sliderViewController
            
        case .Switch:
            self.switchViewController = SwitchViewController(nibName: "SwitchViewController", bundle: nil)
            window!.rootViewController = self.switchViewController
            
        case .Stepper:
            self.stepperViewController = StepperViewController(nibName: "StepperViewController", bundle: nil)
            window!.rootViewController = self.stepperViewController
            
        case .TextField:
            self.textViewController = TextViewController(nibName: "TextViewController", bundle: nil)
            window!.rootViewController = self.textViewController
            
        case .Webview:
            self.webViewController = WebViewController(nibName: "WebViewController", bundle: nil)
            window!.rootViewController = self.webViewController
        }
        
        window!.makeKeyAndVisible();
        return true
    }
}

