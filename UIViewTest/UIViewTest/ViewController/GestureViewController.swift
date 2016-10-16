//
//  GestureViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/27.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// シンプルなジェスチャー登録
// UIViewオブジェクトをタップしたら色が変わる

import UIKit

class GestureViewController: UIViewController {
    
    var gestureView : UIView?
    var gestureView2 : UIView?
    
    
    // Viewの色を変更するジェスチャー用のメソッド
    func changeViewColor(gestureRecognizer: UITapGestureRecognizer){
        // タップされた view を取得する
        let view : UIView? = gestureRecognizer.view!
        
        // タップviewの色を変える (Red <=> Blue)
        if(view!.backgroundColor  == UIColor.redColor()) {
            view!.backgroundColor = UIColor.blueColor()
        }
        else {
            view!.backgroundColor = UIColor.redColor()
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Viewを追加
        self.gestureView = UIView(frame: CGRect(x:0, y:20, width:100, height:100))
        gestureView!.backgroundColor = UIColor.redColor()
        self.view.addSubview(gestureView!)
        
        self.gestureView2 = UIView(frame: CGRect(x:100, y:20, width:100, height:100))
        gestureView2!.backgroundColor = UIColor.blueColor()
        self.view.addSubview(gestureView2!)

        
        // Viewにタッチイベントを追加
        self.gestureView!.userInteractionEnabled = true
        
        //ジェスチャーを作成
        let recognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeViewColor(_:)));
        
        //ジェスチャーをUIViewオブジェクトに登録する
        self.gestureView!.addGestureRecognizer(recognizer)

        // ２つ目
        let recognizer2 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeViewColor(_:)));
        self.gestureView2!.addGestureRecognizer(recognizer2)
    }
}
