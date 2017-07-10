//
//  UDrawable.swift
//  UGui
//
//  Created by Shusuke Unno on 2017/07/08.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit
/**
 * Enums
 */

// 自動移動のタイプ
public enum MovingType {
    case UniformMotion      // 等速運動
    case Acceleration       // 加速
    case Deceleration       // 減速
}

class UDrawable {
    /**
     * Constants
     */
    private static let TAG = "UDrawable"
    public static let RAD : Double = 3.1415 / 180.0
    
    /**
     * Member variables
     */
    var drawList : DrawList? = nil    // DrawManagerに描画登録するとnull以外になる
    var pos = CGPoint()
    var size = CGSize()
    var rect : URect? = nil
    var color = UIColor()
    var drawPriority = 0     // DrawManagerに渡す描画優先度
    
    // 自動移動、サイズ変更、色変更
    var isMoving : Bool = false;
    var isMovingPos : Bool = false
    var isMovingSize : Bool = false
    
    var isShow : Bool = false
    var movingType : MovingType = .UniformMotion
    var movingFrame : Int = 0
    var movingFrameMax : Int = 0
    
    var srcPos = CGPoint()
    var dstPos = CGPoint()
    
    var srcSize = CGSize()
    var dstSize = CGSize()
    
    // アニメーション用
    public static let ANIME_FRAME : Int = 20
    var isAnimating : Bool = false
    var animeFrame : Int = 0
    var animeFrameMax : Int = 0
    var animeRatio : CGFloat = 0.0
    
    init(priority: Int, x: CGFloat, y: CGFloat, width : CGFloat, height : CGFloat)
    {
        setPos(x, y)
        setSize(width, height)
        updateRect()
        
        drawPriority = priority
        color = UIColor.black
        isShow = true
    }
    
    /**
     *  Get/Set
     */
    public func getX() -> CGFloat {
        return pos.x
    }
    public func setX(_ x: CGFloat){
        pos.x = x
    }
    
    public func getY() -> CGFloat {
        return pos.y
    }
    public func setY(_ y: CGFloat) {
        pos.y = y
    }
    
    public func getPos() -> CGPoint {
        return pos
    }
    
    public func setPos(_ x : CGFloat, _ y : CGFloat) {
        setPos(x, y, true)
    }
    public func setPos(_ x:CGFloat, _ y:CGFloat, _ update : Bool)
    {
        pos.x = x
        pos.y = y
        if update {
            updateRect()
        }
    }
    public func setPos(_ pos : CGPoint) {
        setPos(pos, true)
    }
    
    public func setPos(_ pos: CGPoint, _ update : Bool) {
        self.pos.x = pos.x
        self.pos.y = pos.y
        updateRect()
    }
    
    public func getSize() -> CGSize {
        return size
    }
    
    public func updateRect() {
        if rect == nil {
            rect = URect(pos.x, pos.y,
                         size.width, pos.y + size.height)
        } else {
            rect!.left = pos.x
            rect!.right = pos.x + size.width
            rect!.top = pos.y
            rect!.bottom = pos.y + size.height
        }
    }
    public func getIsShow() -> Bool {
        return isShow
    }
    
    /**
     * Rectをスケールする。ボタン等のタッチ範囲を広げるのに使用する
     * @param scaleH
     * @param scaleV
     */
    public func scaleRect(scaleH: CGFloat, scaleV : CGFloat) {
        let _scaleW = size.width * (scaleH - 1.0) / 2
        let _scaleH = size.height * (scaleV - 1.0) / 2
        
        rect!.left = pos.x + -_scaleW
        rect!.top = pos.y + -_scaleH
        rect!.right = pos.x + size.width + _scaleW
        rect!.bottom = pos.y + size.height + _scaleH
    }
    
    public func getRight() -> CGFloat {
        return pos.x + size.width
    }
    public func getBottom() -> CGFloat {
        return pos.y + size.height
    }
    
    public func getWidth() -> CGFloat {
        return size.width
    }
    public func setWidth(_ w: CGFloat) {
        size.width = w
    }
    
    public func getHeight() -> CGFloat {
        return size.height
    }
    public func setHeight(_ h:CGFloat) {
        size.height = h
    }
    
    public func setSize(_ width: CGFloat, _ height: CGFloat) {
        size.width = width
        size.height = height
        updateRect()
    }
    
    public func getRect() -> URect {return rect!}
    public func getRectWithOffset(offset : CGPoint) -> URect {
        return URect(rect!.left + offset.x,
                     rect!.top + offset.y,
                     rect!.right + offset.x,
                     rect!.bottom + offset.y);
    }
    
    // 枠の分太いRectを返す
    public func getRectWithOffset(offset : CGPoint, frameWidth : CGFloat) -> URect
    {
        return URect(rect!.left + offset.x - frameWidth,
                rect!.top + offset.y - frameWidth,
                rect!.right + offset.x + frameWidth,
                rect!.bottom + offset.y + frameWidth);
    }
    
    public func getColor() -> UIColor {
        return color
    }
    public func setColor(color : UIColor) {
        self.color = color;
    }
    
    /**
     * 後処理。nullを設定する前に呼ぶ
     */
    public func cleanUp() {
//todo         UDrawManager.getInstance().removeDrawable(self);
    }
    
    /**
     * 描画処理
     * @param offset 独自の座標系を持つオブジェクトをスクリーン座標系に変換するためのオフセット値
     */
    public func draw(_ offset : CGPoint) {
        // 抽象クラス(Swiftではサポートされていないので仕方なく実装)
    }
    
    /**
     * 毎フレームの処理
     * サブクラスでオーバーライドして使用する
     * @return true:処理中 / false:処理完了
     */
    public func doAction() -> DoActionRet{
        return DoActionRet.None;
    }
    
    /**
     * Rectをライン描画する for Debug
     */
    public func drawRectLine(offset : CGPoint, color : UIColor) {
        let _rect = URect(rect!.left + offset.x,
                        rect!.top + offset.y,
                        rect!.right + offset.x,
                        rect!.bottom + offset.y )
        
        UDraw.drawRect(rect: _rect.toCGRect(), width: 2, color: color)
    }
    
    /**
     * タッチアップ処理
     * @param vt
     * @return
     */
    public func touchUpEvent(vt: ViewTouch) -> Bool { return false; }
    
    /**
     * タッチ処理
     * @param vt
     * @return
     */
    public func touchEvent(vt : ViewTouch, offset : CGPoint?) -> Bool
    {
        return false;
    }
    
    /**
     * DrawManagerの描画リストに追加する
     */
    public func addToDrawManager() {
        UDrawManager.getInstance().addDrawable(self)
    }
    
    /**
     * DrawManageのリストから削除する
     */
    public func removeFromDrawManager() {
        UDrawManager.getInstance().removeDrawable(self)
    }
    
    
    /**
     * 移動
     * @param moveX
     * @param moveY
     */
    public func move(_ moveX: CGFloat, _ moveY : CGFloat) {
        pos.x += moveX;
        pos.y += moveY;
        updateRect();
    }
    
    /**
     * startMovingの最初に呼ばれる処理
     * サブクラスでオーバーライドして使用する
     */
    public func startMoving() {
    }
    
    public func startMoving(dstX: CGFloat, dstY: CGFloat, frame : Int) {
        startMoving(movingType: MovingType.UniformMotion,
                    dstX: dstX, dstY: dstY, frame: frame);
    }
    
    /**
     * 自動移動(座標)
     * @param dstX  目的x
     * @param dstY  目的y
     * @param frame  移動にかかるフレーム数
     */
    public func startMoving(movingType : MovingType, dstX : CGFloat, dstY : CGFloat, frame : Int)
    {
        if (!setMovingPos(dstX: dstX, dstY: dstY)) {
            // 移動不要
            return
        }
        startMoving()
        
        isMoving = true
        isMovingPos = true
        isMovingSize = false
        self.movingType = movingType
        movingFrame = 0
        movingFrameMax = frame
    }
    
    private func setMovingPos(dstX : CGFloat, dstY : CGFloat) -> Bool {
        if (pos.x == dstX && pos.y == dstY) {
            return false;
        }
        srcPos.x = pos.x
        srcPos.y = pos.y
        dstPos.x = dstX
        dstPos.y = dstY
        return true
    }
    
    /**
     * 自動移動(サイズ)
     * @param dstW
     * @param dstH
     * @param frame
     */
    public func startMovingSize(dstW : CGFloat, dstH : CGFloat, frame : Int) {
        if (!setMovingSize(dstW: dstW, dstH: dstH)) {
            // 移動不要
            return;
        }
        startMoving()
        
        movingType = MovingType.UniformMotion
        isMoving = true
        isMovingPos = false
        isMovingSize = true
        movingFrame = 0
        movingFrameMax = frame
    }
    
    private func setMovingSize(dstW : CGFloat, dstH : CGFloat) -> Bool {
        if (size.width == dstW && size.height == dstH) {
            return false
        }
        srcSize.width = size.width
        srcSize.height = size.height
        dstSize.width = dstW
        dstSize.height = dstH
        return true
    }
    
    /**
     * 自動移動(座標 & サイズ)
     * @param dstX
     * @param dstY
     * @param dstW
     * @param dstH
     * @param frame
     */
    public func startMoving(dstX : CGFloat, dstY : CGFloat, dstW : CGFloat, dstH : CGFloat, frame : Int)
    {
        startMoving(movingType: MovingType.UniformMotion, dstX: dstX, dstY: dstY, dstW: dstW, dstH: dstH, frame: frame);
    }
    public func startMoving(movingType : MovingType,
                            dstX : CGFloat, dstY : CGFloat, dstW : CGFloat, dstH : CGFloat, frame : Int)
    {
        var noMoving = true
        startMoving()
        
        if (setMovingPos(dstX: dstX, dstY: dstY)) {
            noMoving = false
        }
        if (setMovingSize(dstW: dstW, dstH: dstH)) {
            noMoving = false
        }
        if (!noMoving) {
            isMovingPos = true
            isMovingSize = true
            self.movingType = movingType
            movingFrame = 0
            movingFrameMax = frame
            isMoving = true
        }
    }
    
    /**
     * 移動、サイズ変更、色変更
     * 移動開始位置、終了位置、経過フレームから現在の値を計算する
     * @return true:移動中
     */
    public func autoMoving() -> Bool {
        if !isMoving {
            return false
        }
        
        movingFrame += 1
        if movingFrame >= movingFrameMax {
            // 移動完了
            if isMovingPos {
                setPos(dstPos)
            }
            if isMovingSize {
                setSize(dstSize.width, dstSize.height)
            }
            
            isMoving = false
            isMovingPos = false
            isMovingSize = false
            
            updateRect()
            endMoving()
        } else {
            // 移動中
            // ratio 0.0(始点) -> 1.0(終点)
            let ratio : CGFloat = CGFloat(movingFrame) / CGFloat(movingFrameMax)
            switch(movingType) {
                case .UniformMotion:
                break
                case .Acceleration:
// todo                ratio = UUtil.toAccel(ratio)
                break
                case .Deceleration:
// todo                ratio = UUtil.toDecel(ratio)
                break
            }
            if isMovingPos {
                setPos(srcPos.x + ((dstPos.x - srcPos.x) * ratio),
                srcPos.y + ((dstPos.y - srcPos.y) * ratio))
            }
            if isMovingSize {
                setSize((srcSize.width + (dstSize.width - srcSize.width) * ratio),
                    (srcSize.height + (dstSize.height - srcSize.height) * ratio))
            }
        }
        return true;
    }
    
    /**
     * 自動移動完了時の処理
     */
    public func endMoving() {}
    
    /**
     * Drawableインターフェース
     */
    public func setDrawList(_ drawList : DrawList) {
        self.drawList = drawList
    }
    
    public func getDrawList() -> DrawList? {
        return drawList
    }
    
    public func getDrawPriority() -> Int {
        return drawPriority
    }
    
    public func setDrawPriority(_ drawPriority : Int) {
        self.drawPriority = drawPriority;
    }
    
    /**
     * 描画オフセットを取得する
     * @return
     */
    public func getDrawOffset() -> CGPoint {
        return CGPoint()
    }
    
    /**
     * アニメーション開始
     */
    public func startAnimation() {
        startAnimation(frameMax: UDrawable.ANIME_FRAME);
    }
    public func startAnimation(frameMax : Int) {
        isAnimating = true
        animeFrame = 0
        animeFrameMax = frameMax
        animeRatio = 0
    }

    /**
     * アニメーション終了時に呼ばれる処理
     */
    public func endAnimation() {
    }
 
    /**
     * アニメーション処理
     * といいつつフレームのカウンタを増やしているだけ
     * @return true:アニメーション中
     */
    public func animate() -> Bool {
        if !isAnimating {
            return false
        }
        if animeFrame >= animeFrameMax {
            isAnimating = false
            endAnimation()
        } else {
            animeFrame += 1
            animeRatio = CGFloat(animeFrame) / CGFloat(animeFrameMax)
        }
        return true;
    }

    /**
     * アニメーションフレームからアルファ値(1.0 -> 0.0 -> 1.0)を取得する
     *
     * @return
     */
    public func getAnimeAlpha() -> Int {
        let v1 = (Double(animeFrame) / Double(animeFrameMax)) * 180.0
        return Int((1.0 -  sin(v1 * UDrawable.RAD)) * 255)
    }
}
