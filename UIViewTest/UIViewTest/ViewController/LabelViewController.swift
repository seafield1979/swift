//
//  LabelViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class LabelViewController: UNViewController {

    // シンプルなラベルを作成
    func createLabel(_ pos : CGPoint, title : String) -> UILabel
    {
        let label = UILabel(frame:CGRect(x: pos.x, y: pos.y, width: 100, height: 30))
        label.text = title
        return label
    }
    
    // いろいろ設定したラベルを作成
    func createLabel2(_ pos : CGPoint, title : String) -> UILabel
    {
        let label = UILabel(frame:CGRect(x: pos.x, y: pos.y, width: 200, height: 30))
        label.text = title
        
        // テキスト中央寄せ
        label.textAlignment = NSTextAlignment.center
        
        // テキストの色
        label.textColor = UIColor.blue
        
        // テキストのフォント
        /*
         // システムの標準フォントサイズの文字列をラベルに表示する.
         UIFont.systemFontOfSize(UIFont.systemFontSize())
         
         // UIButton用のフォントサイズの文字列をラベルに表示する.
         UIFont.systemFontOfSize(UIFont.buttonFontSize())
         
         // カスタムしたフォントサイズ(20)の文字列をラベルに表示する.
         UIFont.systemFontOfSize(CGFloat(20))
         
         // Italic System Fontの文字列をラベルに表示する.
         UIFont.italicSystemFontOfSize(UIFont.labelFontSize())
         
         // Boldの文字列をラベルに表示する.
         UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
         
         // Arialの文字列をラベルに表示する.
         UIFont(name:"ArialHebew", size:UIFont.labelFontSize())
        */
        //label.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        label.font = UIFont(name:"HiraKakuProN-W3", size:UIFont.labelFontSize)
        
        // 背景色
        //label.backgroundColor = UIColor.grayColor()
        label.backgroundColor = UIColor(patternImage: UIImage(named: "image/check.png")!)
        
        // 表示文字が表示領域を超えた場合の処理を設定する
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        return label
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let label1 = createLabel(CGPoint(x: 30.0, y: 50.0), title: "hoge")
        self.view.addSubview(label1)
        
        let label2 = createLabel2(CGPoint(x: 30.0, y: 100.0), title: "Superime")
        self.view.addSubview(label2)
        
        let label3 = createLabel2(CGPoint(x: 30.0, y: 150.0), title: "Superime Superime Superime")
        self.view.addSubview(label3)
      
    }
    
    
}
