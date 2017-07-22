//
//  SwitchViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class SwitchViewController: UNViewController {

    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    var switch4 : UISwitch?
    
    @IBOutlet var labels: [UILabel]!
    @IBAction func switchValueChanged(_ sender: AnyObject)
    {
        if let _switch = sender as? UISwitch {
            labels[_switch.tag - 1].text = _switch.isOn ? "On" : "Off"
            
        }
    }

    func createSwitch(_ pos : CGPoint) -> UISwitch
    {
        let _switch = UISwitch(frame: CGRect(x: pos.x,y: pos.y,width: 100,height: 30))
        
        // Offの時の背景色
        _switch.tintColor = .gray
        
        // Onの時の背景色
        _switch.onTintColor = .blue
        
        // ●の色
        _switch.thumbTintColor = UIColor.hexStr("FFA73F", alpha: 1.0)
        
        // 初期状態(OFF)
        _switch.isOn = false
        
        // 値が変更された時のイベント追加
        _switch.addTarget(self, action: #selector(self.switchValueChanged(_:)), for: .valueChanged)
        
        return _switch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ラベルのテキストを変更
        for (index,label) in labels.enumerated() {
            label.text = "hoge \(index)"
        }
        
        // switchを追加
        switch4 = createSwitch(CGPoint(x: 180.0, y: switch3.frame.origin.y + 50.0))
        switch4!.tag = 4
        self.view.addSubview(switch4!)
        
        let label = UILabel(frame: CGRect(x: switch4!.frame.origin.x + 100, y: switch4!.frame.origin.y, width: 100, height: 30))
        label.text = "hoge"
        labels.append(label)
        self.view.addSubview(label)
        
    }
}
