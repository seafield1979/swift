//
//  PageViewTest2.swift
//  UGui
//  ダイアログのテスト用ページ
//  Created by Shusuke Unno on 2017/07/14.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit

public class PageViewTest2 : UPageView, UButtonCallbacks {
    /**
     * Enums
     */
    /**
     * Constants
     */
    public static let TAG = "PageViewTest2"
    
    public static let buttonId1 = 100
    public static let buttonId2 = 101
    public static let buttonId3 = 102
    public static let buttonId4 = 103
    
    /**
     * Member variables
     */
    
    
    /**
     * Constructor
     */
    public override init( topView : TopView, title : String) {
        super.init( topView: topView, title: title)
    }
    
    /**
     * Methods
     */
    
    override func onShow() {
    }
    
    override func onHide() {
        super.onHide();
    }
    
    /**
     * 描画処理
     * サブクラスのdrawでこのメソッドを最初に呼び出す
     * @param canvas
     * @param paint
     * @return
     */
    override func draw() -> Bool {
        if isFirst {
            isFirst = false
            initDrawables()
        }
        return false
    }
    
    /**
     * タッチ処理
     * @param vt
     * @return
     */
    public func touchEvent(vt : ViewTouch) -> Bool {
        
        return false
    }
    
    /**
     * そのページで表示される描画オブジェクトを初期化する
     */
    override public func initDrawables() {
        UDrawManager.getInstance().initialize()
        
        let x : CGFloat = 50.0
        var y : CGFloat = 50.0
        let buttonW : CGFloat = 200.0
        let buttonH : CGFloat = 50.0
        
        // UButtonText
        let textButton = UButtonText(callbacks: self, type: UButtonType.Press, id: PageViewTest2.buttonId1, priority: 100, text: "button1", x: x, y: y, width: buttonW, height: buttonH, textSize: 20, textColor: UIColor.white, color: UIColor.blue)
        textButton.addToDrawManager()
        
        y += 70.0
        
        let textButton2 = UButtonText(callbacks: self, type: UButtonType.Press2, id: PageViewTest2.buttonId2, priority: 100, text: "button2", x: x, y: y, width: buttonW, height: buttonH, textSize: 20, textColor: UIColor.white, color: UIColor.blue)
        textButton2.addToDrawManager()
        
        y += 70.0
        
        let textButton3 = UButtonText(callbacks: self, type: UButtonType.Press, id: PageViewTest2.buttonId3, priority: 100, text: "button3", x: x, y: y, width: buttonW, height: buttonH, textSize: 20, textColor: UIColor.white, color: UIColor.blue)
        textButton3.addToDrawManager()
        
        y += 70.0
        
        let textButton4 = UButtonText(callbacks: self, type: UButtonType.Press, id: PageViewTest2.buttonId4, priority: 100, text: "button4", x: x, y: y, width: buttonW, height: buttonH, textSize: 20, textColor: UIColor.white, color: UIColor.blue)
        textButton4.addToDrawManager()
        
        y += 70.0
    }
    
    // ダイアログを表示する
    func showDialog() {
        let dialog = UPopupWindow(popupType: UPopupType.OKCancel,
                                  title: "hoge", isAnimation: true,
                                  screenW: CGFloat(UUtil.screenWidth()),
                                  screenH: CGFloat(UUtil.screenHeight()))
        dialog.addToDrawManager()
    }
    
    /**
     * ソフトウェアキーの戻るボタンを押したときの処理
     * @return
     */
    public override func onBackKeyDown() -> Bool {
        return false
    }
    
    /**
     * Callbacks
     */
    /**
     * UButtonCallbacks
     */
    public func UButtonClicked(id : Int, pressedOn : Bool) -> Bool {
        switch(id) {
        case PageViewTest1.buttonId1:
            showDialog()
            break
        case PageViewTest1.buttonId2:
            mTopView?.mask(withRect: CGRect(x:50,y:50,width:200,height:200))
            print("button2 clicked")
            break
        case PageViewTest1.buttonId3:
            mTopView?.mask(withRect: CGRect(x:50,y:50,width:200,height:200),
                           inverse: true)
            print("button3 clicked")
            break
        case PageViewTest1.buttonId4:
            mTopView?.clearMask()
            print("button4 clicked")
            break
        default:
            break
        }
        return true
    }
}
