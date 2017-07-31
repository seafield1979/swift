//
//  ViewControllerTable1.swift
//  UTableView
//
//  Created by Shusuke Unno on 2017/07/31.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class ViewControllerTable1: UNViewController,
        UITableViewDelegate, UITableViewDataSource
{

    override func viewDidLoad() {
        super.viewDidLoad()

        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let tableView = UITableView(frame: CGRect(x:0, y:0, width: width, height: height))
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
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
        return 70
    }

}
