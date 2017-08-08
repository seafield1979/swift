//
//  CustomDrawView.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/07/22.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit

class CustomDrawView : UIView {
    // Consts
    public static let drawInterval : TimeInterval = 1.0 / 60.0
    var timer : Timer? = nil
    public var redraw : Bool = false
    
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
        
        // タイマー
        // 画面更新用
        if timer == nil {
            // 0.3s 毎にTemporalEventを呼び出す
            timer = Timer.scheduledTimer(timeInterval: CustomDrawView.drawInterval, target: self, selector:#selector(CustomDrawView.TemporalEvent), userInfo: nil,repeats: true)
        }

        // 画像読み込み
        image1 = UIImage.init(named: "image/miro.jpg")
        
        // マスクを設定
        self.mask(withRect: CGRect(x:0, y:0, width:frame.size.width, height: frame.size.height))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func invalidate() {
        // 再描画
        self.setNeedsDisplay()
    }
    
    
    //一定タイミングで繰り返し呼び出される関数
    func TemporalEvent(){
        //画面再描画用
        // ※ drawメソッド内でinvalidateをかけても再描画されない
//        if redraw {
//            redraw = false
            invalidate()
//        }
    }
    
    func stopTimer(){
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }

    
    /**
     描画処理
     - parameter rect: 再描画領域の矩形
     - throws: none
     - returns: none
     */
    override public func draw(_ rect: CGRect) {
        
        let fps = NanoTimer.getFps()
        if fps != 0 {
            print("fps:" + fps.description)
        }
        
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
            drawClip2()
            break
        case .drawImage:
            drawImage()
            break
        case .drawText:
            drawText()
            break
        case .drawObjects:
            drawObjects()
            
        case .drawObjects2:
            drawObjects2()
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
        
        let points : [CGPoint] = [CGPoint(x:50.0,y:50.0),
                                  CGPoint(x:100.0,y:100.0),
                                  CGPoint(x:150.0,y:50.0),
                                  CGPoint(x:200.0,y:100.0),
                                  CGPoint(x:250.0,y:50.0)]
        UDraw.drawPath(points, lineWidth: 2, color: UIColor.red, closeLine: false)
        
        let points2 : [CGPoint] = [CGPoint(x:50.0,y:150.0),
                                  CGPoint(x:100.0,y:200.0),
                                  CGPoint(x:150.0,y:150.0),
                                  CGPoint(x:200.0,y:200.0),
                                  CGPoint(x:250.0,y:150.0)]
        UDraw.drawPath(points2, lineWidth: 2, color: UIColor.blue, closeLine: true)
        
        // 三角形
        let points3 : [CGPoint] = [CGPoint(x:200.0,y:250.0),
                                   CGPoint(x:300.0,y:450.0),
                                   CGPoint(x:100.0,y:450.0)]
        UDraw.drawPathFill(points3, color: UIColor.green)
    }
    
    // 描画にクリッピング領域を設定する
    private func drawClip() {
        let clipRect = CGRect(x:50.0, y:50.0, width: 200.0, height: 200.0)
        
        // 現在のクリッピング領域を保存
        UIGraphicsGetCurrentContext()!.saveGState()
        UIGraphicsGetCurrentContext()!.clip(to: clipRect)
        
        // いろいろ描画（クリッピング領域外には描画されない）
        UDraw.drawCircleFill(x: 0, y: 0, radius: 100.0, color: UIColor.red)
        UDraw.drawCircleFill(x: 150, y: 150, radius: 100.0, color: UIColor.red)
        
        // 保存クリッピングを戻す
        UIGraphicsGetCurrentContext()!.restoreGState()
    }
    
    // 複数のクリッピング領域をまとめて指定する
    private func drawClip2() {
        let clipRects : [CGRect] = [
            CGRect(x:50.0, y:50.0, width: 50.0, height: 50.0),
            CGRect(x:150.0, y:50.0, width: 50.0, height: 50.0),
            CGRect(x:50.0, y:150.0, width: 50.0, height: 50.0),
            CGRect(x:150.0, y:150.0, width: 50.0, height: 50.0)
        ]
        
        // 現在のクリッピング領域を保存
        UIGraphicsGetCurrentContext()!.saveGState()
        UIGraphicsGetCurrentContext()!.clip(to: clipRects)
        
        // いろいろ描画（クリッピング領域外には描画されない）
        UDraw.drawCircleFill(x: 0, y: 0, radius: 200.0, color: UIColor.red)
        
        // 保存クリッピングを戻す
        UIGraphicsGetCurrentContext()!.restoreGState()
    }
    
    // 画像を描画
    private func drawImage() {
        // 半透明描画
        UDraw.drawImageWithBlend(image: image1!, rect: CGRect(x:50, y:50, width: 100, height: 100), alpha: 0.5)
        
        // 描画先のサイズを指定して描画
        UDraw.drawImage(image: image1!, rect : CGRect(x:200,y:50, width:100, height:100))
        
        // 元画像を切り抜き描画
        UDraw.drawImageWithCrop(image: image1!,
                                srcRect: CGRect(x:50.0, y:50.0, width:100, height:100),
                                dstRect: CGRect(x:50, y: 200, width: 200, height: 200))
    }
    
    // 文字列を描画
    private func drawText() {
        let width = self.frame.size.width
        var x : CGFloat
        var y : CGFloat

        // アライメントを指定してテキストを描画
        x = width / 2
        y = 50
        UDraw.drawText(text: "hello!(left)", alignment: UAlignment.Left, textSize: 20, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y = 100
        UDraw.drawText(text: "hello!(center xy)", alignment: UAlignment.Center, textSize: 20, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y = 150
        UDraw.drawText(text: "hello!(center x)", alignment: UAlignment.CenterX, textSize: 20, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y = 200
        UDraw.drawText(text: "hello!(center y)", alignment: UAlignment.CenterY, textSize: 20, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y = 250
        UDraw.drawText(text: "hello!(right)", alignment: UAlignment.Right, textSize: 20, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
        
        y = 300
        UDraw.drawText(text: "hello!(right center y)", alignment: UAlignment.Right_CenterY, textSize: 20, x: x, y: y, color: UIColor.black)
        UDraw.drawCheck(x: x, y: y, color: UIColor.red)
    }
    
    // 大量のオブジェクトを描画する
    private func drawObjects() {
        let drawCnt = 1000
        for i in 0..<drawCnt {
            let x  = CGFloat(arc4random() % (UInt32(UIScreen.main.bounds.size.width) - 100))
            let y  = CGFloat(arc4random() % (UInt32(UIScreen.main.bounds.size.height) - 100))
            UDraw.drawRectFill(rect: CGRect(x: x, y: y, width: 100, height: 100), color: UColor.makeColor(
                arc4random() % 256, arc4random() % 256, arc4random() % 256))
        }
    }
    
    private func drawObjects2() {
        let drawCnt = 100
        for _ in 0..<drawCnt {
            let x  = CGFloat(arc4random() % (UInt32(UIScreen.main.bounds.size.width) - 100))
            let y  = CGFloat(arc4random() % (UInt32(UIScreen.main.bounds.size.height) - 100))
            UDraw.drawText(text: "hello world", alignment: UAlignment.Center, textSize: 20, x: x, y: y, color: UColor.makeColor(
                arc4random() % 256, arc4random() % 256, arc4random() % 256))
        }

    }
}
