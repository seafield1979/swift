//
//  NanoTimer.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/08/08.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import Foundation

public class NanoTimer {
    
    // 前回のFPSを計算したときのシステムタイム
    static var preFpsTime : Double = 0
    
    static var fpsCount : Int = 0
    
    // 高精度システム時間を取得する
    public static func getNanoTime() -> CFAbsoluteTime{
        return CFAbsoluteTimeGetCurrent()
    }
    
    // FPSを計算する
    // 前回のFPS計算から1秒経過していたらその間にこのメソッドが呼ばれた回数を返す
    public static func getFps() -> Int {
        fpsCount += 1
        let now = getNanoTime()
        if now - preFpsTime >= 1.0 {
            
            let ret = fpsCount
            preFpsTime = now
            fpsCount = 0
            return ret
        }
        return 0
    }
}
