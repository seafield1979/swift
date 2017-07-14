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
        // Do any additional setup after loading the view, typically from a nib.
        let searchButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(ViewController.clickSearchButton))
        let refreshButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: self, action: #selector(ViewController.clickRefreshButton))
        let returnButton = UIBarButtonItem(title: "戻る", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.clickReturnButton))
        
        //ナビゲーションバーの右側にボタン付与
        self.navigationItem.setRightBarButtonItems([searchButton, refreshButton], animated: true)

        self.navigationItem.setLeftBarButton(returnButton, animated: true)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

