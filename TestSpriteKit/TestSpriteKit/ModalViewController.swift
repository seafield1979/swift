//
//  ModalViewController.swift
//  TestSpriteKit
//
//  Created by Shusuke Unno on 2017/08/08.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closeClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
