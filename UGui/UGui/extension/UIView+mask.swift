//
//  UIView+mask.swift
//  UGui
//  
//  UIViewの拡張
//  矩形のマスクを設定して、そこに描画がされないようにする
//
//  Created by Shusuke Unno on 2017/07/15.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    /**
     矩形でマスクをかける
     - parameter rect: 矩形
     - parameter inverse : 反転フラグ
     */
    public func mask(withRect rect: CGRect, inverse: Bool = false) {
        let path = UIBezierPath(rect: rect)
        let maskLayer = CAShapeLayer()
        
        if inverse {
            path.append(UIBezierPath(rect: self.bounds))
            maskLayer.fillRule = kCAFillRuleEvenOdd
        }
        
        maskLayer.path = path.cgPath
        
        self.layer.mask = maskLayer
    }
    
    /**
     パスでマスクをかける(パスは点でつないだ自由な形を表現出来る）
     - parameter path: パス
     - parameter inverse : 反転フラグ
     */
    func mask(withPath path: UIBezierPath, inverse: Bool = false) {
        let path = path
        let maskLayer = CAShapeLayer()
        
        if inverse {
            path.append(UIBezierPath(rect: self.bounds))
            maskLayer.fillRule = kCAFillRuleEvenOdd
        }
        
        maskLayer.path = path.cgPath
        
        self.layer.mask = maskLayer
    }

    /**
     マスクをクリアする
     */
    func clearMask() {
        self.layer.mask = nil
    }
}
