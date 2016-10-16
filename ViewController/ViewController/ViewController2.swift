//
//  ViewController2.swift
//  ViewController
//
//  Created by B02681 on 2015/09/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
//  NavigationController1にpushされる画面

import UIKit

class ViewController2: UIViewController {

    func debugButtonTapped( button : UIButton ) {
        print("pageNum:" + self.navigationController!.viewControllers.count.description)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        self.title = "page " + navigationController!.viewControllers.count.description
        
        // バーの右に普通のボタンを追加
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Debug", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.debugButtonTapped(_:)))
        
        // 画像を元にボタンを作成
//        let barButton = UIBarButtonItem(image: UIImage(named:"image/hoge2.png"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.debugButtonTapped(_:)))
//        self.navigationItem.rightBarButtonItem = barButton
      
        // UIView(とそのサブクラス)を元にボタンを作成
//        let imageView = UIImageView(image: UIImage(named:"image/hoge2.png"))
//        let barButton = UIBarButtonItem(customView: imageView)
//        self.navigationItem.rightBarButtonItem = barButton
        
        // 戻るボタンの背景画像
//        UIBarButtonItem.appearance().setBackButtonBackgroundImage(UIImage(named: "image/check.png"), forState: .Normal, barMetrics: .Default)

        // 戻るボタンの変更
//        let backButtonItem = UIBarButtonItem(title: "< 戻る", style: .Plain, target: nil, action: nil)
//        navigationItem.backBarButtonItem = backButtonItem
        
        // 戻るボタンの背景画像
//        UIBarButtonItem.appearance().setBackButtonBackgroundImage(UIImage(named: "image/check.png"), forState: .Normal, barMetrics: .Default)
    }
    
    /**
     * pushする
     */
    @IBAction func page1ButtonDidTap(sender: AnyObject)
    {
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // topのViewControllerまでpopする
    @IBAction func popToRootButtonTapped(sender: AnyObject) {
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
    
}
