//
//  UListView.swift
//  UGui
//
//  Created by Shusuke Unno on 2017/07/08.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit

/**
 * ListView
 * UListItemを縦に並べて表示する
 * 要素が領域に収まりきらない場合はスクロールバーでスクロールできるようになる
 */

public class UListView : UScrollWindow
{
    /**
     * Enums
     */
    /**
     * Constants
     */
    public static let MARGIN_V = 7
    
    /**
     * Member variables
     */
    var mItems : List<UListItem> = List()
    var mListItemCallbacks : UListItemCallbacks
    var mClipRect : CGRect
    
    // リストの最後のアイテムの下端の座標
    var mBottomY : CGFloat = 0
    
    /**
     * Constructor
     */
    public init(parentView : TopView,
                windowCallbacks : UWindowCallbacks,
                listItemCallbacks : UListItemCallbacks,
                priority : Int,
                x : CGFloat, y : CGFloat,
                width : CGFloat, height : CGFloat, color : UIColor)
    {
        mListItemCallbacks = listItemCallbacks
        mClipRect = CGRect()
        
        super.init(parentView: parentView,
                   callbacks: windowCallbacks, priority:priority,
                    x: x, y: y,
                    width: width, height: height,
                    color: color,
                    topBarH: 0, frameW: 0, frameH: UDpi.toPixel(10))
        
    }
    
    /**
     * Methods
     */
    public func get(index : Int) -> UListItem {
        return mItems[index]
    }
    
    public func getItemNum() -> Int{
        return mItems.count
    }
    
    public func add(item : UListItem) {
        item.setPos( 0, mBottomY )
        item.setIndex( mItems.count )
        item.setListItemCallbacks( mListItemCallbacks )
        
        mItems.append(item)
        
        mBottomY += item.getHeight()
        mBottomY -= item.mFrameW / 2       // フレーム部分は重なってもOK
        
        contentSize.height = mBottomY
    }
    
    // 既存の項目を置き換える
//    public func update(oldItem : UListItem, newItem : UListItem) {
//        let index = mItems.indexOf(oldItem)
//        newItem.setPos(oldItem.getX(), oldItem.getY())
//        mItems.set(index, newItem)
//    }
    
    public func clear() {
        mItems.removeAll()
        mBottomY = 0
        setContentSize(width: 0, height: 0, update: true)
    }
    
    public func remove(index : Int) {
        if index == -1 {
            return
        }
        
        let item = mItems[index]
        var y = item.getY()
        _ = mItems.remove(at: index)
        // 削除したアイテム以降のアイテムのIndexと座標を詰める
        for i in index...mItems.count - 1 {
            let _item = mItems[i]
            _item.setIndex(i)
            _item.setY(y)
            y = _item.getBottom()
        }
        mBottomY = y
    }
    
    override public func doAction() -> DoActionRet {
        var ret = DoActionRet.None
        for item in mItems {
            let _ret = item!.doAction()
            switch (_ret) {
            case .Done:
                return DoActionRet.Done
            case .Redraw:
                ret = _ret
            default:
                break
            }
        }
        return ret
    }
    
    // ウィンドウの内部領域の描画
//    public func drawContent( offset : CGPoint? ) {
//        var _pos = CGPoint(x: pos.x, y: pos.y)
//        
//        if offset != nil {
//            _pos.x += offset!.x
//            _pos.y += offset!.y
//        }
//        
//        // クリッピングを設定
//        
//        
//        mClipRect.left = (int)_pos.x;
//        mClipRect.right = (int)_pos.x + clientSize.width;
//        mClipRect.top = (int)_pos.y;
//        mClipRect.bottom = (int)_pos.y + clientSize.height;
//        
//        canvas.clipRect(mClipRect);
//        
//        // アイテムを描画
//        PointF _offset = new PointF(_pos.x, _pos.y - contentTop.y);
//        for (UListItem item : mItems) {
//            if (item.getBottom() < contentTop.y) continue;
//            
//            item.draw(canvas, paint, _offset);
//            
//            if (item.getY() + item.getHeight() > contentTop.y + size.height) {
//                // アイテムの下端が画面外にきたので以降のアイテムは表示されない
//                break;
//            }
//        }
//        
//        // クリッピングを解除
//        canvas.restore();
//    }
//    
//    public boolean touchEvent(ViewTouch vt, PointF offset) {
//        if (offset == null) {
//            offset = new PointF();
//        }
//        // 領域外なら何もしない
//        if (!getClientRect().contains((int)vt.touchX(-pos.x - offset.x),
//                                      (int)vt.touchY(-pos.y - offset.y)))
//        {
//            return false;
//        }
//        
//        // アイテムのクリック判定処理
//        PointF _offset = new PointF(pos.x + offset.x, pos.y - contentTop.y + offset.y);
//        boolean isDraw = false;
//        
//        if (super.touchEvent(vt, offset)) {
//            return true;
//        }
//        
//        for (UListItem item : mItems) {
//            if (item.getBottom() < contentTop.y) continue;
//            if (item.touchEvent(vt, _offset)) {
//                isDraw = true;
//            }
//            if (item.getY() + item.getHeight() > contentTop.y + clientSize.height) {
//                // アイテムの下端が画面外にきたので以降のアイテムは表示されない
//                break;
//            }
//        }
//        
//        return isDraw;
//    }
//    
//    public boolean touchUpEvent(ViewTouch vt) {
//        boolean isDraw = false;
//        if (vt.isTouchUp()) {
//            for (UListItem item : mItems) {
//                item.touchUpEvent(vt);
//                isDraw = true;
//            }
//        }
//        return isDraw;
//    }
//    
//    /**
//     * for Debug
//     */
//    public void addDummyItems(int count) {
//        
//        updateWindow();
//    }
}
