//
//  test_preprocesser.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/08/25.
//  Copyright © 2016年 SunSunSoft. All rights reserved.
//

import Foundation

// プリプロセッサ用の定義はプロジェクト設定の
// [Build Settings] - [Swift Compilar - Custom Flags] - [Other Swift Flags]
// 以下にある Debug / Relase に
// -D DEBUG 
// を追加する

// プリプロセッサーのテスト
#if HOGE
    func hoge1(){
        print("hoge1 1")
    }
#elseif DEBUG
    func hoge1(){
        print("hoge1 2")
    }
#else
    func hoge1(){
        print("hoge1 3")
    }
#endif

// iPhoneシミュレータでのみの処理
#if os(iOS) && arch(i386)
    // do something
#endif