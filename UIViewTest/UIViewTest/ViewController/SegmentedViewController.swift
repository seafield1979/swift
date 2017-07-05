//
//  SegmentedViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class SegmentedViewController: UIViewController {

    @IBOutlet weak var segment1: UISegmentedControl!
    var segment2 : UISegmentedControl?
    var segment3 : UISegmentedControl?
    
    @IBOutlet weak var label1: UILabel!
    
    // セグメントが変更された時のイベント
    // .selectedSegmentIndex を直接変更した時は呼ばれない
    @IBAction func segmentedValueChanged(_ sender: AnyObject)
    {
        if let segmented = sender as? UISegmentedControl {
            print(segmented.selectedSegmentIndex)
            label1.text = segmented.selectedSegmentIndex.description
        }
    }
    
    @IBAction func button1Tapped(_ sender: AnyObject) {
        // segment1 の選択状態を変更する
        segment1.selectedSegmentIndex = 1
    }
    
    
    @IBAction func button2Tapped(_ sender: AnyObject) {
        segment2!.selectedSegmentIndex = 1
    }
    
    func createSegmentedControl(_ pos : CGPoint, setItems: [String]) -> UISegmentedControl
    {
        // 表示する項目のリストを渡して生成
        let segmented = UISegmentedControl(items: setItems)
        
        segmented.frame = CGRect(x: pos.x, y: pos.y, width: 200, height: 30)
        
        // 最初に選択されている項目
        segmented.selectedSegmentIndex = 0
        
        // 色(ボタンの枠や文字)
        segmented.tintColor = .red
        
        // 値が変わった時のイベントを登録
        segmented.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: UIControlEvents.valueChanged)
        
        // 外観を自前の画像でカスタマイズしたい場合は以下のサイト
        // UISEGMENTEDCONTROLをオリジナルの外観にしよう
        // https://moto44blog.wordpress.com/2013/01/11/uisegmentedcontrol%E3%82%92%E3%82%AA%E3%83%AA%E3%82%B8%E3%83%8A%E3%83%AB%E3%81%AE%E5%A4%96%E8%A6%B3%E3%81%AB%E3%81%97%E3%82%88%E3%81%86/
        
        return segmented
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segment1.isSelected = true
        
        segment2 = createSegmentedControl(CGPoint(x: 50, y: 150), setItems:["山形", "宮城", "福島"])
        self.view.addSubview(segment2!)
        
        segment3 = createSegmentedControl(CGPoint(x: 50, y: 200), setItems:["火","風","土","水"])
        self.view.addSubview(segment3!)
    }
}
