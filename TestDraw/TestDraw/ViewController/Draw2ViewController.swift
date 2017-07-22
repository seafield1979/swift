//
//  Draw2ViewController.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/07/22.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class Draw2ViewController: UNViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view1 = CustomDrawView(frame: self.view.frame, mode: testMode.drawCircle)
        self.view.addSubview(view1)
    }

}
