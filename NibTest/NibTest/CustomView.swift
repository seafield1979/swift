//
//  CustomView.swift
//  NibTest
//
//  Created by Shusuke Unno on 2016/09/08.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
/*
    xibでデザインしたViewを表示するクラス
    label1は表示するテキスト
    button1はボタン

 使用例
    生成
     let customView = CustomView()
     customView.frame.origin = CGPointMake(0,100)  //座標を設定
     self.view.addSubview(customView)
 
    ラベルを設定
     customView.label1.text = "hoge"
    
    ボタンが押された時の処理を設定
     customView.button1.addTarget(self, action: #selector(self.buttonTapped(_:)), forControlEvents: .TouchUpInside)
  */

import Foundation
import UIKit

class CustomView : UIView {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    init(title : String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 73))
        self.customViewCommonInit()
    }
    override init(frame : CGRect) {
        // Viewのサイズは固定
        let _frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: 320, height: 73)
        super.init(frame:_frame)
        self.customViewCommonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.customViewCommonInit()
    }
    
    func customViewCommonInit(){
        // これがないと無限ループ
        if self.subviews.count == 0 {
            let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! UIView
//            view.frame = self.bounds
//            view.translatesAutoresizingMaskIntoConstraints = true
//            view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.addSubview(view)
        }
    }


}
