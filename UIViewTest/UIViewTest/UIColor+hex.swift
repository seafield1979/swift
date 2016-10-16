//
//  UIColor+hex.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/09/01.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func hexStr (hexStr : NSString, alpha : CGFloat) -> UIColor {
        let hexStr2 = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr2 as String)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
}