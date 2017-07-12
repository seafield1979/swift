//
//  UButton.swift
//  UGui
//
//  Created by Shusuke Unno on 2017/07/08.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit

// ボタンの種類
enum UButtonType {
    case BGColor    // color changing
    case Press      // pressed down
    case Press2     // pressed down, On/Off swiching
    case Press3     // pressed down, Off -> On only, to change Off call setPressedOn(false)
}


protocol UButtonCallbacks {
    /**
     * ボタンがクリックされた時の処理
     * @param id  button id
     * @param pressedOn  押された状態かどうか(On/Off)
     * @return
     */
    func UButtonClicked(id : Int, pressedOn : Bool) -> Bool
}

/**
 * クリックでイベントが発生するボタン
 *
 * 生成後ViewのonDraw内で draw メソッドを呼ぶと表示される
 * ボタンが押されたときの動作はtypeで指定できる
 *   BGColor ボタンの背景色が変わる
 *   Press   ボタンがへこむ
 *   Press2  ボタンがへこむ。へこんだ状態が維持される
 */

public class UButton : UDrawable {
    /**
     * Consts
     */
//    public static let TAG = "UButton"
    public static let PRESS_Y : Int = 6;
    public static let BUTTON_RADIUS : Int = 6;
    public static let DISABLED_COLOR : UIColor = UColor.makeColor(160, 160, 160)
    public static let DEFAULT_BG_COLOR : UIColor = UColor.LightGray
    
    /**
     * Member Variables
     */
    var id : Int = 0;
    var type : UButtonType = .BGColor
    var buttonCallback : UButtonCallbacks? = nil
    var enabled : Bool = false         // falseならdisableでボタンが押せなくなる
    var checked : Bool = false          // チェックアイコンを表示する
    var isPressed : Bool = false
    var isClicked : Bool = false        // クリックされた(クリックイベントを遅延発生させるために使用)
    var pressedColor: UIColor = UIColor()
    var disabledColor : UIColor = UIColor()  // enabled == false のときの色
    var disabledColor2 : UIColor = UIColor() // eanbled == false のときの濃い色
    var pressedOn : Bool = false        // Press2タイプの時のOn状態
    var pullDownIcon : Bool = false     // プルダウンのアイコン▼を表示
    
    /**
     * Get/Set
     */
    public func getEnabled() -> Bool { return enabled; }
    public func getId() -> Int {
        return id
    }
    
    public func isPressedOn() -> Bool {
        return pressedOn
    }
    
    public func setPressedOn(pressedOn : Bool) {
        self.pressedOn = pressedOn
    }
    
    public func isChecked() -> Bool {
        return checked
    }
    
    public func setChecked(checked : Bool) {
        self.checked = checked
    }
    
    public func setEnabled(enabled : Bool) {
        self.enabled = enabled
    }
    
    public func setPullDownIcon(pullDown : Bool) {
        pullDownIcon = pullDown
    }
    
    public func isPressButton() -> Bool {
        return (type != UButtonType.BGColor)
    }
    
    /**
     * Constructor
     */
    init(callbacks : UButtonCallbacks, type : UButtonType, id : Int, priority : Int,
         x : CGFloat, y : CGFloat, width : CGFloat, height : CGFloat, color : UIColor?)
    {
        //init(priority: Int, x: CGFloat, y: CGFloat, width : CGFloat, height : CGFloat)
        
        super.init(priority: priority,x: x,y: y,width: width,height: height)
        self.id = id
        self.enabled = true
        self.buttonCallback = callbacks
        self.type = type
        self.color = color
        if color != UIColor.black {
            if type == UButtonType.BGColor {
                self.pressedColor = UColor.addBrightness(argb:color!, addY:0.2)
            } else {
                self.pressedColor = UColor.addBrightness(argb:color!, addY:-0.2)
            }
        }
        disabledColor = UButton.DISABLED_COLOR
        disabledColor2 = UColor.addBrightness(argb:disabledColor, addY:-0.2)
    }

    /**
     * Get/Set
     */
    public func setId(id : Int) {
        self.id = id
    }
    
    /**
     * Methods
     */
    /**
     * 描画オフセットを取得する
     * @return
     */
    public func getDrawOffset() -> CGPoint? {
        // 親Windowの座標とスクロール量を取得
        return nil;
    }
    
    /**
     * 描画処理
     * @param offset 独自の座標系を持つオブジェクトをスクリーン座標系に変換するためのオフセット値
     */
    public func draw(offset: CGPoint) {
        // UButtonは抽象クラスなので何もしない
    }
    
    /**
     * 毎フレームの処理
     * サブクラスでオーバーライドして使用する
     * @return true:処理中 / false:処理完了
     */
    public override func doAction() -> DoActionRet{
        if isClicked {
            isClicked = false
            click()
            return DoActionRet.Done
        }
        return DoActionRet.None
    }
    
    /**
     * UDrawable Interface
     */
    /**
     * タッチアップイベント
     */
    public override func touchUpEvent(vt: ViewTouch) -> Bool {
        if vt.isTouchUp {
            if isPressed {
                isPressed = false
                return true
            }
        }
        return false
    }

    /**
     * タッチイベント
     * @param vt
     * @return true:イベントを処理した(再描画が必要)
     */
    public func touchEvent(vt : ViewTouch) -> Bool {
        return touchEvent(vt: vt, offset: nil)
    }
    
    public override func touchEvent(vt : ViewTouch, offset : CGPoint?) -> Bool {
        if (!enabled) {
            return false
        }
        
        var done : Bool = false
        var offset = offset
        if offset == nil {
            offset = CGPoint()
        }
        
        switch(vt.type) {
        case .None: break
            
        case .Touch:
            if (rect?.contains(x:vt.touchX(offset: -offset!.x), y:vt.touchY(offset: -offset!.y)))! {
                isPressed = true
                done = true
            }
        case .Click:
            fallthrough
        case .LongClick:
            fallthrough
        case .LongPress:
            isPressed = false;
            if (rect?.contains(x: vt.touchX(offset: -offset!.x), y: vt.touchY(offset: -offset!.y)))! {
                if (type == UButtonType.Press3) {
                    // Off -> On に切り替わる一回目だけイベント発生
                    if (pressedOn == false) {
                        isClicked = true;
                        pressedOn = true;
                        done = true;
                    }
                } else {
                    isClicked = true;
                    done = true;
                    if (type == UButtonType.Press2) {
                        pressedOn = !pressedOn;
                    }
                }
            }
        case .MoveEnd:
            break
        default:
            break
        }
        return done;
    }
    
    public func click() {
        if buttonCallback != nil {
            buttonCallback!.UButtonClicked(id: id, pressedOn: pressedOn)
        }
    }
}
