//
//  ViewController2.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/07/17.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Viewの中に描画したものが領域をはみ出さないことを確認
        let view1 = SimpleView1(frame: CGRect(x:100,y:100,width:200,height:300))
        self.view.addSubview(view1)
        
        let view2 = SimpleView2(frame: CGRect(x:150,y:150,width:200,height:300))
        view1.addSubview(view2)
        
        let view3 = SimpleView2(frame: CGRect(x:50,y:150,width:200,height:300))
        self.view.addSubview(view3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
