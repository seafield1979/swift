//
//  ViewController.swift
//  CustomView
//
//  Created by Shusuke Unno on 2017/07/06.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // カスタムViewを追加
        let newView = CustomView()
        newView.frame.size = CGSize(width:100, height:200)
        newView.frame.origin = CGPoint(x:100, y:100)
//        newView.backgroundColor = UIColor.blue
        self.view.addSubview(newView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

