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
        
        // ステータスバーの高さ取得
        let statusHeight = UIApplication.shared.statusBarFrame.height
        
        // カスタムView追加
        let newView = TopView()
        let screenSize : CGSize = UIScreen.main.bounds.size
        
        newView.frame.size = CGSize(width:screenSize.width,
                                    height:screenSize.height - statusHeight)
        newView.frame.origin = CGPoint(x:0, y:statusHeight)
        self.view.addSubview(newView)
        
        // UILabel
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // メモリがー少なくなったときに何かできることがあればここに処理を書く
    }
}
