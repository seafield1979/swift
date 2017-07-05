//
//  ButtonViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/29.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
/*
    UIButtonでできること
        ボタンの文字を変更
        ボタンのデザインを変更（文字の色、背景色、枠の色）
        ボタンを自前の画像に変更（setBackgroundImage)
        ボタンの状態を変更(.enabled, .selected)
        ボタンが押された時の処理(addTarget())
 */

import UIKit

class ButtonViewController: UIViewController {

    var button1 : UIButton?
    var button2 : UIButton?
    var button3 : UIButton?
    var buttonTypes : [UIButton]?
    var buttonImg : UIButton?
    
    func tappedButton(_ sender: AnyObject) {
//        if let button = sender as? UIButton {
//            button.selected = !(button.selected)
//        }
        print("button tapped")
    }
    
    func touchDown(_ button: UIButton?) {
        button!.setTitle("hoge", for: UIControlState())
    }

    // UIColor から UIImageを作成する
    func createImageFromUIColor(_ color: UIColor) -> UIImage {
        // 1x1のbitmapを作成
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        // bitmapを塗りつぶし
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        // UIImageに変換
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func createButton(_ pos : CGPoint) -> UIButton {
        let button = UIButton()
        //表示されるテキスト
        button.setTitle("Tap Me!", for: UIControlState())
        
        //テキストの色
        button.setTitleColor(UIColor.blue, for: UIControlState())
        
        //タップした状態のテキスト
        button.setTitle("Tapped!", for: .highlighted)
        
        //タップした状態の色
        button.setTitleColor(UIColor.red, for: .highlighted)
        
        //サイズ
        button.frame = CGRect(x: pos.x, y: pos.y, width: 300, height: 50)
        
        //タグ番号
        button.tag = 1
        
        //配置場所
        button.frame.origin = CGPoint(x: pos.x, y: pos.y)
        
        //背景色(通常時、ハイライト時、選択時)
        button.setBackgroundImage(createImageFromUIColor(UIColor.white), for: UIControlState())
        button.setBackgroundImage(createImageFromUIColor(UIColor.gray), for: UIControlState.highlighted)
        button.setBackgroundImage(createImageFromUIColor(UIColor.orange), for: UIControlState.selected)

        //角丸
        button.layer.cornerRadius = 10
        
        //ボーダー幅
        button.layer.borderWidth = 1
        
        //ボタンをタップした時に実行するメソッドを指定
        button.addTarget(self,action: #selector(self.tappedButton(_:)), for:.touchUpInside)
        //button.addTarget(self,action: #selector(self.touchDown(_:)), forControlEvents:.TouchDown)
        
        return button
    }
    
    // シンプルなボタンを作成
    func createButton2(_ pos : CGPoint, title : String) -> UIButton
    {
        let button = UIButton(frame: CGRect(x: pos.x, y: pos.y, width: 100, height: 30))
        button.setTitle(title, for: UIControlState())
        button.setTitleColor( UIColor.black, for: UIControlState())
//        button.setTitleColor( UIColor.grayColor(), forState: UIControlState.Highlighted)
        button.addTarget(self,action: #selector(self.tappedButton(_:)), for:.touchUpInside)
        return button
    }
    
    // Typeを指定して作成
    // UIButton(type: UIButtonType.[ボタンのタイプ])
    //      System
    //      DetailDisclosure
    //      InfoLight
    //      InfoDark
    //      ContactAdd
    func createButtonType(_ pos : CGPoint, type : UIButtonType) -> UIButton
    {
        let button = UIButton(type: type)
        button.frame = CGRect(x: pos.x, y: pos.y, width: 50, height: 50)
        button.addTarget(self,action: #selector(self.tappedButton(_:)), for:.touchUpInside)
        
        return button
    }
    
    // 画像つき
    func createButtonImage(_ pos: CGPoint, filename : String, filename_hl : String) -> UIButton
    {
        let button = UIButton(frame: CGRect(x: pos.x, y: pos.y, width: 100, height: 50))
        
        button.setBackgroundImage( UIImage(named: filename), for: UIControlState())
        button.setBackgroundImage( UIImage(named: filename_hl), for: .highlighted)
        
        button.addTarget(self,action: #selector(self.tappedButton(_:)), for:.touchUpInside)
        return button
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var posY : CGFloat = 100.0
        // ボタンを生成
        self.button1 = createButton(CGPoint(x: 0.0, y: posY))
        self.view.addSubview(button1!)
        
        posY += 70.0
        // ボタンを生成
        self.button2 = createButton(CGPoint(x: 0.0, y: posY))
        self.view.addSubview(button2!)
        
        posY += 70.0
        // ボタンを生成
        self.button3 = createButton2(CGPoint(x: 0.0, y: posY), title : "hoge")
        self.view.addSubview(button3!)
        
        posY += 70.0
        // タイプ指定でボタンを生成
        self.buttonTypes = []
        
        for index in 1...4 {
            let type : UIButtonType
            switch index {
            case 1:
                type = .contactAdd
            case 2:
                type = .detailDisclosure
            case 3:
                type = .infoLight
            case 4:
                fallthrough
            default:
                type = .infoDark
            }
                
            let button = createButtonType(CGPoint(x: CGFloat(index) * 50.0, y: posY), type:type)
            self.view.addSubview(button)
            self.buttonTypes?.append(button)
        }
        
        posY += 70.0
        // 画像ボタンを生成
        self.buttonImg = createButtonImage(CGPoint(x: 50.0, y: posY), filename: "image/hoge.png", filename_hl: "image/hoge_hl.png")
        self.view.addSubview(self.buttonImg!)
    }
}
