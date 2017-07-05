//
//  ViewController.swift
//  Sample01
//
//  Created by Shusuke Unno on 2017/07/05.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let button = sender as? UIButton
        button?.setTitle("hoge", for: UIControlState.normal)
        label1.text = "tapped"
    }

}

