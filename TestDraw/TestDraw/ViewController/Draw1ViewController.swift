//
//  Draw1ViewController.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/07/22.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class Draw1ViewController: UNViewController {

    public var mode : testMode = .drawLine
    
    public var view1 : CustomDrawView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.frame = CGRect(x:0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        view1 = CustomDrawView(frame: self.view.frame, mode: self.mode)
        self.view.addSubview(view1!)
    }

    override func viewDidDisappear(_ animated: Bool) {
        view1!.stopTimer()
    }
}
