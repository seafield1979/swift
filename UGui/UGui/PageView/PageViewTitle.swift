//
//  PageViewTitle.swift
//  UGui
//  アプリ起動時に表示されるページ
//
//  Created by Shusuke Unno on 2017/07/13.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit


/**
 * Created by shutaro on 2016/12/15.
 *
 * Debug page
 */

public class PageViewTitle : UPageView, UButtonCallbacks {
    /**
     * Enums
     */
    /**
     * Constants
     */
    public static let TAG = "PageViewTitle"
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
        
        let x : CGFloat = 100.0
        var y : CGFloat = 100.0
        
        for i in 0...3 {
            let textButton = UButtonText(callbacks: self, type: UButtonType.BGColor, id: 100 + i, priority: 100, text: "button" + (i+1).description, x: x, y: y, width: 200.0, height: 50.0, textSize: 20, textColor: UColor.White, color: UColor.Blue)
            textButton.addToDrawManager()
            
            y += 100.0
        }
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
        case PageViewTitle.buttonId1:
            // ページ切り替え
            _ = PageViewManager.getInstance().stackPage(pageId: PageView.Test1)
            
        case PageViewTitle.buttonId2:
            // ページ切り替え
            _ = PageViewManager.getInstance().stackPage(pageId: PageView.Test2)
        case PageViewTitle.buttonId3:
            // ページ切り替え
            _ = PageViewManager.getInstance().stackPage(pageId: PageView.Test3)
        case PageViewTitle.buttonId4:
            break
        default:
            break
        }
        return true
    }
}
