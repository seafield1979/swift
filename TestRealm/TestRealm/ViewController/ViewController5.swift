//
//  ViewController5.swift
//  TestRealm
//
//  Created by Shusuke Unno on 2017/07/19.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var idText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAll()
    }
    
    @IBAction func deleteButtonClicked(_ sender: Any)
    {
        let id = Int(idText.text!)
        
        _ = TestDataDao.deleteById(id!)
        
        showAll()
    }
    
    @IBAction func deleteAllButtonClicked(_ sender: Any)
    {
        TestDataDao.deleteAll()
        
        showAll()
    }
    
    func showAll() {
        // 全てのオブジェクトを取得
        let tests = TestDataDao.selectAll()
        
        var strBuf = String()
        for test in tests {
            strBuf.append(String(format: "id:%d name:%@ age:%d\n", test.id, test.name!, test.age))
        }
        textView.text = strBuf
    }

}
