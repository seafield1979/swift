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
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.translateBy(x: -frame.origin.x, y: -frame.origin.y)
            
            if let scrollView = self as? UIScrollView {
                context.translateBy(x: -scrollView.contentOffset.x, y: -scrollView.contentOffset.y)
            }
            
            layer.render(in: context)
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
        self.layer.render(in: context!)
        
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // contextを閉じる.
        UIGraphicsEndImageContext()
        
        return capturedImage
    }
}
