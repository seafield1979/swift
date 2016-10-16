//
//  SwitchViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {

    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    var switch4 : UISwitch?
    
    @IBOutlet var labels: [UILabel]!
    @IBAction func switchValueChanged(sender: AnyObject)
    {
        if let _switch = sender as? UISwitch {
            labels[_switch.tag - 1].text = _switch.on ? "On" : "Off"
            
        }
    }

    func createSwitch(pos : CGPoint) -> UISwitch
    {
        let _switch = UISwitch(frame: CGRectMake(pos.x,pos.y,100,30))
        
        // Offの時の背景色
        _switch.tintColor = .grayColor()
        
        // Onの時の背景色
        _switch.onTintColor = .blueColor()
        
        // ●の色
        _switch.thumbTintColor = UIColor.hexStr("FFA73F", alpha: 1.0)
        
        // 初期状態(OFF)
        _switch.on = false
        
        // 値が変更された時のイベント追加
        _switch.addTarget(self, action: #selector(self.switchValueChanged(_:)), forControlEvents: .ValueChanged)
        
        return _switch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ラベルのテキストを変更
        for (index,label) in labels.enumerate() {
            label.text = "hoge \(index)"
        }
        
        // switchを追加
        switch4 = createSwitch(CGPointMake(180.0, switch3.frame.origin.y + 50.0))
        switch4!.tag = 4
        self.view.addSubview(switch4!)
        
        let label = UILabel(frame: CGRectMake(switch4!.frame.origin.x + 100, switch4!.frame.origin.y, 100, 30))
        label.text = "hoge"
        labels.append(label)
        self.view.addSubview(label)
        
    }
}
