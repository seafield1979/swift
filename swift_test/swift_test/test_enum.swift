//
//  test_enum.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    C言語のenumのようなもの
    
    // 信号機
    enum Signal {
        case Blue       // 青
        case Yellow     // 黄
        case Red        // 赤
    }
    
    // １行に書く場合
    enum Signal {
        case Blue, Yellow, Red
    }

    // 型を指定できる
    enum Signal : Int {
        case Blue       // 青
        case Yellow     // 黄
        case Red        // 赤
    }
    enum SignalS : String {
        case Blue = "青"
        case Yellow = "黄"
        case Red = "赤"
    }

    // メソッドを定義できる
    enum Signal {
        case Blue
        case Yellow
        case Red
        func meaning() -> String {
            switch(self) {
            case .Blue:
                return "進め"
            case .Yellow:
                return "注意"
            case .Red:
                return "止れ"
            }
        }
    }
*/

import Foundation


class UNTestEnum {
    // 信号機
    enum Signal {
        case blue       // 青
        case yellow     // 黄
        case red        // 赤
    }
    
    // １行に書く場合
    enum Signal2 {
        case blue, yellow, red
    }
    
    // 型を指定できる
    enum Signal3 : Int {
        case blue = 1   // 青
        case yellow     // 黄
        case red        // 赤
    }
    
    // 文字列型
    enum String1 : String {
        case Hoge = "hoge"
        case Mage = "mage"
        case Kage = "kage"
    }
    
    // メソッドを定義できる
    enum SignalF {
        case blue
        case yellow
        case red
        func meaning() -> String {
            switch(self) {
            case .blue:
                return "進め"
            case .yellow:
                return "注意"
            case .red:
                return "止れ"
            }
        }
    }
    
    init () {
        
    }
    
    func test1() {
        print("UNTestEnum.test1")
        // 参照
        print(Signal3.blue)
        print(String1.Kage)
        
        // 関数呼び出し
        let s = SignalF.yellow
        print("meaning:" + s.meaning())
        
        let sig3 : Signal3 = Signal3.init(rawValue:1)!
        print("sig3:" + sig3.rawValue.description)
        let sigVal : Int = sig3.rawValue
    }
    
    func test2(_ mode : Int) {
        // 関連値
        
        /* 乗り物 */
        enum Vehicle {
            case bicycle         // 自転車
            case motorbike(Int)  // バイク（排気量）
            case car(Int, Bool)  // 車（排気量, オートマ）
        }
        
        var vehicle = Vehicle.bicycle
        if mode == 1 {
            vehicle = .motorbike(750)
        } else {
            vehicle = .car(1600, true)
        }
        
        
        switch vehicle {
        case .bicycle:
            print("自転車")
        case .motorbike(let engine) where engine <= 50:
            print("オートバイ:原付")
        case .motorbike(let engine) where engine <= 125:
            print("オートバイ:小型")
        case .motorbike(let engine) where engine <= 400:
            print("オートバイ:中型")
        case .motorbike(let engine):
            print("オートバイ:大型")
        case .car(let engine, let automatic) where engine <= 660:
            print("軽自動車:" + (automatic ? "オートマ" : "マニュアル"))
        case .car(let engine, let automatic):
            print("普通車 \(engine)cc:" + (automatic ? "オートマ" : "マニュアル"))
        }
    }
    
}
