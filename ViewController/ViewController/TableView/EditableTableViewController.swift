//
//  EditableTableViewController.swift
//  ViewController
//
//  Created by Shusuke Unno on 2016/09/05.
//  Copyright © 2016年 B02681. All rights reserved.
//

import UIKit

class EditableTableViewController: UITableViewController {
        
    let rowNum = 30
    let cellHeight : CGFloat = 80.0
    
    var tableData1 = [String]()
    
    func debugButtonTapped(button : UIButton) {
        for data in tableData1 {
            print(data)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...rowNum {
            tableData1.append("hoge\(index)")
        }
        
        // ナビゲーションの右側に編集ボタンを追加
        self.navigationItem.rightBarButtonItem = editButtonItem()
        
        // ナビゲーションの左側にデバッグボタンを追加
        let debugBarButton = UIBarButtonItem(title: "Debug", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.debugButtonTapped(_:)))

        self.navigationItem.leftBarButtonItem = debugBarButton
    }
    
    // MARK: - UITableViewDelegate
    
    // セクション数を返す
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // 行数を返す
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData1.count
    }
    
    // セルを返す
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // デフォルトで用意されたセルを返す
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        cell.textLabel!.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
        cell.detailTextLabel!.text = tableData1[indexPath.row]
        
        return cell
        
    }
    
    
    // MARK: - UITableViewDelegate
    
    // セルの高さを返す
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return cellHeight
    }
    
    // セルが削除された時の処理
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        tableData1.removeAtIndex(indexPath.row)
        
        // 削除
        tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: indexPath.row, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
    
    // MARK: 編集モード
    // セルが編集可能かどうか
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // 全て編集可能
        return true
    }
    
    // 編集ボタンが押された時の処理
    override func setEditing(editing: Bool, animated: Bool)
    {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }
    
    // MARK: 並び替えモード
    // セルが並び替え可能かどうか
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // 全て並び替え可能
        return true
    }
    
    // 並び替え操作の後の処理
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        // sourceIndexPath データの元の位置
        // destinationIndexPath に移動先の位置
        let targetTitle = tableData1[sourceIndexPath.row]
        if let index = tableData1.indexOf(targetTitle) {
            tableData1.removeAtIndex(index)
            tableData1.insert(targetTitle, atIndex: destinationIndexPath.row)
        }
        
        print("\(sourceIndexPath.row) to \(destinationIndexPath.row)")
    }
    
}
