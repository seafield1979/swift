//
//  ViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/27.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UNViewController {

    var view1 : UIView?
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    @IBAction func button1Taped(_ sender: AnyObject) {
        moveView(self.view1)
    }
    
    @IBAction func button2Taped(_ sender: AnyObject) {
        changeSizeView(self.view1)
    }
    
    @IBAction func button3Taped(_ sender: AnyObject) {
        showToggle(self.view1)
    }
    
    @IBAction func button4Taped(_ sender: AnyObject) {
        removeView(self.view1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Viewを追加
        self.view1 = UIView(frame: CGRect(x:0, y:20, width:100, height:100))
        view1!.backgroundColor = UIColor.red
        self.view.addSubview(view1!)
        
        //self.view1!.frame.origin = CGPoint(x:0, y:0)
        
        // Viewのレイヤーの座標を設定する
//        self.view1!.layer.position = CGPoint(x: 100, y: 120)
//        self.view1!.layer.backgroundColor = UIColor.green.cgColor
    
    }
    
    /**
     Viewを移動する
     - parameter view: 移動対象のUIView
     - throws: none
     - returns: none
     */
    func moveView(_ view : UIView?) {
        let frame = view?.frame
 
//        view1?.frame = CGRectMake(frame!.origin.x + 50.0,
//                              frame!.origin.y,
//                              frame!.size.width,
//                              frame!.size.height)
        // レイヤーを使って移動
        let pos = view1?.layer.position
        view1?.layer.position = CGPoint(x: pos!.x+50, y: pos!.y)
    }
    
    func changeSizeView(_ view : UIView?) {
        let frame = view?.frame
        view1?.frame = CGRect(x: frame!.origin.x,
                                    y: frame!.origin.y,
                                    width: frame!.size.width,
                                    height: frame!.size.height + 50.0)
    }
    
    // Viewの表示ON/OFFを切り替える
    func showToggle(_ view : UIView?) {
        if view!.isHidden {
            view!.isHidden = false
            button3.setTitle("show", for:UIControlState())
        }
        else {
            view!.isHidden = true
            button3.setTitle("hide", for:UIControlState())
        }
    }
    
    // Viewを親から削除する
    func removeView(_ view : UIView?) {
        view?.removeFromSuperview()
    }
}
