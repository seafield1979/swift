//
//  TableViewController.swift
//  ViewController
//
//  Created by Shusuke Unno on 2016/09/03.
//  Copyright © 2016年 B02681. All rights reserved.
//
// UITableViewController
// UITableViewCell
// のサンプル

import UIKit

class TableViewController: UITableViewController {
    
    let rowNum = 30
    let sectionHeight : CGFloat = 40.0
    let sectionFooterHeight : CGFloat  = 40.0
    let rowHeight : CGFloat = 80.0
    
    let reuseSection1 = "section1"
    let reuseCell1 = "cell1"
    
    var tableData1 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...rowNum {
            tableData1.append("hoge\(index)")
        }
        
        // ステータスバーの上にUITableViewが表示されないように位置をずらす
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        self.tableView.contentInset.top = statusBarHeight
        
        
        // セクション用のxibを登録する
        let sectionNib = UINib(nibName: "MyTableViewSection", bundle: nil)
        self.tableView.register(sectionNib, forCellReuseIdentifier: reuseSection1)
        
        // セル用のxibを登録する
        let cellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: reuseCell1)
    }

    // MARK: - UITableViewDataSource
    
    // セクション数を返す
    public override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    // Row数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData1.count
    }
    

    // セクションのタイトルを返す.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionNum = section + 1
        return "section \(sectionNum)"
    }

    // SectionのViewを返す
    // titleForHeaderInSection等のかのセクション表示系のメソッドより優先される
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseSection1) as! MyTableViewSection

        return cell
    }

    // セルを返す(xibから生成した自前のセル)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let mode = 1
        
        switch mode {
        case 1: // 自前のxibから生成したセルを返す
             let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell1) as! MyTableViewCell
            
            cell.label1.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
            cell.label2.text = self.tableData1[indexPath.row]
            return cell
    
        case 2:  // UITableViewCellで生成したセルを返す
            fallthrough
        default:
            let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseCell1)
            cell.textLabel!.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
            cell.detailTextLabel!.text = "detail"
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .gray
            }
            return cell
        }
    }
    
    // MARK: UITableViewDelegate
    // セクションの高さを返す
    // Sectionヘッダーの高さを返す
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeight
    }
    
    // Rowの高さを返す
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return rowHeight
    }
    
    
}
