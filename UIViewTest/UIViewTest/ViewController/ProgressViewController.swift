//
//  ProgressViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {

    @IBOutlet weak var progress1: UIProgressView!
    var progress2 : UIProgressView?
    
    @IBAction func button1Tapped(sender: AnyObject) {
        var newProgress = progress1.progress + 0.1
        if newProgress > 1.0 {
            newProgress = 1.0
        }
//        progress1.progress = newProgress
        progress1.setProgress( newProgress, animated: true)
    }
    
    @IBAction func button2Tapped(sender: AnyObject) {
        var newProgress = progress1.progress - 0.1
        if newProgress < 0.0 {
            newProgress = 0.0
        }
//        progress1.progress = newProgress
        progress1.setProgress(newProgress, animated: true)
    }
    
    func test1() {
        // 進捗を設定0.0~1.0
        progress1.progress = 0.7
    }
    
    func createProgress(pos : CGPoint) -> UIProgressView
    {
        // progressViewStyleが.Barだとなぜか表示されない
        let progress = UIProgressView(progressViewStyle: .Default)
        progress.frame = CGRectMake(pos.x, pos.y, 200, 20)
        progress.progressTintColor = UIColor.redColor()
        
        progress.progress = 0.5
        progress.transform = CGAffineTransformMakeScale(1.0, 4.0)
        
        return progress
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test1()
        
        let progress = createProgress(CGPointMake(50,150))
        self.view.addSubview(progress)
        
    }
}
