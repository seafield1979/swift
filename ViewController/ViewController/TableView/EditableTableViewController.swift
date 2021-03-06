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
        self.navigationItem.rightBarButtonItem = editButtonItem
        
        // ナビゲーションの左側にデバッグボタンを追加
        let debugBarButton = UIBarButtonItem(title: "Debug", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.debugButtonTapped(button:)))

        self.navigationItem.leftBarButtonItem = debugBarButton
    }
    
    // MARK: - UITableViewDelegate
    
    // セクション数を返す
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 行数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData1.count
    }
    
    // セルを返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // デフォルトで用意されたセルを返す
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "MyTestCell")
        cell.textLabel!.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
        cell.detailTextLabel!.text = tableData1[indexPath.row]
        
        return cell
        
    }
    
    
    // MARK: - UITableViewDelegate
    
    // セルの高さを返す
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return cellHeight
    }
    
    // セルをタップされた時に呼び出される
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: section=" + indexPath.section.description +
            " row=" + indexPath.row.description + " value=" + tableData1[indexPath.row] )
    }
    
    
    // MARK: 編集モード
    // セルが編集可能かどうか
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool
    {
        // 全て編集可能
        return true
    }

    // セルが削除された時の処理
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableData1.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // 編集ボタンが押された時の処理
    override func setEditing(_ editing: Bool, animated: Bool)
    {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
    // MARK: 並び替えモード
    // セルが並び替え可能かどうか
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // 全て並び替え可能
        return true
    }
    
    // 並び替え操作の後の処理
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {

        // sourceIndexPath データの元の位置
        // destinationIndexPath に移動先の位置
        let targetTitle = tableData1[sourceIndexPath.row]
        if let index = tableData1.index(of: targetTitle) {
            tableData1.remove(at: index)
            tableData1.insert(targetTitle, at: destinationIndexPath.row)
        }
        
        print("\(sourceIndexPath.row) to \(destinationIndexPath.row)")
    }
    
}
