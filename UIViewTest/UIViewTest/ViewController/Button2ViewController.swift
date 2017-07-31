//
//  Button2ViewController.swift
//  UIViewTest
//  ソースコードでUIButtonを配置する
//  いろいろな配置を行う
//  Created by Shusuke Unno on 2017/07/22.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class Button2ViewController: UNViewController {

    static let BUTTON_H : CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()

        init4()
    }
    
    // シンプルなボタンを１つ表示
    func init1() {
        let button = UIViewUtil.createSimpleButton(
            x:10, y:100, width: 200, height:50, title: "test1", tagId: 1)
        button.addTarget(self, action: #selector(self.tappedButton(_:)), for:.touchUpInside)
        self.view.addSubview(button)
        
    }
    
    // UIViewUtilを使用してボタンを配置
    func init2() {
        let options : Dictionary<UButtonOptions, AnyObject> =
            [.Title : "test1" as AnyObject,
             .TappedTitle : "tapped" as AnyObject,
             .TextColor : UIColor.black as AnyObject,
             .BGColor : UIColor.white as AnyObject,
             .TappedBGColor : UIColor.blue as AnyObject,
             .CornerRadius : CGFloat(5.0) as AnyObject,
             .FrameWidth : CGFloat(2.0) as AnyObject
        ]
        
        let button = UIViewUtil.createButton(CGPoint(x:10.0, y: 50.0),
                                             tagId : 1,
                                             options : options)
        button.addTarget(self, action: #selector(self.tappedButton(_:)), for:.touchUpInside)
        self.view.addSubview(button)
    }

    // 他のサンプルで使いやすいように大量のボタンを並べる
    func init3() {
        let buttons = UIViewUtil.createButtons(20.0, count: 10, lineCount: 2, text: "hoge", tagId: 1)
        
        for button in buttons {
            button.addTarget(self, action: #selector(self.tappedButton(_:)), for:.touchUpInside)
            self.view.addSubview(button)
        }

    }
    
    // 大量のボタンを並べたUIScrollViewを配置
    func init4() {
        let scrollView = UIViewUtil.createButtonsWithScrollBar(
            parentView: self,
            y : 0, height: 100, count : 10,
            lineCount: 4, text: "test", tagId: 1,
            selector: #selector(self.tappedButton(_:)))
        if scrollView != nil {
            self.view.addSubview(scrollView!)
        }

    }
    

    func tappedButton(_ sender: AnyObject) {
        switch sender.tag {
        case 1:
            print("apple")
        case 2:
            print("mango")
        case 3:
            print("orange")
        case 4:
            print("banana")
        default:
            print("other fruit")
            break
        }
    }
    
    /**
     ボタンを生成する
     - parameter pos: ボタンの位置
     - parameter width: ボタンの幅
     - parameter text: ボタンに表示するテキスト
     - parameter tagId: タグのID(押されたボタンの判定用)
     - returns: 作成したボタン
     */
    func createButton(_ pos : CGPoint, width: CGFloat, text: String,  tagId: Int)
        -> UIButton
    {
        // ボタンを生成
        let button = UIButton()
        
        //表示されるテキスト
        button.setTitle(text, for: UIControlState())
        
        //テキストの色（通常時、ハイライト時(押された時)、無効時(.isEnabled=false))
        button.setTitleColor(UIColor.blue, for: UIControlState())
        button.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        button.setTitleColor(UIColor.gray, for: UIControlState.disabled)
        
        // フォントサイズ
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        
        // テキストのフォント＆サイズ
        let font = UIFont(name:"Helvetica", size: 30.0)
        button.titleLabel?.font = font
        
        //タップ時のテキスト
        button.setTitle("Tapped!", for: .highlighted)
        
        //タップ時の色
        button.setTitleColor(UIColor.red, for: .highlighted)
        
        //サイズ
        button.frame = CGRect(x: pos.x, y: pos.y,
                              width: width,
                              height: Button2ViewController.BUTTON_H)
        
        //タグ番号
        button.tag = tagId
        
        //ボーダー幅
//        button.layer.borderWidth = 1
        
        //ボタンをタップした時に実行するメソッドを指定
        button.addTarget(self,action: #selector(self.tappedButton(_:)), for:.touchUpInside)
    
        return button
    }
    
}
