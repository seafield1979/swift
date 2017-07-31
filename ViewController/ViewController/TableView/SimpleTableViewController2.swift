//
//  SimpleTableViewController2.swift
//  ViewController
//
//  Created by Shusuke Unno on 2016/09/05.
//  Copyright © 2016年 B02681. All rights reserved.
//

import UIKit

class SimpleTableViewController2: UITableViewController {
    
    let sectionNum = 5
    let sectionHeaderHeight : CGFloat = 40.0
    let sectionFooterHeight : CGFloat = 40.0
    let rowNums : [Int] = [1,2,3,4,5]
    let cellHeight : CGFloat = 80.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // ステータスバーの上にUITableViewが表示されないように位置をずらす
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        self.tableView.contentInset.top = statusBarHeight
        
    }

    
    // セクション数を返す
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNum
    }
    
    // セル数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section < rowNums.count {
            return rowNums[section]
        }
        return 0
    }
    
// MARK: UITableViewDelegate
    // セルの高さを返す
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return cellHeight
    }
    
    // Sectionヘッダーの高さを返す
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }

    // Sectionヘッダーの背景色
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // 背景色
        view.tintColor = .white
    }

    // Sectionフッターの高さを返す
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sectionFooterHeight
    }

    // Sectionフッターの背景色
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        // 背景色
        view.tintColor = .white
    }
    
    // SectionのViewを返す
    // titleForHeaderInSection等のかのセクション表示系のメソッドより優先される
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let view = UIView(frame: CGRect(x: 0,y: 0,width: self.view.frame.size.width,height: 40))
        view.backgroundColor = .gray
        
        // ラベルを表示する
        let label = UILabel()
        label.frame = CGRect( x: 0, y: 0,width: 100, height: 40)
        let sectionNum = section + 1
        label.text = "セクション \(sectionNum)"
        label.textColor = .orange
        view.addSubview(label)
        
        return view
    }
    
    // セクションのタイトルを返す
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionNum = section + 1
        return "section \(sectionNum)"
    }

    
    // セルを返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "MyTestCell")
        cell.textLabel!.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
        cell.detailTextLabel!.text = "detail"
        return cell
    }
}
