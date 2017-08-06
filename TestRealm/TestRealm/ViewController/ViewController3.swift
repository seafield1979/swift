//
//  ViewController3.swift
//  TestRealm
//
//  Created by Shusuke Unno on 2017/07/19.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    @IBOutlet weak var nameText: UITextField!

    @IBOutlet weak var ageText: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAll()
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        let name = nameText.text
        let age = ageText.text
        
        if name != nil && age != nil {
            _ = TestDataDao.addOne(name: name!, age: Int(age!) ?? 0)
        }
        showAll()
    }
    
    func showAll() {
        // 全てのオブジェクトを取得
        let tests = TestDataDao.selectAll(copy : false)
        
        var strBuf = String()
        for test in tests {
            strBuf.append(String(format: "id:%d name:%@ age:%d\n", test.id, test.name!, test.age))
        }
        textView.text = strBuf
    }
}
