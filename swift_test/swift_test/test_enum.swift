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
    
    // 列挙型自身の値を変更する
    enum Signal4 : Int {
        case blue = 1   // 青
        case yellow     // 黄
        case red        // 赤
        
        // 次の列挙値に変更
        mutating func next() {
            switch self {
            case .blue:
                self = .yellow
            case .yellow:
                self = .red
            case .red:
                self = .blue
            }
        }
        
        // 前の列挙値に変更
        mutating func prev() {
            switch( self ) {
            case .blue:
                self = .red
            case .yellow:
                self = .blue
            case .red:
                self = .yellow
            }
        }
    }
    
    // 文字列型
    enum String1 : String, EnumEnumerable{
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
    
    // 次の値、前の値に遷移できる
    enum SignalMove : Int, EnumEnumerable {
        case blue
        case yellow
        case red
        
        static let mapper: [SignalMove: String] = [
            .blue: "青",
            .yellow: "黄",
            .red: "赤"
        ]
        var string: String {
            return SignalMove.mapper[self]!
        }
        
        // 次の列挙値に変更
        mutating func next() {
            let next = (self.rawValue + 1) % SignalMove.count
            self = SignalMove.cases[next]
        }
        // 前の列挙値に変更
        mutating func prev() {
            let prev = (self.rawValue - 1 + SignalMove.count) % SignalMove.count
            self = SignalMove.cases[prev]
        }
    }
    
    init () {
    }
    
    func test1() {
        print("UNTestEnum.test1")
        // 参照
        print(Signal3.blue) // 整数値
        print(String1.Kage) // 文字列
        
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
    
    // 次の値、前の値を参照
    func test3() {
        var signal1 = Signal4.red
        // next
        print("next")
        print(signal1.rawValue.description)
        signal1.next()
        print(signal1.rawValue.description)
        signal1.next()
        print(signal1.rawValue.description)
        signal1.next()
        print(signal1.rawValue.description)
        
        // prev
        print("prev")
        signal1 = Signal4.red
        print(signal1.rawValue.description)
        signal1.prev()
        print(signal1.rawValue.description)
        signal1.prev()
        print(signal1.rawValue.description)
        signal1.prev()
        print(signal1.rawValue.description)
        signal1.prev()
    }
    
    // 拡張enum (EnumEnumerable)のテスト
    // enum で全要素をforループで回したり、要素数を参照したり、インデックスで要素を取得したりできる
    func test4() {
        print("count:" + String1.count.description)
        
        // forループで全要素を参照
        for str in String1.cases {
            print(str)
        }
        
        // インデックスで要素を参照
        print("[0]:" + String1.cases[0].rawValue)
        print("[1]:" + String1.cases[1].rawValue)
        print("[2]:" + String1.cases[2].rawValue)
    }
    
    // 次へ、前へをスマートに行う
    func test5() {
        print("next")
        var signal1 = SignalMove.blue
        print(signal1.string)
        signal1.next()
        print(signal1.string)
        signal1.next()
        print(signal1.string)
        signal1.next()
        print(signal1.string)
        
        print("prev")
        signal1 = SignalMove.blue
        print(signal1.string)
        signal1.prev()
        print(signal1.string)
        signal1.prev()
        print(signal1.string)
        signal1.prev()
        print(signal1.string)
    }
}
