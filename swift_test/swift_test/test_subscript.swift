//
//  test_subscript.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/08/25.
//  Copyright © 2016年 SunSunSoft. All rights reserved.
//

import Foundation

// Subscriptのテストクラス
// 配列でなくてもオブジェクト変数[数字] のような書式でアクセスできる
class UNTestSubscript
{
    var names : [String]
    init() {
        self.names = []
    }
    
    subscript(index: Int) -> String {
        // hensuu[index] で参照された時の処理 String を返す
        get {
            if index < 0 || index >= names.count {
                return ""
            }
            return names[index]
        }
        // hensuu[index] = name で代入された時の処理
        set(name) {
            if index < 0 || index > names.count {
                return
            }
            names.insert(name, at: index)
        }
    }
}

// １次元配列を２次元配列形式でアクセスできる
class UNTestSubscript2
{
    var kuku : [Int]    // 内部では１次元配列
    
    init() {
        self.kuku = Array(repeating: 0, count: 81)
        //九九を作成
        for i in 0...8 {
            for j in 0...8 {
                kuku[i*9 + j] = (i+1)*(j+1)
            }
        }
    }
    subscript(row:Int, column:Int) -> Int {
        get {
            if row >= 1 && row <= 9 && column >= 1 && column <= 9{
                return kuku[(row - 1) * 9 + (column - 1)]
            }
            return 0
        }
    }    
}


class SubscriptSample {
    var userNames: Array<String>
    
    init(){
        userNames = []
    }
    
    // subscript の受け取る引数は [] の中で渡すもの
    subscript(index: Int) -> String {
        get {
            assert(userNames.count > index, "index out of range")
            return userNames[index] + " さん 昨夜はお楽しみでしたね"
        }
        set(name) {
            assert(0 > index || userNames.count >= index, "index out of range")
            userNames.insert(name, at: index)
        }
    }
}

