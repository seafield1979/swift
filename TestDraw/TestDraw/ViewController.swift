//
//  ViewController.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/07/15.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // ステータスバーの高さ取得
        let statusHeight = UIApplication.shared.statusBarFrame.height
        
        // カスタムView追加
        let newView = TopView()

        let screenSize : CGSize = UIScreen.main.bounds.size
        
        newView.frame.size = CGSize(width:screenSize.width,
                                    height:screenSize.height - statusHeight)
        newView.frame.origin = CGPoint(x:0, y:statusHeight)
        self.view.addSubview(newView)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

