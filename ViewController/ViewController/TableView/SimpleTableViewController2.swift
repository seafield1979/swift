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
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        self.tableView.contentInset.top = statusBarHeight
        
    }

    
    // セクション数を返す
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionNum
    }
    
    // 行数を返す
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < rowNums.count {
            return rowNums[section]
        }
        return 0
    }
    
// MARK: UITableViewDelegate
    // セルの高さを返す
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return cellHeight
    }
    
    // Sectionヘッダーの高さを返す
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }

    // Sectionヘッダーの背景色
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // 背景色
        view.tintColor = .whiteColor()
    }

    // Sectionフッターの高さを返す
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sectionFooterHeight
    }

    // Sectionフッターの背景色
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        // 背景色
        view.tintColor = .whiteColor()
    }
    
    // SectionのViewを返す
    // titleForHeaderInSection等のかのセクション表示系のメソッドより優先される
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let view = UIView(frame: CGRectMake(0,0,self.view.frame.size.width,40))
        view.backgroundColor = .grayColor()
        
        // ラベルを表示する
        let label = UILabel()
        label.frame = CGRectMake( 0,0,100,40)
        let sectionNum = section + 1
        label.text = "セクション \(sectionNum)"
        label.textColor = .orangeColor()
        view.addSubview(label)
        
        return view
    }
    
    // セクションのタイトルを返す
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionNum = section + 1
        return "section \(sectionNum)"
    }

    
    // セルを返す
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        cell.textLabel!.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
        cell.detailTextLabel!.text = "detail"
        return cell
        
    }
}
