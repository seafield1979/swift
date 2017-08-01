//
//  TableViewCell2.swift
//  UTableView
//
//  Created by Shusuke Unno on 2017/08/01.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var textView1: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.textView1.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: UITextFieldDelegate
    // テキストフィールドを編集する直前に呼び出される
    // ret: true 処理が進む(キーボードが出てくる)
    //      false 処理が進まない(キーボードが出てこない)
    func textFieldShouldBeginEditing(_ textField : UITextField) -> Bool
    {
        print("textFieldShouldBeginEditing")
        return true
    }
    
    // テキストフィールドの編集が終了する直前に呼び出される
    // ret:
    func textFieldShouldEndEditing(_ textField : UITextField) -> Bool
    {
        print("textFieldShouldEndEditing")
        return true
    }
    
    // テキストフィールドを編集する直後に呼び出される
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        print("textFieldDidBeginEditing")
    }
    
    // テキストフィールドの編集が終了する直後に呼び出される
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        print("textFieldDidEndEditing")
    }
    
    // Returnボタンがタップされた時に呼ばれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
    // クリアボタンがタップされた時に呼ばれる
    // 自動でクリアしたい場合はtrueを返す
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        print("textFieldShouldClear")
        textField.text = ""
        return false
    }
}
