//
//  PageViewTest1.swift
//  UGui
//  テストページ1
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

public class PageViewTest1 : UPageView, UButtonCallbacks {
    /**
     * Enums
     */
    /**
     * Constants
     */
    public static let TAG = "PageViewTest1"
    
    public static let buttonId1 = 100
    public static let buttonId2 = 100
    public static let buttonId3 = 100
    
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
        
        var x : CGFloat = 50.0
        var y : CGFloat = 50.0
        let buttonW : CGFloat = 200.0
        let buttonH : CGFloat = 50.0
        
        // UButtonText
        let textButton = UButtonText(callbacks: self, type: UButtonType.Press, id: PageViewTest1.buttonId1, priority: 100, text: "button1", x: x, y: y, width: buttonW, height: buttonH, textSize: 20, textColor: UIColor.white, color: UIColor.blue)
        textButton.addToDrawManager()
        
        y += 100.0

        let textButton2 = UButtonText(callbacks: self, type: UButtonType.Press2, id: PageViewTest1.buttonId1, priority: 100, text: "button2", x: x, y: y, width: buttonW, height: buttonH, textSize: 20, textColor: UIColor.white, color: UIColor.blue)
        textButton2.addToDrawManager()

        y += 100.0
        
        // UButtonImage
        let image1 = UResourceManager.getImageByName(ImageName.miro)
        let image2 = UResourceManager.getImageByName(ImageName.ume)
        let imageButton = UButtonImage.createButton(callbacks: nil, id: PageViewTest1.buttonId3, priority: 100, x: x, y: y, width: buttonW, height: buttonH, image: image1, pressedImage: image2)
        imageButton.addToDrawManager()
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
            print("button1 clicked")
            break
        case PageViewTest1.buttonId2:
            print("button2 clicked")
            break
        case PageViewTest1.buttonId3:
            print("button3 clicked")
            break
        default:
            break
        }
        return true
    }
}
