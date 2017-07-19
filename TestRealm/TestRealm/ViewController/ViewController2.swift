//
//  ViewController2.swift
//  TestRealm
//
//  Created by Shusuke Unno on 2017/07/19.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectAllButtonClicked(_ sender: Any) {
        showAll()
    }
    
    @IBAction func selectOnButtonClicked(_ sender: Any) {
        let idText = idTextField.text
        let id = Int(idText!)!
        
        let test = TestDataDao.selectById(id)
        if test != nil {
            textView.text = String(format: "id:%d name:%@\n", test!.id, test!.name ?? "no")
        } else {
            textView.text = "not found"
        }
    }
    func showAll() {
        // 全てのオブジェクトを取得
        let tests = TestDataDao.selectAll()
        
        var strBuf = String()
        for test in tests {
            strBuf.append(String(format: "id:%d name:%@", test.id, test.name!))
        }
        textView.text = strBuf
    }
}
