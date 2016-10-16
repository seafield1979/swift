//
//  StepperViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class StepperViewController: UIViewController {

    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var label1: UILabel!
    var stepper2 : UIStepper?
    
    @IBAction func stepperValueChanged(sender: AnyObject)
    {
        if let stepper = sender as? UIStepper {
            slider1.value = Float(stepper.value)
            label1.text = stepper.value.description
        }
    }
    @IBAction func sliderValueChanged(sender: AnyObject)
    {
        if let slider = sender as? UISlider {
            stepper1.value = Double(slider.value)
            label1.text = slider.value.description
        }
    }
    
    // コードでUIStepperを作成する
    func createStepper(pos : CGPoint) -> UIStepper
    {
        let stepper = UIStepper(frame: CGRectMake(pos.x, pos.y, 100, 30))
        
        // 最小値
        stepper.minimumValue = 0.0
        // 最大値
        stepper.maximumValue = 100.0
        // 増減幅
        stepper.stepValue = 1.0
        // 現在の値
        stepper.value = 0.0
        // 色
        stepper.tintColor = .redColor()
        // 値変更時のイベント登録
        stepper.addTarget(self, action: #selector(self.stepperValueChanged(_:)), forControlEvents: .ValueChanged)
        
        return stepper
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // スライダーの最小値、最大値をステッパーに合わせる
        slider1.minimumValue = Float(stepper1.minimumValue)
        slider1.maximumValue = Float(stepper1.maximumValue)
        
        slider1.value = Float(stepper1.value)
        
        stepper2 = createStepper(CGPointMake(150, label1.frame.origin.y + 50.0))
        self.view.addSubview(stepper2!)
    }
}
