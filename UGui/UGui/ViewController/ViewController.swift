//
//  ViewController.swift
//  UGui
//
//  Created by Shusuke Unno on 2017/07/06.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /**
        Viewのロードが完了まだ画面に表示されていない
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カスタムView追加
        let newView = TopView()
        newView.setViewController(self)
        let screenSize : CGSize = UIScreen.main.bounds.size
        
        newView.frame.size = CGSize(width:screenSize.width,
                                    height:screenSize.height - UUtil.statusBarHeight())
        newView.frame.origin = CGPoint(x:0, y:UUtil.statusBarHeight())
        self.view.addSubview(newView)
    }
}
