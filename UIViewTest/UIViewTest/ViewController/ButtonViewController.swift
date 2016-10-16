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
    
    func tappedButton(sender: AnyObject) {
//        if let button = sender as? UIButton {
//            button.selected = !(button.selected)
//        }
        print("button tapped")
    }
    
    func touchDown(button: UIButton?) {
        button!.setTitle("hoge", forState: .Normal)
    }

    // UIColor から UIImageを作成する
    func createImageFromUIColor(color: UIColor) -> UIImage {
        // 1x1のbitmapを作成
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        // bitmapを塗りつぶし
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        // UIImageに変換
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func createButton(pos : CGPoint) -> UIButton {
        let button = UIButton()
        //表示されるテキスト
        button.setTitle("Tap Me!", forState: .Normal)
        
        //テキストの色
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        //タップした状態のテキスト
        button.setTitle("Tapped!", forState: .Highlighted)
        
        //タップした状態の色
        button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        
        //サイズ
        button.frame = CGRectMake(pos.x, pos.y, 300, 50)
        
        //タグ番号
        button.tag = 1
        
        //配置場所
        button.frame.origin = CGPoint(x: pos.x, y: pos.y)
        
        //背景色(通常時、ハイライト時、選択時)
        button.setBackgroundImage(createImageFromUIColor(UIColor.whiteColor()), forState: UIControlState.Normal)
        button.setBackgroundImage(createImageFromUIColor(UIColor.grayColor()), forState: UIControlState.Highlighted)
        button.setBackgroundImage(createImageFromUIColor(UIColor.orangeColor()), forState: UIControlState.Selected)

        //角丸
        button.layer.cornerRadius = 10
        
        //ボーダー幅
        button.layer.borderWidth = 1
        
        //ボタンをタップした時に実行するメソッドを指定
        button.addTarget(self,action: #selector(self.tappedButton(_:)), forControlEvents:.TouchUpInside)
        //button.addTarget(self,action: #selector(self.touchDown(_:)), forControlEvents:.TouchDown)
        
        return button
    }
    
    // シンプルなボタンを作成
    func createButton2(pos : CGPoint, title : String) -> UIButton
    {
        let button = UIButton(frame: CGRectMake(pos.x, pos.y, 100, 30))
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor( UIColor.blackColor(), forState: UIControlState.Normal)
//        button.setTitleColor( UIColor.grayColor(), forState: UIControlState.Highlighted)
        button.addTarget(self,action: #selector(self.tappedButton(_:)), forControlEvents:.TouchUpInside)
        return button
    }
    
    // Typeを指定して作成
    // UIButton(type: UIButtonType.[ボタンのタイプ])
    //      System
    //      DetailDisclosure
    //      InfoLight
    //      InfoDark
    //      ContactAdd
    func createButtonType(pos : CGPoint, type : UIButtonType) -> UIButton
    {
        let button = UIButton(type: type)
        button.frame = CGRectMake(pos.x, pos.y, 50, 50)
        button.addTarget(self,action: #selector(self.tappedButton(_:)), forControlEvents:.TouchUpInside)
        
        return button
    }
    
    // 画像つき
    func createButtonImage(pos: CGPoint, filename : String, filename_hl : String) -> UIButton
    {
        let button = UIButton(frame: CGRectMake(pos.x, pos.y, 100, 50))
        
        button.setBackgroundImage( UIImage(named: filename), forState: .Normal)
        button.setBackgroundImage( UIImage(named: filename_hl), forState: .Highlighted)
        
        button.addTarget(self,action: #selector(self.tappedButton(_:)), forControlEvents:.TouchUpInside)
        return button
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var posY : CGFloat = 100.0
        // ボタンを生成
        self.button1 = createButton(CGPointMake(0.0, posY))
        self.view.addSubview(button1!)
        
        posY += 70.0
        // ボタンを生成
        self.button2 = createButton(CGPointMake(0.0, posY))
        self.view.addSubview(button2!)
        
        posY += 70.0
        // ボタンを生成
        self.button3 = createButton2(CGPointMake(0.0, posY), title : "hoge")
        self.view.addSubview(button3!)
        
        posY += 70.0
        // タイプ指定でボタンを生成
        self.buttonTypes = []
        
        for index in 1...4 {
            let type : UIButtonType
            switch index {
            case 1:
                type = .ContactAdd
            case 2:
                type = .DetailDisclosure
            case 3:
                type = .InfoLight
            case 4:
                fallthrough
            default:
                type = .InfoDark
            }
                
            let button = createButtonType(CGPointMake(CGFloat(index) * 50.0, posY), type:type)
            self.view.addSubview(button)
            self.buttonTypes?.append(button)
        }
        
        posY += 70.0
        // 画像ボタンを生成
        self.buttonImg = createButtonImage(CGPointMake(50.0, posY), filename: "image/hoge.png", filename_hl: "image/hoge_hl.png")
        self.view.addSubview(self.buttonImg!)
    }
}
