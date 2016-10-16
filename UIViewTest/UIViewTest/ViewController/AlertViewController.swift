//
//  AlertViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController, UIAlertViewDelegate, UIActionSheetDelegate {

    @IBAction func showButtonTapped(sender: AnyObject) {
        if objc_getClass("UIAlertController") != nil {
            //UIAlertController使用
            let ac = UIAlertController(title: "武器や", message: "これを買うかね？", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "買わない", style: .Cancel) { (action) -> Void in
                print("Cancel button tapped.")
            }
            
            let okAction = UIAlertAction(title: "買う", style: .Default) { (action) -> Void in
                print("OK button tapped.")
            }
            
            ac.addAction(cancelAction)
            ac.addAction(okAction)
            
            presentViewController(ac, animated: true, completion: nil)
            
        } else {
            //UIAlertView使用
            let av = UIAlertView(title: "Title", message:"Message", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
            av.show()
        }
    }
    
    
    @IBAction func actionSheetButtonTapped(sender: AnyObject) {
        if objc_getClass("UIAlertController") != nil {
            // iOS8以降
            //UIAlertController使用
            let ac = UIAlertController(title: "どうする？", message: "明日どうするか選択すべし", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "いいえ", style: .Cancel) { (action) -> Void in
                print("Cancel button tapped.")
            }
            
            let restAction = UIAlertAction(title: "休む", style: .Default) { (action) -> Void in
                print("OK1 button tapped.")
            }
            
            let workAction = UIAlertAction(title: "働く", style: .Default) { (action) -> Void in
                print("OK2 button tapped.")
            }
            
            let playAction = UIAlertAction(title: "遊ぶ", style: .Default) { (action) -> Void in
                print("OK3 button tapped.")
            }
            
            ac.addAction(cancelAction)
            ac.addAction(restAction)
            ac.addAction(workAction)
            ac.addAction(playAction)
            
            presentViewController(ac, animated: true, completion: nil)
        }
        else {
            // iOS7以前
            // UIActionSheetを使用する
            let sheet: UIActionSheet = UIActionSheet()
            let title: String = "Please choose a plan"
            sheet.title  = title
            sheet.delegate = self
            sheet.addButtonWithTitle("Cancel")
            sheet.addButtonWithTitle("A plan")
            sheet.addButtonWithTitle("B plan")
            sheet.addButtonWithTitle("C plan")
            
            // キャンセルボタンのindexを指定
            sheet.cancelButtonIndex = 0
            
            // UIActionSheet表示
            sheet.showInView(self.view)
        }
    }
    
    // MARK: UIAlertViewDelegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
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
    func actionSheet(sheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        print("index %d %@", buttonIndex, sheet.buttonTitleAtIndex(buttonIndex))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
