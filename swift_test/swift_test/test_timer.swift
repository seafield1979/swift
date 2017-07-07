//
//  test_timer.swift
//  swift_test
//
//  Created by Shusuke Unno on 2017/07/07.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestTimer {
    
    private static let NANO_TO_SEC = 1000000000;
    
    // 高精度タイマー
    func test1() -> Int{
        print("UNTestTimer:test1()")
        var info = mach_timebase_info()
        guard mach_timebase_info(&info) == KERN_SUCCESS else { return -1 }
        
        // 開始時間(ナノ秒)
        let startTime : UInt64 = mach_absolute_time()
        
        // 処理時間を計測したい処理
        var sum : Int = 0
        for i in 0...10000 {
            sum += i
        }
        print("sum:" + sum.description)
        
        // 終了時間(ナノ秒)
        let endTime : UInt64 = mach_absolute_time()
        
        let nanos = (endTime - startTime) * UInt64(info.numer) / UInt64(info.denom)
        let sec = Double(nanos) / Double(UNTestTimer.NANO_TO_SEC)
        print("time:" + sec.description)
        return 0
    }
}
