//
//  test_datetime.swift
//  swift_test
//
//  Created by Shusuke Unno on 2017/08/29.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

public class UNTestDate {
    
    // Date, Calendar インスタンスを作成
    public func test1() {
        let calendar = Calendar(identifier: .gregorian)
        let date1 = Date()
        let date2 = calendar.date(from: DateComponents(year: 2016, month: 10, day: 1))
        // -> 2016年10月1日 0時0分
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
        print(df.string(from: date1))
        
        df.dateFormat = "yyyy年 MM月 dd日"
        print(df.string(from: date2!))
    }
    
    // 指定の時間でDateを作成
    public func test2() {
        
        let cal : Calendar = Calendar(identifier: .gregorian)       // グレゴリアン歴のカレンダー
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
        
        // 現在の時間
        let date1 = Date()
        print("now: " + df.string(from: date1))
        
        // 60秒*60分 = １時間後
        let date2 = Date.init(timeInterval: 60*60, since: date1)
        print("+1hour: " + df.string(from: date2))
        
        // -60秒*60分*24時間 = 1日後
        let date3 = Date.init(timeInterval: 60*60*24, since: date1)
        print("+1day: " + df.string(from: date3))
        
        // -60秒*60分*24時間*7日 = １週間後
        let date4 = Date.init(timeInterval: 60*60*24*7, since: date1)
        print("+1week: " + df.string(from: date4))
        
        // カレンダーを使うパターン
        // 1日後
        let date21 = cal.date(byAdding: .day, value: 1, to: cal.startOfDay(for: date1))!
        print(df.string(from: date21))
        
        // 1週間後
        let date22 = cal.date(byAdding: .day, value: 7, to: cal.startOfDay(for: date1))!
        print(df.string(from: date22))
        
        // 1ヶ月後
        let date23 = cal.date(byAdding: .month, value: 1, to: cal.startOfDay(for: date1))!
        print(df.string(from: date23))
        
        // 1日前
        let date24 = cal.date(byAdding: .day, value: -1, to: cal.startOfDay(for: date1))!
        print(df.string(from: date24))
        
        // １時間後
        let date25 = cal.date(byAdding: .hour, value: 1, to: cal.startOfDay(for: date1))!
        print(df.string(from: date25))
        
    }

    // Dateから年月日等の各要素を取得する
    public func test3() {
        let date = Date()
        
        let cal : Calendar = Calendar(identifier: .gregorian)       // グレゴリアン歴のカレンダー
        let year = cal.component(.year, from: date)
        let month = cal.component(.month, from: date)
        let day = cal.component(.day, from: date)
        let hour = cal.component(.hour, from: date)
        let min = cal.component(.minute, from: date)
        let sec = cal.component(.second, from: date)
        
        print( String(format: "%d/%d/%d %d:%d:%d", year, month, day, hour, min, sec))
        
    }

    public func test4() {
        
    }
    
    public func test5() {
        
    }

}
