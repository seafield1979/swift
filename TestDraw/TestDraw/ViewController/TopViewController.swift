//
//  TopViewController.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/07/17.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

public enum testMode : String, EnumEnumerable{
    case drawLine = "ライン描画"
    case drawCircle = "円描画"
    case drawRect = "四角形描画"
    case drawPath = "パス描画"
    case drawClip = "クリップ"
    case drawImage = "画像描画"
    case drawText = "テキスト描画"
}


class TopViewController: UITableViewController {
    
    var items : [String]
    let cellIdentifier = "Cell"
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        items = []
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        items = []
        super.init(coder: aDecoder)
        
    }
    
    // View表示前
    // 表示の準備を行う
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for mode in testMode.cases {
            items.append(mode.rawValue)
        }
        
        print(String(testMode.count))
        
        // セルを表示する準備
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Table view data source
    
    // セクションの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 指定のセクションに含まれる絡む数を取得
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // セルを返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        
        cell.textLabel!.text = items[indexPath.row]
        
        return cell
    }
    
    // セルが選択された(タップされた)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("didSelectRowAt:" + String(indexPath.row))
        let mode = testMode.cases[indexPath.row]
        var viewController : UIViewController? = nil
        
        switch mode {
        case .drawLine:
            viewController = Draw1ViewController(nibName: "Draw1ViewController", bundle: nil)
        case .drawCircle:
            viewController = Draw2ViewController(nibName: "Draw2ViewController", bundle: nil)
        case .drawRect:
            viewController = Draw3ViewController(nibName: "Draw3ViewController", bundle: nil)
        case .drawPath:
            viewController = Draw4ViewController(nibName: "Draw4ViewController", bundle: nil)
        case .drawClip:
            viewController = Draw5ViewController(nibName: "Draw5ViewController", bundle: nil)
        case .drawImage:
            viewController = Draw6ViewController(nibName: "Draw6ViewController", bundle: nil)
        case .drawText:
            viewController = Draw7ViewController(nibName: "Draw7ViewController", bundle: nil)
        }
        if let vc = viewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
