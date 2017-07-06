//
//  TableViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2017/07/06.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    private let cellId = "CustomCell"
    var items : [String]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        items = []
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        items = []
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.append("hoge1")
        items.append("hoge2")
        items.append("hoge3")
        
        // セルを表示する準備
//        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)

        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // セルを返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: cellId,for:indexPath ) as! CustomCell
        
        cell.label1?.text = "hoeg"
        
        return cell

    }
    
}
