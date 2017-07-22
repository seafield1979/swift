//
//  ActionSheetViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ActionSheetViewController: UNViewController, UIActionSheetDelegate {

    @IBAction func action1ButtonTapped(_ sender: AnyObject)
    {
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
    
    @IBAction func action2ButtonTapped(_ sender: AnyObject) {
    }
    @IBAction func action3ButtonTapped(_ sender: AnyObject) {
    }
    @IBAction func action4ButtonTapped(_ sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
