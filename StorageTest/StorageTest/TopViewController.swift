//
//  TopViewController.swift
//  StorageTest
//
//  Created by Shusuke Unno on 2017/08/01.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class TopViewController: UNViewController {
    let titles : [String] = ["userDefault", "fileManager", "CoreData"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ボタンを配置
        _ = UIViewUtil.createButtons (
            parentView : self,
            y : 0, count : 3,
            lineCount: 1, texts: titles, tagId: 1,
            selector: #selector(self.tappedButton(_:)))
        
    }
    

    // ボタンが押された時の処理
    func tappedButton(_ sender: AnyObject) {
        switch sender.tag {
        case 1:
            let viewController = UserDefaultViewController(nibName: "UserDefaultViewController", bundle: nil)
            self.navigationController?.pushViewController(viewController, animated: true)

        case 2:
            let viewController = FileManagerViewController(nibName:"FileManagerViewController", bundle: nil)
            self.navigationController?.pushViewController(viewController, animated: true)

        case 3:
            let viewController = MemoStoreViewController(nibName:"MemoStoreViewController", bundle: nil)
            self.navigationController?.pushViewController(viewController, animated: true)

        case 4:
            print("banana")
        default:
            print("other fruit")
            break
        }
    }

}
