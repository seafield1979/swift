//
//  ViewController.swift
//  ViewController
//
//  Created by B02681 on 2015/09/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
//  NavigationController1にpushされる画面

import UIKit

class ViewController: UIViewController {

    
    func debugButtonTapped(button : UIButton) {
        print("pageNum:" + self.navigationController!.viewControllers.count.description)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // タイトルを変更
        if navigationController != nil {
            self.title = "page " + navigationController!.viewControllers.count.description
        
        
        // タイトルのViewを変更
//        self.navigationItem.titleView = UIImageView(image: UIImage(named: "image/hoge.png"))
        
        // ナビゲーションを透明にする処理
        //self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        //self.navigationController!.navigationBar.shadowImage = UIImage()
        
        // バーの背景色(半透明)
//        self.navigationController!.navigationBar.tintColor = .greenColor()
        
        // バーの背景色(半透明なし)
        self.navigationController!.navigationBar.barTintColor = .green
        
        // ナビゲーションバーのスタイルを変更
        //self.navigationController!.navigationBar.barStyle = UIBarStyle.Default
        
        }
        
        // NavigationBarにボタンを追加
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Debug", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.debugButtonTapped(button:)))
    }
    
// MARK: UIViewControllerの基本メソッド
 
    // 画面が表示される前に呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    // 画面が表示された後に呼ばれる
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
    }
    
    // 画面が閉じる前に呼ばれる
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
    // 画面が閉じた後に呼ばれる
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }
    
    // メモリ不足時に呼ばれる
    override func didReceiveMemoryWarning() {
        
        print("didReceiveMemoryWarning")
    }
    
    // 自動回転前に呼ばれる
//    func shouldAutorotate() -> Bool {
//    
//        return true
//    }
    
//    func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//        //return UIInterfaceOrientationMask.All
//        return UIInterfaceOrientationMask.Portrait
//    }
}

