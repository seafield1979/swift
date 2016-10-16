//
//  UIView+captureImage.swift
//  MyImageView
//
//  Created by Shusuke Unno on 2016/09/08.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

extension UIView {
    func image() -> UIImage {
        var image: UIImage!
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.mainScreen().scale)
        
        if let context = UIGraphicsGetCurrentContext() {
            CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y)
            
            if let scrollView = self as? UIScrollView {
                CGContextTranslateCTM(context, -scrollView.contentOffset.x, -scrollView.contentOffset.y)
            }
            
            layer.renderInContext(context)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        } else {
            image = UIImage()
        }
        
        return image
    }
    
    func getImage() -> UIImage {
        // キャプチャする範囲を取得.
        let rect = self.bounds
        
        // ビットマップ画像のcontextを作成.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        
        // 対象のview内の描画をcontextに複写する.
        self.layer.renderInContext(context!)
        
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // contextを閉じる.
        UIGraphicsEndImageContext()
        
        return capturedImage
    }
}
