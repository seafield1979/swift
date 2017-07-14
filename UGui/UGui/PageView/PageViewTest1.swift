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

public class PageViewTest1 : UPageView {
    /**
     * Enums
     */
    /**
     * Constants
     */
    public static let TAG = "PageViewTest1"
    
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
        
        // UButtonImage
        let image1 = UResourceManager.getImageByName(ImageName.miro)
        let image2 = UResourceManager.getImageByName(ImageName.ume)
        let imageButton = UButtonImage.createButton(callbacks: nil, id: 101, priority: 100, x: 100.0, y: 300.0, width: 200, height: 100, image: image1, pressedImage: image2)
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
}
