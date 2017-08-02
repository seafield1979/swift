//
//  ModalViewController1.swift
//  ViewController
//    モーダルとして表示されるViewController
//  Created by Shusuke Unno on 2017/08/02.
//  Copyright © 2017年 SunSunSoft. All rights reserved.
//

import UIKit

class ModalViewController1: UIViewController {

    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField1: UITextField!
    
    // 呼び出し元のViewControllerから渡されるパラメータ
    public var text1 : String? = nil
    public var text2 : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 呼び出し元から渡された値をTextFieldに設定する
        if text1 != nil {
            textField1.text = text1
        }
        if text2 != nil {
            textField2.text = text2
        }
    }
    @IBAction func doneButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: {
            [presentingViewController] () -> Void in
            // 閉じた時に行いたい処理
            let presentVC = presentingViewController as! ViewControllerModal
            presentVC.textField1.text = self.textField1.text
            presentVC.textField2.text = self.textField2.text
            presentingViewController?.viewWillAppear(true)
        })
    }
}
