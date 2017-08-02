//
//  ViewControllerModal.swift
//  ViewController
//    モーダルにパラメータを渡して起動するサンプル
//    モーダルからパラメータを受け取るサンプル
//
//  Created by Shusuke Unno on 2017/08/02.
//  Copyright © 2017年 SunSunSoft. All rights reserved.
//

import UIKit

class ViewControllerModal: UNViewController {

    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func button1Clicked(_ sender: Any) {
        let viewController = ModalViewController1(nibName: "ModalViewController1", bundle: nil)
        viewController.text1 = self.textField1.text
        viewController.text2 = self.textField2.text
        present(viewController, animated: true, completion: nil)
    }
    @IBAction func button2Clicked(_ sender: Any) {
    }
    
}
