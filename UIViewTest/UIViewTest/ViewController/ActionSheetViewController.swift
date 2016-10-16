//
//  ActionSheetViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ActionSheetViewController: UIViewController, UIActionSheetDelegate {

    @IBAction func action1ButtonTapped(sender: AnyObject)
    {
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
    
    @IBAction func action2ButtonTapped(sender: AnyObject) {
    }
    @IBAction func action3ButtonTapped(sender: AnyObject) {
    }
    @IBAction func action4ButtonTapped(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
