//
//  TableViewCell.swift
//  UTableView
//     自作のTableViewCell
//  Created by Shusuke Unno on 2017/08/01.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

public protocol TableCellDelegate {
    // セルにあるボタンがクリックされた時に呼ばれるメソッド
    func clicked(_ indexPath : IndexPath)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    
    public var indexPath : IndexPath? = nil
    
    public var delegate : TableCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    // MARK: TableCellDelegate
    
    /**
      ボタンがクリックされたことをdelegate先に通知する
     */
    @IBAction func button1Clicked(_ sender: Any)
    {
        if delegate != nil && indexPath != nil {
            delegate!.clicked(indexPath!)
        }
    }
}
