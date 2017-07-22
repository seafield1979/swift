//
//  UNViewController.swift
//  TestDraw
//    UIViewControllerをカスタマイズしたクラス。
//    UIViewControllerの共通の処理はこのクラスに記述する。
//
//  Created by Shusuke Unno on 2017/07/22.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class UNViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ナビゲーションバーにViewが重ならないようにする
        self.edgesForExtendedLayout = []
    }
}
