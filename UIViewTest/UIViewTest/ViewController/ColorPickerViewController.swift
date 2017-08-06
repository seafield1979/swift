//
//  ColorPickerViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2017/08/02.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import UIKit

class ColorPickerViewController: UNViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 色選択用のボタンを追加
        let buttons = createButtons(count: 10, width :50, height: 50)
        
        let colors : [UIColor] = [UIColor.white, UIColor.black, UIColor.red, UIColor.blue, UIColor.green, UIColor.brown, UIColor.cyan, UIColor.yellow, UIColor.purple, UIColor.darkGray]
        
        var i : Int = 0
        for button in buttons {
            button.backgroundColor = colors[i]
            button.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
            scrollView.addSubview(button)
            i += 1
        }
        let width = buttons.last!.frame.origin.x + buttons.last!.frame.size.width
        
        scrollView.contentSize.width = width
    }
    
    func buttonTapped(_ button : UIButton) {
        colorView.backgroundColor = button.backgroundColor
    }
    
    private func createButtons(count : Int, width: CGFloat, height : CGFloat) -> [UIButton] {
        var buttons : [UIButton] = []
        
        var x : CGFloat = 0
        let y : CGFloat = 0
        
        for i in 0..<count {
            let button = UIViewUtil.createSimpleButton(
                x:x, y:y, width:width, height: UIViewUtil.BUTTON_H, title: "", tagId: i)
            x += width
            buttons.append(button)
        }
        return buttons
    }
}
