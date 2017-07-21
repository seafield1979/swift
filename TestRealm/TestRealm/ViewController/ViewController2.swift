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
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 全てのオブジェクトを表示
    @IBAction func selectAllButtonClicked(_ sender: Any) {
        showAll()
    }
    
    @IBAction func selectByNameButtonClicked(_ sender: Any)
    {
        let name = nameText.text
        
        if name == nil {
            return
        }
        
        let tests = TestDataDao.selectByName(name!)
        if tests != nil {
            var text = String()
            for test in tests! {
                text.append( String(format: "id:%d name:%@ age:%d\n", test.id, test.name ?? "no", test.age))                
            }
            textView.text = text
        } else {
            textView.text = "not found"
        }
    }
    
    // 指定したIDのオブジェクトを表示
    @IBAction func selectOnButtonClicked(_ sender: Any) {
        let idText = idTextField.text
        let id = Int(idText!)!
        
        let test = TestDataDao.selectById(id)
        if test != nil {
            textView.text = String(format: "id:%d name:%@ age:%d\n", test!.id, test!.name ?? "no", test!.age)
        } else {
            textView.text = "not found"
        }
    }
    
    // 複数のIDのオブジェクトを表示
    @IBAction func selectInButtonClicked(_ sender: Any) {
//        showInCase(ids: [1,2])
//        showWithFilter()
//        showMaxAge()
        showMultiInCase()
    }
    
    func showInCase(ids : [Int]) {
        // 全てのオブジェクトを取得
        let tests = TestDataDao.selectNotInCase(ids: [1,3])
        
        var strBuf = String()
        for test in tests {
            strBuf.append(String(format: "id:%d name:%@ age:%d\n", test.id, test.name!, test.age))
        }
        textView.text = strBuf
    }
    
    
    func showMultiInCase() {
        // 全てのオブジェクトを取得
        let tests = TestDataDao.selectMultiInCase()
        
        var strBuf = String()
        for test in tests {
            strBuf.append(String(format: "id:%d name:%@ age:%d\n", test.id, test.name!, test.age))
        }
        textView.text = strBuf
    }
    
    // filterを複数回行うパターン
    func showWithFilter() {
        let tests = TestDataDao.selectWithFilter()
        
        var strBuf = String()
        for test in tests {
            strBuf.append(String(format: "id:%d name:%@ age:%d\n", test.id, test.name!, test.age))
        }
        textView.text = strBuf
    }
    
    // 指定のプロパティの最大値を取得する
    func showMaxAge() {
        let max = TestDataDao.selectMaxAge()
        let min = TestDataDao.selectMinAge()
        
        textView.text = String(format: "max:%d min:%d\n", max, min)
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
