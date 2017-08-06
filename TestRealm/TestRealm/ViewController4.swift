//
//  ViewController4.swift
//  TestRealm
//  Update系のメソッドテスト
// 
//  Created by Shusuke Unno on 2017/07/19.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        // 更新
        let id = Int(idText.text!)
        let name = nameText.text
        let age = Int(ageText.text!)
        
        if id != nil {
            let ret = TestDataDao.updateOne(id: id!, name: name!, age: age!)
            if ret {
                showAll()
            } else {
                textView.text = "error"
            }
        }
        
        
    }

    func showAll() {
        // 全てのオブジェクトを取得
        let tests = TestDataDao.selectAll( copy : false )
        
        var strBuf = String()
        for test in tests {
            strBuf.append(String(format: "id:%d name:%@ age:%d\n", test.id, test.name!, test.age))
        }
        textView.text = strBuf
    }

}
