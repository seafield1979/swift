//
//  TopView.swift
//  UGui
//
//  Created by Shusuke Unno on 2017/07/06.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit

class TopView : UIView {
    
    var vt : ViewTouch = ViewTouch()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        // タッチ操作を許可する
        self.isUserInteractionEnabled = true
        
        // 背景色を設定
        self.backgroundColor = UIColor(red:0.5, green:0.5, blue:0.5, alpha:1.0)
        
        UDrawManager.getInstance().initialize()
        
        let circleView = UCircle(priority: 100, x: 100.0, y: 100.0, width: 50.0, height: 50.0)
        circleView.color = UIColor.red
        circleView.addToDrawManager()
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
//        draw1()
//        draw2()
//        draw3()
        if UDrawManager.getInstance().draw() == true {
            self.setNeedsDisplay()
        }
    }
    
    func draw1() {
        let w : CGFloat = 100.0
        let h : CGFloat = 100.0
        var x : CGFloat = 10
        var y : CGFloat = 10
        let margin : CGFloat = 5
        
        // ライン描画
        UDraw.drawLine(x1: x, y1: y, x2: x + 50.0, y2: y + 50.0, lineWidth: 2, color: UIColor.black)
        
        y = 100
        
        // 矩形描画
        var rect = CGRect(x: x, y: y, width: w, height: h)
        UDraw.drawRect(rect: rect, width: 2, color: UIColor.black)
        
        x += w + margin
        // 角丸矩形描画
        rect = CGRect(x: x, y: y, width: w, height: h)
        UDraw.drawRoundRect(rect: rect, width: 2, radius: 10, color: UIColor.black)
        
        x += w + margin
        // 塗りつぶし矩形
        rect = CGRect(x: x, y: y, width: w, height: h)
        UDraw.drawRectFill(rect: rect, color: UIColor.orange)
        
        x = 10
        y += h + margin
        // 塗りつぶし＆枠
        rect = CGRect(x: x, y: y, width: w, height: h)
        UDraw.drawRectFill(rect: rect, color: UIColor.orange, strokeWidth: 4.0, strokeColor: UIColor.black)
        
        x += w + margin
        // 塗りつぶし＆角丸＆枠
        rect = CGRect(x: x, y: y, width: w, height: h)
        UDraw.drawRoundRectFill(rect: rect, cornerR: 10.0, color: UIColor.orange, strokeWidth: 4.0, strokeColor: UIColor.black)
        
        x += w + margin
        // 円（線）
        let radius : CGFloat = w / 2
        UDraw.drawCircle(center: CGPoint(x:x + radius, y:y + radius), radius: radius, lineWidth: 4, color: UIColor.blue)
        
        // 円(塗りつぶし)
        x = 10
        y += h + margin
        UDraw.drawCircleFill(center: CGPoint(x:x + radius, y: y + radius), radius: radius, color: UIColor.orange)
        
        // 三角形（線）
        x += w + margin
        UDraw.drawTriangle(center: CGPoint(x: x + radius, y: y + radius), radius: radius, rotation: 90, lineWidth: 4.0, color: UIColor.black)
        
        // 三角形（塗りつぶし）
        x += w + margin
        UDraw.drawTriangleFill(center: CGPoint(x: x + radius, y: y + radius), radius: radius, rotation: 0, color: UIColor.orange)
        
    }
    
    /**
        テキストの描画テスト
     */
    func draw2() {
        let x : CGFloat = 150
        var y : CGFloat = 50
        let margin : CGFloat = 5
        
        UDraw.drawText(text: "hoge\nhoge", alignment: UAlignment.Center, textSize: 40, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y += 100
        UDraw.drawText(text: "hoge2", alignment: UAlignment.Left, textSize: 40, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y += 50 + margin
        UDraw.drawText(text: "hoge3", alignment: UAlignment.Right, textSize: 40, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y += 50 + margin
        UDraw.drawText(text: "hoge4", alignment: UAlignment.CenterX, textSize: 40, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y += 50 + margin
        UDraw.drawText(text: "hoge5", alignment: UAlignment.CenterY, textSize: 40, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y += 50 + margin
        UDraw.drawText(text: "hoge6", alignment: UAlignment.Right_CenterY, textSize: 40, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
    }
    
    /**
        画像描画のテスト
    */
    func draw3() {
        let image = UIImage(named: "image/ume.png")!
        
        // サイズを指定して描画
        UDraw.drawImage(image: image, x:50, y:50, width:100, height:100)
        
        // UIImageの元々のサイズで描画
        UDraw.drawImage(x: 50, y: 150, image: image)
        
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
//        print("touchesBegan")
        // タッチイベントを取得する
        let touch = touches.first
        
        // タップした座標を取得する
        let tapLocation = touch!.location(in: self)
        
//        print("touchPos:" + tapLocation.debugDescription)
        
        vt.touchStart(touch: touch!, view: self)
    }
    
    /**
     タッチ中の移動
     - parameter touches: タッチ情報
     - throws: none
     - returns: none
     */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
//        print("touchesMoved:");
        // タッチイベントを取得する
        let touch = touches.first
        
        // タップした座標を取得する
        let tapLocation = touch!.location(in: self)
        let prevLocation = touch!.previousLocation(in: self)
        
//        print("prevPos:" + prevLocation.debugDescription)
//        print("touchPos:" + tapLocation.debugDescription)
        
        vt.touchMove(touch: touch!, view: self)
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
//        print("touchesEnded:")
        
        // 再描画
        self.setNeedsDisplay()
        
        vt.touchEnd(touch: touches.first!, view: self)
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
