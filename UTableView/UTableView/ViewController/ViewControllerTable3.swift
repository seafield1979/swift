//
//  ViewControllerTable3.swift
//  UTableView
//    自前のnibをセルに表示するTableView
//  Created by Shusuke Unno on 2017/08/01.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewControllerTable3: UNViewController,
    UITableViewDelegate, UITableViewDataSource, TableCellDelegate
{
    let reuseSection1 = "section1"
    let reuseCell1 = "cell1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let tableView = UITableView(frame: CGRect(x:0, y:0, width: width, height: height))
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // セル用のxibを登録する
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: reuseCell1)
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
    
    // セルを返す(xibから生成した自前のセル)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell1) as! TableViewCell
        
        cell.label1.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
        cell.delegate = self
        cell.indexPath = indexPath
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
            " row=" + indexPath.row.description )
    }
    
    // MARK: TableCellDelegate
    
    // セルにあるボタンがクリックされた時に呼ばれるメソッド
    func clicked(_ indexPath : IndexPath) {
        print("cell button clicked: section=" + indexPath.section.description + " row:" + indexPath.row.description)
    }
    
}
