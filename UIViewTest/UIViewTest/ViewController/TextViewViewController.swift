//
//  TextViewViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2017/07/23.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class TextViewViewController: UNViewController, UITextViewDelegate {

    var textView : UITextView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView = createTextView()
        
        if self.textView != nil {
            self.view.addSubview(self.textView!)
            self.textView!.text = "hello world"
        }
    }
    
    func createTextView() -> UITextView {
        let textView = UITextView(frame: self.view.frame)
        textView.delegate = self
        
        // いろいろ設定
        // フォント
        textView.font = UIFont(name:"Helvetica", size: 30.0)
        
        // 背景色
        textView.backgroundColor = UIColor.init(red: 1.0, green: 0.8, blue: 0.8, alpha: 1.0)
        
        // 編集可能(falseだとリードオンリーになる)
        textView.isEditable = true
        
        // テキストの色
        textView.textColor = UIColor.blue
        
        // テキストの水平揃え
        // left,center,right
        textView.textAlignment = NSTextAlignment.left
        
        // 入力時のキーボードを指定する
        // `default`
        // asciiCapable
        // numbersAndPunctuation
        // URL
        // numberPad
        // phonePad
        // namePhonePad
        // emailAddress
        // decimalPad
        // twitter
        // webSearch
        // asciiCapableNumberPad
        textView.keyboardType = UIKeyboardType.asciiCapable
        
        return textView
    }
    

    // MARK:    UITextViewDelegate

    
    /**
     Asks the delegate if editing should begin in the specified text view.
     */
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("編集開始 textViewShouldBeginEditing")
        return true
    }
    
    /**
     Asks the delegate if editing should stop in the specified text view.
     */
    public func textViewShouldEndEditing(_ textView: UITextView) -> Bool
    {
        print("編集終了 textViewShouldEndEditing")
        return true
    }
    
    /**
     Tells the delegate that editing of the specified text view has begun.
     */

    public func textViewDidBeginEditing(_ textView: UITextView)
    {
        print("編集開始2 textViewDidBeginEditing")
    }
    
    /**
     Tells the delegate that editing of the specified text view has ended.
     */
    public func textViewDidEndEditing(_ textView: UITextView)
    {
        print("編集終了2 textViewDidEndEditing")
    }
    
    // 入力に変更があった際に呼び出されるメソッド
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        print("テキスト変更:(shouldChangeTextIn)" + text)
        return true
    }
    
    // テキスト変更された完了
    public func textViewDidChange(_ textView: UITextView)
    {
        print("テキスト変更完了 textViewDidChange")
    }
    
    /**
     編集中のテキストが選択された時、カーソル位置が変更された時に呼ばれる
     これが呼出された時にtextViewのselectedRangeプロパティを取得すると、
     NSRange型の選択範囲の情報が取得できます。
     NSRange型はカーソルの位置（location）と長さ(length)をNSUInteger型で格納する構造体です。
     */
    public func textViewDidChangeSelection(_ textView:  UITextView)
    {
        print("テキスト選択、カーソル移動")
        print("範囲:" + textView.selectedTextRange.debugDescription)
    }
    
    
    

}
