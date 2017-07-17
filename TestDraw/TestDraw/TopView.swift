//
//  TopView.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/07/15.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import Foundation
import UIKit

public class TopView : UIView{
    
    var image1 : UIImage? = nil
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        // タッチ操作を許可する
        self.isUserInteractionEnabled = true
        
        // 背景色を設定
        self.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        
        // 画像読み込み
        image1 = UIImage.init(named: "image/miro.jpg")
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
    override public func draw(_ rect: CGRect) {
        image1?.draw(at: CGPoint(x:0, y:0), blendMode:
            CGBlendMode.sourceAtop, alpha: 0.2)
        image1?.draw(at: CGPoint(x:0, y:300), blendMode: CGBlendMode.sourceAtop, alpha: 0.5)
    }

}
