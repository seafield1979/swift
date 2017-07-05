//
//  AlertViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController, UIAlertViewDelegate, UIActionSheetDelegate {

    @IBAction func showButtonTapped(_ sender: AnyObject) {
        if objc_getClass("UIAlertController") != nil {
            //UIAlertController使用
            let ac = UIAlertController(title: "武器や", message: "これを買うかね？", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "買わない", style: .cancel) { (action) -> Void in
                print("Cancel button tapped.")
            }
            
            let okAction = UIAlertAction(title: "買う", style: .default) { (action) -> Void in
                print("OK button tapped.")
            }
            
            ac.addAction(cancelAction)
            ac.addAction(okAction)
            
            present(ac, animated: true, completion: nil)
            
        } else {
            //UIAlertView使用
            let av = UIAlertView(title: "Title", message:"Message", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
            av.show()
        }
    }
    
    
    @IBAction func actionSheetButtonTapped(_ sender: AnyObject) {
        if objc_getClass("UIAlertController") != nil {
            // iOS8以降
            //UIAlertController使用
            let ac = UIAlertController(title: "どうする？", message: "明日どうするか選択すべし", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "いいえ", style: .cancel) { (action) -> Void in
                print("Cancel button tapped.")
            }
            
            let restAction = UIAlertAction(title: "休む", style: .default) { (action) -> Void in
                print("OK1 button tapped.")
            }
            
            let workAction = UIAlertAction(title: "働く", style: .default) { (action) -> Void in
                print("OK2 button tapped.")
            }
            
            let playAction = UIAlertAction(title: "遊ぶ", style: .default) { (action) -> Void in
                print("OK3 button tapped.")
            }
            
            ac.addAction(cancelAction)
            ac.addAction(restAction)
            ac.addAction(workAction)
            ac.addAction(playAction)
            
            present(ac, animated: true, completion: nil)
        }
        else {
            // iOS7以前
            // UIActionSheetを使用する
            let sheet: UIActionSheet = UIActionSheet()
            let title: String = "Please choose a plan"
            sheet.title  = title
            sheet.delegate = self
            sheet.addButton(withTitle: "Cancel")
            sheet.addButton(withTitle: "A plan")
            sheet.addButton(withTitle: "B plan")
            sheet.addButton(withTitle: "C plan")
            
            // キャンセルボタンのindexを指定
            sheet.cancelButtonIndex = 0
            
            // UIActionSheet表示
            sheet.show(in: self.view)
        }
    }
    
    // MARK: UIAlertViewDelegate
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            //Canceled
            print("cancel")
        } else {
            //OK
            print("OK")
        }
    }
    
    // MARK: UIActionSheetDelegate
    // ポップアップのボタンが押されたときの処理
    func actionSheet(_ sheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        print("index %d %@", buttonIndex, sheet.buttonTitle(at: buttonIndex))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
