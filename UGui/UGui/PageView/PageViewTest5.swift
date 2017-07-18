//
//  PageViewTest5.swift
//  UGui
//
//  Created by Shusuke Unno on 2017/07/17.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit

public class PageViewTest5 : UPageView {
    /**
     * Enums
     */
    /**
     * Constants
     */
    public static let TAG = "PageViewTest5"
    
    var listView : UListView? = nil
    
    /**
     * Propaties
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
        let textButton = UButtonText(callbacks: nil, type: UButtonType.Press, id: PageViewTest1.buttonId1, priority: 100, text: "button1", x: x, y: y, width: buttonW, height: buttonH, textSize: 20, textColor: UIColor.white, color: UIColor.blue)
        textButton.addToDrawManager()
        
        y += buttonH + 10.0
        listView = UListView(
            parentView : mTopView!,
            windowCallbacks : nil,
            listItemCallbacks : nil,
            priority : 100,
            x : 50.0, y : 50.0,
            width : 300, height : 400, color : UIColor.red)
        
        listView?.addDummyItems(count: 20)
        
        listView?.addToDrawManager()

    }
    
    // ダイアログを表示する
    func showDialog() {
        let dialog = UPopupWindow(parentView: mTopView!,
                                  popupType: UPopupType.OKCancel,
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
    
}
