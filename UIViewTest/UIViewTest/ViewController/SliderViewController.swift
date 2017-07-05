//
//  SliderViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    var slider2 : UISlider?
    
    @IBAction func sliderValueChanged(_ sender: AnyObject) {
        if let slider = sender as? UISlider {
            if slider.tag == 1 {
                label1.text = slider.value.description
            }
            else {
                label2.text = slider.value.description
            }
            print(slider.value)
        }
    }
    
    func createSlider(_ pos : CGPoint) -> UISlider
    {
        let slider = UISlider(frame:CGRect(x: pos.x, y: pos.y, width: 200, height: 30))
        
        // 色を設定
        slider.tintColor = .red
        
        // 識別用のタグを設定
        slider.tag = 2
        
        // スライダーの最大値
        slider.maximumValue = 100
        
        // 値変更の通知タイミング(true: スライド中も通知 / false:スライド中は通知しない)
        slider.isContinuous = false
        
        // 値が変更された時のイベントを設定
        slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), for: .valueChanged)
        
        return slider
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider2 = createSlider(CGPoint( x: 100, y: 150))
        view.addSubview(slider2!)
        
    }
}
