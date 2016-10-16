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
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
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
    
    func createSlider(pos : CGPoint) -> UISlider
    {
        let slider = UISlider(frame:CGRectMake(pos.x, pos.y, 200, 30))
        
        // 色を設定
        slider.tintColor = .redColor()
        
        // 識別用のタグを設定
        slider.tag = 2
        
        // スライダーの最大値
        slider.maximumValue = 100
        
        // 値変更の通知タイミング(true: スライド中も通知 / false:スライド中は通知しない)
        slider.continuous = false
        
        // 値が変更された時のイベントを設定
        slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), forControlEvents: .ValueChanged)
        
        return slider
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider2 = createSlider(CGPointMake( 100, 150))
        view.addSubview(slider2!)
        
    }
}
