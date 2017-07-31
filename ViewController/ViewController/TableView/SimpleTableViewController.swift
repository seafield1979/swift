//
//  SimpleTableViewController.swift
//  ViewController
//
//  Created by Shusuke Unno on 2016/09/05.
//  Copyright © 2016年 B02681. All rights reserved.
//
/*
 シンプルなUITableViewController
    セルを３０件表示するだけ
 
 */

import UIKit

class SimpleTableViewController: UITableViewController {
    
    let cellNum = 30
    let cellHeight : CGFloat = 80.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ステータスバーの上にUITableViewが表示されないように位置をずらす
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        self.tableView.contentInset.top = statusBarHeight
    }

    // MARK: - UITableViewDelegate

    // セクション数を返す
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 行数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNum
    }
    
    // セルを返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // デフォルトで用意されたセルを返す
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "MyTestCell")
        cell.textLabel!.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
        cell.detailTextLabel!.text = "detail"
        
        // １つおきに色を変える
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .gray
        }
        return cell

    }
    
    // MARK: - UITableViewDelegate
    
    // セルの高さを返す
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return cellHeight
    }
}
