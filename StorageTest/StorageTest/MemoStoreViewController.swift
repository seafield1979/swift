//
//  CoreDataViewController.swift
//  StorageTest
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// CoreDataのテスト

import UIKit
import CoreData

class MemoStoreViewController: UNViewController {

    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var memoTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ソフトウェアキーボードを非表示にするボタン
        let hideButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop, target: self, action: #selector(self.hideKeyboard))
        
        //ナビゲーションバーの右側にボタン付与
        self.navigationItem.setRightBarButton(hideButton, animated: true)
    }

    // ソフトウェアキーボードを非表示にする
    func hideKeyboard() {
        textView1.resignFirstResponder()
    }

    
    // 書き込みボタン
    // データを１件追加する
    @IBAction func writeButtonTapped(_ sender: AnyObject) {
        let text = addDataWithMemo(memoTextField.text, name: nameTextField.text)
        textView1.text = text
    }
    
    // 指定の文字列に一致するデータを検索する
    @IBAction func readButtonTapped(_ sender: AnyObject) {
        let text = selectDataWithName(nameTextField.text)
        textView1.text = text
    }
    
    @IBAction func deleteButtonTapped(_ sender: AnyObject) {
        let text = deleteDataWithName(nameTextField.text)
        textView1.text = text
    }
    
    @IBAction func showAllButtonTapped(_ sender: AnyObject) {
        let text = showAllRecords()
        textView1.text = text
    }
    
    @IBAction func updateButtonTapped(_ sender: AnyObject)
    {
        let text = updateDataWithName(nameTextField.text, memoStr : memoTextField.text)
        textView1.text = text
    }
    
    
    
    // MARK: データ操作
    
    // データを１件追加する
    func addDataWithMemo(_ memoText : String?, name : String?) -> String
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let memo = NSEntityDescription.insertNewObject(forEntityName: "MemoStore", into: appDelegate.managedObjectContext) as! MemoStore
        
        if let _name = name {
            memo.name = _name
        }
        else {
            memo.name = "nanashi"
        }
        
        if let _memoText = memoText {
            memo.memo = _memoText
        }
        else {
            memo.memo = ""
        }
        memo.date = Date()
        
        // コミット
        do{
            try appDelegate.managedObjectContext.save()
        }
        catch{
            return "Couldn't add data"
        }
        return "add\n name:\(memo.name!)\n memo:\(memo.memo!)"
    }
    
    // レコードを更新
    func updateDataWithName(_ name : String?, memoStr : String?) -> String
    {
        if let _name = name {
            if nameTextField.text!.characters.count <= 0 {
                return "No name"
            }
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MemoStore")
            // 検索の条件を作成
            
            // = 文字列一致
            let predicate = NSPredicate(format: "name = %@", _name)
            fetchRequest.predicate = predicate
            
            // 検索
            do {
                let results = try appDelegate.managedObjectContext.fetch(fetchRequest) as! [MemoStore]
                if results.count <= 0 {
                    throw NSError(domain: "更新するデータがありませんでした", code: -1, userInfo: nil)
                }
                let updateObj = results[0]
                
                let oldMemo = updateObj.memo
                updateObj.memo = memoStr!
                
                // 保存
                do{
                    try appDelegate.managedObjectContext.save()
                }catch{
                    
                }
                return "update name:\(name)\n memo \(oldMemo) -> \(memoStr!)"
            } catch let error as NSError {
                print(error.domain)
            }
        }
        return "Couldn't update"
    }
    
    // 指定したメモを取得
    func selectDataWithName(_ name : String?) -> String{
        if let _name = name {
            
            if nameTextField.text!.characters.count <= 0 {
                return "couldn't get data"
            }
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MemoStore")
            // 検索の条件を作成
            
            // = 文字列一致
            let predicate = NSPredicate(format: "name = %@", _name)
            
            // LIKE 正規表現
            // 例: hoge* (hoge, hogehoge, hoge123 等にマッチ)
//            let predicate = NSPredicate(format: "name LIKE[c] %@", _name)
            // contains 指定の文字列を含む
            // 例: hoge (umi_hoge, hoge_umi, umi_hoge_umi等にマッチ)
//            let predicate = NSPredicate(format: "name contains[c] %@", _name)
            // beginswith 先頭が指定の文字列
//            let predicate = NSPredicate(format: "name beginswith[c] %@", _name)
            // endswith 末尾が指定の文字列
//            let predicate = NSPredicate(format: "name endswith[c] %@", _name)
            
            
            fetchRequest.predicate = predicate
            
            // 検索
            var text = ""
            do {
                let results = try appDelegate.managedObjectContext.fetch(fetchRequest) as! [MemoStore]
                for memo in results {
                    text += "name:\(memo.name!)\nmemo:\(memo.memo!)\ndate:\(memo.date!)\n\n"
                }
                if text.characters.count > 0 {
                    return text
                }
                else {
                    return "not found!"
                }
            } catch let error as NSError {
                print(error)
            }
        }
        return "couldn't get data"
    }
    
    func deleteDataWithName(_ name : String?) -> String{
        if let _name = name {
            
            if nameTextField.text!.characters.count <= 0 {
                return "No name"
            }
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MemoStore")
            // 検索の条件を作成
            
            // = 文字列一致
            let predicate = NSPredicate(format: "name = %@", _name)
            fetchRequest.predicate = predicate
            
            // 検索
            do {
                let results = try appDelegate.managedObjectContext.fetch(fetchRequest) as! [MemoStore]
                let deleteObj = results[0]
                let deleteName = deleteObj.name
                appDelegate.managedObjectContext.delete(deleteObj)

                // 保存
                do{
                    try appDelegate.managedObjectContext.save()
                }catch{
                    
                }
                return "delete name:\(deleteName)"
            } catch let error as NSError {
                print(error)
            }
        }
        return "Couldn't deleted"
    }
    
    // 全レコード表示
    func showAllRecords() -> String{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MemoStore")
        // 検索の条件を作成
        
        // = 文字列一致
        let predicate = NSPredicate(format: "name LIKE[c] '*'")
//        let predicate = NSPredicate(format: "name LIKE[c] %@", _name)

        fetchRequest.predicate = predicate
        
        // 検索
        do {
            let results = try appDelegate.managedObjectContext.fetch(fetchRequest) as! [MemoStore]
            
            var text = ""
            for memo in results {
                text += "name:\(memo.name!)\nmemo:\(memo.memo!)\ndate:\(memo.date!)\n\n"
            }
            return text
            
        } catch let error as NSError {
            print(error)
        }
        return "not found!"
    }
}
