//
//  UButtonText.swift
//  UGui
//
//  Created by Shusuke Unno on 2017/07/08.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit

/**
 * テキストを表示するボタン
 */
public class UButtonText : UButton {
    /**
     * Enums
     */
    
    /**
     * Consts
     */
    public static let TAG = "UButtonText"
    
    private static let MARGIN_V : Int = 10
    private static let CHECKED_W : Int = 23
    
    static let DEFAULT_TEXT_COLOR = UIColor.black
    static let PULL_DOWN_COLOR = UColor.DarkGray
    
    /**
     * Member Variables
     */
    private var mText : String
    private var mTextColor : UIColor
    private var mTextSize : Int = 0
    private var mImage : UIImage? = nil
    private var mImageAlignment : UAlignment = UAlignment.Left     // 画像の表示位置
    private var mTextOffset = CGPoint()
    private var mImageOffset = CGPoint()
    private var mImageSize : CGSize = CGSize()
    
    /**
     * Get/Set
     */
    
    public func getmText() -> String{
        return mText
    }
    
    public func setText(mText : String) {
        self.mText = mText;
    }
    
    public func setTextColor(mTextColor : UIColor) {
        self.mTextColor = mTextColor
    }
    
    public func setImage(imageName : ImageName, imageSize : CGSize) {
        mImage = UResourceManager.getImageByName(imageName)
        mImageSize = imageSize;
    }
    
    public func setImage(image : UIImage, imageSize : CGSize) {
        mImage = image
        mImageSize = imageSize
    }
    
    public func setImageAlignment(alignment : UAlignment) {
        mImageAlignment = alignment
    }
    
    public func setTextOffset(x : CGFloat, y : CGFloat) {
        mTextOffset.x = x
        mTextOffset.y = y
    }
    
    public func setImageOffset(x : CGFloat, y : CGFloat) {
        mImageOffset.x = x
        mImageOffset.y = y
    }
    
    /**
     * Constructor
     */
    init(callbacks : UButtonCallbacks, type : UButtonType, id : Int,
                     priority : Int, text : String,
                     x : CGFloat, y : CGFloat, width : CGFloat, height : CGFloat,
                     textSize : Int, textColor : UIColor?, color : UIColor?)
    {
        self.mText = text
        self.mTextColor = textColor!
        self.mTextSize = textSize
        
        super.init(callbacks: callbacks, type: type, id: id, priority: priority,
                   x: x, y: y, width: width, height: height, color: color)
        
        var textColor = textColor   // 引数はletなのでvarで再定義
        if textColor == nil {
            textColor = UButtonText.DEFAULT_TEXT_COLOR
        }
        
        if height == 0 {
            let size = UDraw.getTextSize(text: text, textSize: textSize)
            setSize(width, size.height + UDpi.toPixel(dpi: UButtonText.MARGIN_V) * 2)
        }
        
    }
//
//    /**
//     * Methods
//     */
//    @Override
//    public void setChecked(boolean checked) {
//        super.setChecked(checked);
//        
//        // ボタンの左側にチェックアイコンを表示
//        if (checked) {
//            setImage(UResourceManager.getBitmapWithColor(R.drawable.checked2, UColor.BLACK), new Size(UDpi.toPixel(CHECKED_W), UDpi.toPixel(CHECKED_W)));
//        } else {
//            setImage(null, null);
//        }
//    }
//    
//    /**
//     * 描画処理
//     * @param canvas
//     * @param paint
//     * @param offset 独自の座標系を持つオブジェクトをスクリーン座標系に変換するためのオフセット値
//     */
//    public void draw(Canvas canvas, Paint paint, PointF offset) {
//        // 色
//        // 押されていたら明るくする
//        int _color = color;
//        
//        PointF _pos = new PointF(pos.x, pos.y);
//        if (offset != null) {
//            _pos.x += offset.x;
//            _pos.y += offset.y;
//        }
//        
//        int _height = size.height;
//        
//        if (type == UButtonType.BGColor) {
//            // 押したら色が変わるボタン
//            if (!enabled) {
//                _color = disabledColor;
//            }
//            else if (isPressed) {
//                _color = pressedColor;
//            }
//        }
//        else {
//            int _pressedColor = pressedColor;
//            // 押したら凹むボタン
//            if (!enabled) {
//                _color = disabledColor;
//                _pressedColor = disabledColor2;
//            }
//            if (isPressed || pressedOn) {
//                _pos.y += UDpi.toPixel(PRESS_Y);
//            } else {
//                // ボタンの影用に下に矩形を描画
//                int height = UDpi.toPixel(PRESS_Y + 13);
//                UDraw.drawRoundRectFill(canvas, paint,
//                                        new RectF(_pos.x, _pos.y + size.height - height,
//                                                  _pos.x + size.width, _pos.y + size.height),
//                                        UDpi.toPixel(BUTTON_RADIUS), _pressedColor, 0, 0);
//            }
//            _height -= UDpi.toPixel(PRESS_Y);
//            
//        }
//        UDraw.drawRoundRectFill(canvas, paint,
//                                new RectF(_pos.x, _pos.y, _pos.x + size.width, _pos.y + _height),
//                                UDpi.toPixel(BUTTON_RADIUS), _color, 0, 0);
//        
//        // 画像
//        if (mImage != null) {
//            float baseX = 0, baseY = 0;
//            
//            switch(mImageAlignment) {
//            case None:
//                baseX = 0;
//                baseY = (size.height - mImageSize.height) / 2;
//                break;
//            case CenterX:
//                break;
//            case CenterY:
//                break;
//            case Center:
//                baseX = (size.width - mImageSize.width) / 2;
//                baseY = (size.height - mImageSize.height) / 2;
//                break;
//            case Left:
//                baseX = 50;
//                baseY = (size.height - mImageSize.height) / 2;
//                break;
//            case Right:
//                break;
//            case Right_CenterY:
//                break;
//            }
//            
//            UDraw.drawBitmap(canvas, paint, mImage,
//                             _pos.x + mImageOffset.x + baseX,
//                             _pos.y + mImageOffset.y + baseY,
//                             mImageSize.width, mImageSize.height);
//        }
//        // テキスト
//        if (mText != null) {
//            float y = _pos.y + mTextOffset.y + size.height / 2;
//            if (isPressButton()) {
//                y -= UDpi.toPixel(PRESS_Y) / 2;
//            }
//            UDraw.drawText(canvas, mText, UAlignment.Center, mTextSize,
//                           _pos.x + mTextOffset.x + size.width / 2,
//                           y, mTextColor);
//        }
//        // プルダウン
//        if (pullDownIcon) {
//            UDraw.drawTriangleFill(canvas, paint,
//                                   new PointF(_pos.x + size.width - UDpi.toPixel(13) , _pos.y + size.height / 2),
//                                   UDpi.toPixel(10), 180, PULL_DOWN_COLOR);
//        }
//    }
}
