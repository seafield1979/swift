//
//  TextViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
//  UITextField のサンプル
//  テキストの処理をカスタマイズしたい場合は、UITextFieldDelegateを自前で処理する


import UIKit

class TextViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var label1: UILabel!
    var textField2 : UITextField?
    
    @IBAction func textChanged(sender: AnyObject)
    {
        if let textField = sender as? UITextField {
            label1.text = textField.text
        }
    }
    
    func createTextField(pos : CGPoint) -> UITextField
    {
        let textField = UITextField(frame: CGRectMake(pos.x, pos.y, 200, 50))
        
        // テキスト
        textField.text = ""
        
        // プレースホルダー（文字が入力されていない時に表示されるテキスト）
        textField.placeholder = "入力するなり"
        
        // キーボードのタイプ
        /*
          .keyboardTypeプロパティに UIKeyboardType の値を設定する
          .Default：デフォルト
          .ASCIICapable：英字
          .NumbersAndPunctuation：数字・記号
          .URL：URL用
          .EmailAddress：Email用
          .NumberPad：テンキー
          .PhonePad：電話番号用
        */
        textField.keyboardType = .Default
        
        // キーボードのReturnキーの表示
        /* .returnKeyTypeプロパティに UIReturnKeyType の値を設定する
         .Default：デフォルト(「return」)
         .Go：「Go」
         .Join：「Join」
         .Next：「Next」
         .Route：「Route」
         .Search：「Search」
         .Send：「Send」
         .Done：「Done」
         .EmergencyCall：「EmergencyCall」
        */
        textField.returnKeyType = .Done
 
        // フォントを設定
        textField.font = UIFont(name:"HiraKakuProN-W3", size:UIFont.labelFontSize())
        
        // テキストの色
        textField.textColor = .blackColor()
        
        // 枠のスタイル　(None, Line, Bezel, RoundedRect)
        textField.borderStyle = .RoundedRect
        
        // テキストの寄せる方向 (Left, Right, Center)
        textField.textAlignment = .Left
        
        // クリアボタン (Never, Always, WhileEditing, UnlessEditing)
        textField.clearButtonMode = .UnlessEditing
        
        // デリゲートを指定（通常ViewControllerで処理するのでself)
        textField.delegate = self
        
        return textField
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField1.delegate = self
        
        // コードで追加
        textField2 = createTextField(CGPointMake(50, 200))
        self.view.addSubview(textField2!)
    }
    
// MARK: UITextFieldDelegate
    // テキストフィールドを編集する直前に呼び出される
    // ret: true 処理が進む(キーボードが出てくる)
    //      false 処理が進まない(キーボードが出てこない)
    func textFieldShouldBeginEditing(textField : UITextField) -> Bool
    {
        print("textFieldShouldBeginEditing")
        return true
    }
    
    // テキストフィールドの編集が終了する直前に呼び出される
    // ret:
    func textFieldShouldEndEditing(textField : UITextField) -> Bool
    {
        print("textFieldShouldEndEditing")
        return true
    }
    
    // テキストフィールドを編集する直後に呼び出される
    func textFieldDidBeginEditing(textField: UITextField)
    {
        print("textFieldDidBeginEditing")
    }
    
    // テキストフィールドの編集が終了する直後に呼び出される
    func textFieldDidEndEditing(textField: UITextField)
    {
        print("textFieldDidEndEditing")
    }
    
    // Returnボタンがタップされた時に呼ばれる
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
    // クリアボタンがタップされた時に呼ばれる
    // 自動でクリアしたい場合はtrueを返す
    func textFieldShouldClear(textField: UITextField) -> Bool
    {
        print("textFieldShouldClear")
        textField.text = ""
        return false
    }    
}
