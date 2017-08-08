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
        print( String(format: "timer: %.7f s", sec))
        print( String(format: "timer: %.7f ms", (sec * 1000)))
        return 0
    }
    
    // 高精度タイマー2
    // CFAbsoluteTimeGetCurrent
    func test2() {
        let title = "test2"
        let startTime = CFAbsoluteTimeGetCurrent()
        
        for i in 0...100 {
            print(i.description)
        }
        
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for \(title): \(timeElapsed) seconds")
        print("Time elapsed for \(title): \(timeElapsed * 1000) msec")
    }
    
    // 指定したメソッドの処理時間を表示する
    func test3() {
        printTimeElapsedWhenRunningCode(title: "isEven", operation: isEven(x: 1))
        
        printTimeElapsedWhenRunningCode(title: "sum", operation: calcSum(count: 100000))
    }
    
    // 引数で与えたメソッドの処理時間を表示する
    func printTimeElapsedWhenRunningCode <T> (title: String, operation: @autoclosure () -> T) {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for \(title): \(timeElapsed) seconds")
    }
    
    func isEven(x: Int) -> Bool {
        return x % 2 == 0
    }
    
    func calcSum(count: Int) -> Int {
        var sum : Int = 0
        
        for cnt in 0..<count {
            sum += cnt
        }
        
        return sum
    }
}
