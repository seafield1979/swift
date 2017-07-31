//
//  TopViewController.swift
//  UTableView
//
//  Created by Shusuke Unno on 2017/07/31.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class TopViewController: UNViewController {

    let titles : [String] = ["シンプル1", "シンプル2", "カスタム1"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // ボタンを配置
        //        y : CGFloat, count : Int,
        //        lineCount: Int, texts: [String], tagId: Int
        
        UIViewUtil.createButtons(
            parentView : self,
            y : 0, count : 3,
            lineCount: 1, texts: titles, tagId: 1,
            selector: #selector(self.tappedButton(_:)))
        
    }
    
    // ボタンが押された時の処理
    func tappedButton(_ sender: AnyObject) {
        switch sender.tag {
        case 1:
            let viewController = ViewControllerTable1(nibName: nil, bundle: nil)
            viewController.view.backgroundColor = UIColor.white
            viewController.title = titles[0]
            self.navigationController?.pushViewController(viewController, animated: true)
            
        case 2:
            print("mango")
        case 3:
            print("orange")
        case 4:
            print("banana")
        default:
            print("other fruit")
            break
        }
    }

}
