//
//  CustomDrawView.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/07/22.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class CustomDrawView : UIView {
    
    var image1 : UIImage? = nil
    var mode = testMode.drawCircle
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    convenience init(frame: CGRect, mode : testMode) {
        self.init(frame: frame)
        
        self.mode = mode
        
        // タッチ操作を許可する
        self.isUserInteractionEnabled = true
        
        // 背景色を設定
        self.backgroundColor = UIColor(red:1.0, green:0.8, blue:0.8, alpha:1.0)
        
        // 画像読み込み
        image1 = UIImage.init(named: "image/miro.jpg")
        
        // マスクを設定
        self.mask(withRect: CGRect(x:0, y:0, width:frame.size.width, height: frame.size.height))
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
        switch mode {
        case .drawLine:
            drawLine()
            break
        case .drawCircle:
            drawCircle()
            break
        case .drawRect:
            drawRect()
            break
        case .drawPath:
            drawPath()
            break
        case .drawClip:
            drawClip()
            break
        case .drawImage:
            drawImage()
            break
        case .drawText:
            drawText()
            break
        }
    }
    
    // 線を描画
    private func drawLine() {
        UDraw.drawLine(x1: 50.0, y1: 50.0, x2: 100.0, y2: 100.0, lineWidth: 2, color: UIColor.red)
    }
    
    // 円を描画
    private func drawCircle() {
        UDraw.drawCircle(x: 50.0, y: 50.0, radius: 50.0, lineWidth: 2, color: UIColor.red)
        UDraw.drawCircleFill(x: 100.0, y: 150.0, radius: 50.0, color: UIColor.blue)
        UDraw.drawCircleFill(center: CGPoint(x:100.0, y:250.0), radius: 50.0, color: UIColor.green)
    }
    
    // 矩形を描画
    private func drawRect() {
        UDraw.drawRect(rect: CGRect(x:50.0,y:50.0,width:100,height:100), width: 2, color: UIColor.red)
        
        UDraw.drawRectFill(rect:  CGRect(x:50.0,y:100.0,width:100,height:100), color: UIColor.blue)
        
        UDraw.drawRectFill(rect:  CGRect(x:50.0,y:250.0,width:100,height:100), color: UIColor.white, strokeWidth: 2, strokeColor: UIColor.black)
    }
    
    // パスを描画
    private func drawPath() {
        
    }
    private func drawClip() {
        
    }
    private func drawImage() {
        
    }
    private func drawText() {
        
    }
}
