//
//  TopViewController.swift
//  StorageTest
//
//  Created by Shusuke Unno on 2017/08/01.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class TopViewController: UNViewController {
    let titles : [String] = [
        "userDefault",
        "fileManager",
        "fileManager2",
        "CoreData",
        "AppResource"]
    
    // button id
    private let buttonIdUserDefault = 1
    private let buttonIdFileManager = 2
    private let buttonIdFileManager2 = 3
    private let buttonIdCoreData = 4
    private let buttonIdAppResource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ボタンを配置
        _ = UIViewUtil.createButtons (
            parentView : self,
            y : 0, count : titles.count,
            lineCount: 1, texts: titles, tagId: 1,
            selector: #selector(self.tappedButton(_:)))
    }
    

    // ボタンが押された時の処理
    func tappedButton(_ sender: AnyObject) {
        
        var viewController : UIViewController?
        switch sender.tag {
        case buttonIdUserDefault:
            viewController = UserDefaultViewController(nibName: "UserDefaultViewController", bundle: nil)
            
        case buttonIdFileManager:
            viewController = FileManagerViewController(nibName:"FileManagerViewController", bundle: nil
            )
            
            
        case buttonIdFileManager2:
            viewController = FileManager2ViewController(nibName:"FileManager2ViewController", bundle: nil)
            
        case buttonIdCoreData:
            viewController = MemoStoreViewController(nibName:"MemoStoreViewController", bundle: nil)
        case buttonIdAppResource:
            viewController = ViewControllerResource(nibName:"ViewControllerResource", bundle: nil)
            
        default:
            print("other fruit")
            break
        }
        
        if let vc = viewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}
