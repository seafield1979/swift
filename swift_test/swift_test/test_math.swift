//
//  test_math.swift
//  swift_test
//
//  Created by Shusuke Unno on 2017/07/07.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation
import CoreGraphics

class UNTestMath {
    
    public static let RADIAN : CGFloat = CGFloat.pi / 180.0
    public func test1() {
        // sin
        for i in 0...360 {
            print("sin:" + i.description + " " + (sin(CGFloat(i) * UNTestMath.RADIAN)).description)
        }
    }
}
