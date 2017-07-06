//
//  UserDefaultViewController.swift
//  StorageTest
//
//  Created by Shusuke Unno on 2016/09/06.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
//  NSUserDefaultを使用したデータの保存、読み込み

import UIKit

class UserDefaultViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func test1ButtonTapped(_ sender: AnyObject) {
        setData("hoge", value: "123456789")
        
        
        messageLabel.text = "save hoge=123456789"
    }
    @IBAction func test2ButtonTapped(_ sender: AnyObject) {
        let str : String? = getDataByKey("hoge")
        if let _str = str {
            label1.text = _str
        }
        else {
            label1.text = "none"
        }
        messageLabel.text = "get data key=hoge"
    }
    @IBAction func test3ButtonTapped(_ sender: AnyObject) {
        deleteDataByKey("hoge")
        
        messageLabel.text = "delete data key=hoge"
    }
    @IBAction func test4ButtonTapped(_ sender: AnyObject) {
        showAllData()
        
        messageLabel.text = "show all data"
    }
    
    // key = value のデータを作成 or 更新する
    func setData(_ key : String, value : String) {
        let ud = UserDefaults.standard
        ud.set(value, forKey: key)
        // すぐにシステムに反映(ストレージに保存)
        ud.synchronize()
    }
    
    // keyのデータを読み込む
    func getDataByKey(_ key : String) -> String?
    {
        let ud = UserDefaults.standard
        
        let value : AnyObject! = ud.object(forKey: key) as AnyObject!
        
        return value as? String
    }
    
    // keyのデータをStringで読み込む
    func getStringByKey(_ key : String) -> String?
    {
        let ud = UserDefaults.standard
        
        let value = ud.string(forKey: key)
        
        return value
    }
    
    // keyのデータを削除する
    func deleteDataByKey(_ key : String)
    {
        let ud = UserDefaults.standard
        
        // キーidの値を削除
        ud.removeObject(forKey: key)
    }
    
    // 全てのデータを表示する
    func showAllData() {
        let ud = UserDefaults.standard
        
        // 設定値すべてを取得　※ システムで用意された設定値も出力されます
        let dictionary : NSDictionary =  ud.dictionaryRepresentation() as NSDictionary
//        print(dictionary)
        

        
        let obj = dictionary["AppleKeyboards"]
        if let array1 = obj as? NSArray {
            for value in array1 {
                print(value)
                print(type(of: (value) as AnyObject))
            }
        }
        
        // dictionaryには様々な型のデータが入っている
        for obj in dictionary {
            let value = obj.value
            //print(obj.key.dynamicType)
            
            if value is NSString {
                print((obj.key as AnyObject).description + "(NSString)")
                print("    " + (value as AnyObject).description)
            }
            else if value is NSArray {
                print((obj.key as AnyObject).description + "(NSArray)")
                let objv  = obj.value as? NSArray
                print("{")
                for obj2 in objv! {
                    print("    " + (obj2 as AnyObject).description)
                }
                print("}")
            }
            else if value is Int {
                print((obj.key as AnyObject).description + "(Int)")
                print("    " + (value as AnyObject).description)
            }
            else {
                print(obj.key)
                print(type(of: (obj.value) as AnyObject))
            }
        }
    }
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
