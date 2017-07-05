//
//  ViewController.swift
//  MyImageView
//
//  Created by Shusuke Unno on 2016/09/08.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    
    @IBAction func button1Tapped(_ sender: AnyObject) {
        // UIViewからUIImageViewを生成する
        let image1 = view1.getImage()
        let imageView = UIImageView(image: image1)
        imageView.frame.origin = CGPoint(x: 100, y: 250)
        self.view.addSubview(imageView)
    }
    
    @IBAction func button2Tapped(_ button : UIButton) {
        let image1 = view1.getImage()
        
        UIImageWriteToSavedPhotosAlbum(image1, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @IBAction func button3Tapped(_ button : UIButton) {
        
    }

    @IBAction func button4Tapped(_ button : UIButton) {
    }

    /* 保存結果 */
    func image(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer)
    {
        if error != nil {
            /* 失敗 */
            print(error.code)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

