//
//  ViewController.swift
//  NibTest
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(sender: AnyObject) {
        print("hello mate")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTemplate()
        loadCustomView()
    }
    
    // MyViewを作成
    func loadTemplate() {
        let myView = UINib(nibName: "MyView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! UIView
        let subview1 = myView.subviews[1] as UIView
        myView.frame.size = CGSizeMake( subview1.frame.size.width, subview1.frame.size.height)
        myView.backgroundColor = .blueColor()
        self.view.addSubview(myView)
    }
    
    // CustomViewを作成
    func loadCustomView()
    {
        let customView = CustomView()
        customView.frame.origin = CGPointMake(0,150)
        self.view.addSubview(customView)
        
        // テキストとボタンを押した時の処理を追加
        let customView2 = CustomView(frame: CGRectMake(0,250,0,0))  // サイズは使われないので0
        self.view.addSubview(customView2)
        customView2.label1.text = "hoge"
        customView2.button1.addTarget(self, action: #selector(self.buttonTapped(_:)), forControlEvents: .TouchUpInside)
    }
}

