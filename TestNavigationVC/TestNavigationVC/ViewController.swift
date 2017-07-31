//
//  ViewController.swift
//  TestNavigationVC
//
//  Created by Shusuke Unno on 2017/07/13.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ナビゲーションバーにいろいろ表示
        
        // 右側にアイコン表示
        let searchButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(ViewController.clickSearchButton))

        // 右側にアイコン表示2
        let refreshButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: self, action: #selector(ViewController.clickRefreshButton))
        
        // 左側にアイコン表示
        let returnButton = UIBarButtonItem(title: "戻る", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.clickReturnButton))
        
        //ナビゲーションバーの右側にボタン追加
        self.navigationItem.setRightBarButtonItems([searchButton, refreshButton], animated: true)

        // ナビゲーションバーの左側にボタン追加
//        self.navigationItem.setLeftBarButton(returnButton, animated: true)
    }
    
    func clickSearchButton(){
        //searchButtonを押した際の処理を記述
        self.navigationItem.setRightBarButtonItems(nil, animated: true)
    }
    
    func clickRefreshButton(){
        //refreshButtonを押した際の処理を記述
        self.navigationItem.setRightBarButtonItems(nil, animated: true)
    }
    
    func clickReturnButton() {
        //returnButtonを押した際の処理を記述
        self.navigationItem.setLeftBarButton(nil, animated: true)
    }

    @IBAction func newPaegButtonClicked(_ sender: Any)
    {
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}

