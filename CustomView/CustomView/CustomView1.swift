//
//  CustomView1.swift
//  CustomView
//
//  Created by Shusuke Unno on 2017/07/06.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit

class CustomView : UIView {
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        // タッチ操作を許可する
        self.isUserInteractionEnabled = true
        
        // 背景色を設定
        self.backgroundColor = UIColor(red:0.5, green:0.5, blue:0.5, alpha:1.0)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     描画処理
     - parameter rect: 再描画領域の矩形
     - throws: none
     - returns: none
     */
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 100, y: 100))
        path.lineWidth = 5.0 // 線の太さ
        UIColor.brown.setStroke() // 色をセット
        path.stroke()
    }
    
    /**
     タッチ開始 このViewをタッチしたときの処理
     - parameter touches: タッチ情報
     - parameter event:
     - throws: none
     - returns: none
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print("touchesBegan")
        // タッチイベントを取得する
        let touch = touches.first
        
        // タップした座標を取得する
        let tapLocation = touch!.location(in: self)
        
        print("touchPos:" + tapLocation.debugDescription)
    }
    
    /**
     タッチ中の移動
     - parameter touches: タッチ情報
     - throws: none
     - returns: none
     */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print("touchesMoved:");
        // タッチイベントを取得する
        let touch = touches.first
        
        // タップした座標を取得する
        let tapLocation = touch!.location(in: self)
        let prevLocation = touch!.previousLocation(in: self)
        
        print("prevPos:" + prevLocation.debugDescription)
        print("touchPos:" + tapLocation.debugDescription)
    }
    
    /**
     タッチ終了 Viewからタッチを離したときの処理
     - parameter touches: タッチ情報
     - parameter event:
     - throws: none
     - returns: none
     */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print("touchesEnded:")
    }
    
    /**
     タッチが外部からキャンセルされたときの処理
     - parameter touched: タッチ情報
     - throws: none
     - returns: none
     */
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print("touchesCancelled")
    }
}
