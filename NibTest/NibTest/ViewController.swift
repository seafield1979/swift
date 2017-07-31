//
//  ViewController.swift
//  NibTest
//      NibファイルのViewを表示する
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: AnyObject) {
        print("hello mate")
    }
    
    /**
        ViewControllerのViewが表示準備されるときに呼ばれる
        ここでViewControllerのViewに表示したいViewの準備を行う。
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MyViewを追加
        loadMyView()
        
        // CustomViewを２つ追加
        loadCustomView()
    }
    
    // MyViewを作成
    func loadMyView() {
        let myView = UINib(nibName: "MyView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        
        let subview1 = myView.subviews[1] as UIView
        
        myView.frame.size = CGSize( width: subview1.frame.size.width, height: subview1.frame.size.height)
        myView.frame.origin = CGPoint(x:100, y:32)
        myView.backgroundColor = .blue
        self.view.addSubview(myView)
    }
    
    // CustomViewを作成
    func loadCustomView()
    {
        // CustomView1
        // ボタンを押した時の処理は追加しない
        let customView = CustomView()
        customView.frame.origin = CGPoint(x: 0,y: 150)
        self.view.addSubview(customView)
        
        // CustomView2
        // テキストとボタンを押した時の処理を追加
        let customView2 = CustomView(frame: CGRect(x: 0,y: 250,width: 0,height: 0))  // サイズは使われないので0
        self.view.addSubview(customView2)
        customView2.label1.text = "カスタムカスタム"
        customView2.button1.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
    }
}

