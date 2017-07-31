//
//  ViewController.swift
//  UTableView
//
//  Created by Shusuke Unno on 2017/07/31.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//
/**
 UITableViewを使用するポイント
 
 ViewControllerに 
     UITableViewDelegate
     UITableViewDataSource
 プロトコルを実装する。
 class ViewController: UIViewController,
    UITableViewDelegate, UITableViewDataSource

 
 ViewControllerに上記のプロトコルのメソッドを実装する
 
 */

import UIKit

class ViewController: UIViewController,
    UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // デリゲートメソッドをこのクラスで実装する
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    // MARK: UITableViewDelegate
    
    
    /*
     セクションの数を返す(オプションなので定義は必須ではない)
     */
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    /*
     セクションのタイトルを返す.
     */
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section"
    }
    
    /**
     セクションセルの高さを返す
     */
    var sectionHeaderHeight: CGFloat {
        return 30
    }
    
    // 指定のセクション(section:)のセルの数を返す
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    // セルを返す
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = "cell" + indexPath.row.description
        return cell
    }
    
    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }

}

