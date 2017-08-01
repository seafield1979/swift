//
//  ViewControllerTable2.swift
//  UTableView
//      シンプルなTableView
//      いろいろなデリゲートメソッドを実装
//      セルの削除、移動ができる
//  Created by Shusuke Unno on 2017/07/31.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit


class ViewControllerTable2: UNViewController,
    UITableViewDelegate, UITableViewDataSource
{
    
    let sectionNum = 1      // セクションの数
    let rowNum = 30         // セクションの列数
    let cellName = "Cell"
    var tableData1 = [String]()
    var tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        self.tableView = UITableView(frame: CGRect(x:0, y:0, width: width, height: height))
        self.view.addSubview(tableView!)
        
        tableView!.delegate = self
        tableView!.dataSource = self

        // データの初期化
        for i in 0...rowNum - 1 {
            tableData1.append("hoge" + (i+1).description)
        }
        
        // ナビゲーションの右側に編集ボタンを追加
        self.navigationItem.rightBarButtonItem = editButtonItem
    }
    
    
    // MARK: UITableViewDelegate
    /*
     セクションの数を返す(オプションなので定義は必須ではない)
     */
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return sectionNum
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
        return 50
    }
    
    // 指定のセクション(section:)のセルの数を返す
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData1.count
    }
    
    // セルを返す
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellName)
        cell.textLabel?.text = tableData1[indexPath.row]
        
        return cell
    }
    
    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    
    // セルをタップされた時に呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: section=" + indexPath.section.description +
            " row=" + indexPath.row.description + " value=" + tableData1[indexPath.row] )
    }
    
    
    
    
    
    
    
    
    
    
    
    // MARK: 編集モード
    // セルが編集可能かどうか
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        // 全て編集可能
        return true
    }
    
    // セルが削除された時の処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            tableData1.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // 編集ボタンが押された時の処理
    override func setEditing(_ editing: Bool, animated: Bool)
    {
        super.setEditing(editing, animated: animated)
        tableView!.isEditing = editing
    }
    
    // MARK: 並び替えモード
    // セルが並び替え可能かどうか
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        // 全て並び替え可能
        return true
    }
    
    // 並び替え操作の後の処理
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
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
