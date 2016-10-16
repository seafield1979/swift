//
//  test_cgvalue.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/08/30.
//  Copyright © 2016年 sunsunsoft. All rights reserved.
//
// CG(CoreGraphics)系のテスト

import Foundation


class UNCGTest
{
    var pos_x : CGFloat
    var pos : CGPoint
    var rect : CGRect
    
    init() {
        // CGFloat
        pos_x = 1.0
        let int1 : Int = Int(pos_x)
        pos_x = CGFloat(int1)
        
        // CGPoint
        pos = CGPoint(x:1.0, y:2.0)
        pos = CGPoint(x: 1.0, y: 2.0)
        
        // CGRect
        rect = CGRect(x:0, y:0, width: 100.0, height: 150.0)
        rect = CGRect(x: 0,y: 0,width: 100,height: 150)
        rect.origin = CGPoint(x: 100, y: 200)
        rect.size = CGSize( width: 500, height: 1000 )
    }
}
