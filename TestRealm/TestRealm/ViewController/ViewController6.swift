//
//  ViewController6.swift
//  TestRealm
//
//  Created by Shusuke Unno on 2017/07/19.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewController6: UNViewController {
    static let BUTTON_AREA_H : CGFloat = 100.0
    
    static let buttonNames : [String] = ["test1", "test2", "Add Dummy", "Update One", "Delete One", "Delete All"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // テスト用の処理を呼び出すボタン
        let buttons = UIViewUtil.createButtons(
            0,
            count : 2,
            lineCount: 1,
            texts: ViewController6.buttonNames,
            tagId: 1)
        
        for button in buttons {
            button.addTarget(self, action: #selector(self.tappedButton(_:)), for: UIControlEvents.touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    func tappedButton(_ sender: AnyObject) {
        switch sender.tag {
        case 1:
            test1()
        case 2:
            test2()
        case 3:
            test1()
        case 4:
            test1()
        case 5:
            test1()
        case 6:
            test1()
        default:
            break
        }
    }

    // Realm的にダメなパターンをテスト
    func test1() {
        let objs = TestDataDao.selectAll( copy : false )
        if objs.count > 0 {
            // Realmが返したオブジェクトを変更する場合はトランザクションを開始しないといけない
            objs.first!.age = 100   // 落ちる
        }
    }
    
    //
    func test2() {
        let objs = TestDataDao.selectAll(copy: true)
        if objs.count > 0 {
            objs.first!.age = 100   // 落ちる
        }
    }
}
