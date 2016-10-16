//
//  PageControlViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// UIPageControl のサンプル
// UIPageControl自体はシンプルで複数の選択項目の位置の１つが選択された状態を保持するだけ
// 選択項目が変更された時などに呼ばれるイベントを登録しておいてページの切り替えを実現する


import UIKit

class PageControlViewController: UIViewController {

    @IBOutlet weak var pageCtrl1: UIPageControl!
    
    @IBAction func pageControlChanged(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
