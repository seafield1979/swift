//
//  test_generics.swift
//  swift_test
//
//  Created by SunSunSoft on 2015/04/21.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    C++のテンプレートのようなもの
    型が違うだけで処理は同じような場合に、ジェネリックでどの型にも対応する処理を作成できる


*/

import Foundation


// MARK:構造体をジェネリクス対応
// 値が重複しない構造体
struct Set<T: Equatable> {      // Equatable は２つの引数が == で比較できるプロトコル
    var items = [T]()
    // 要素数
    var count : Int {
        return items.count
    }
    
    // 要素の追加
    mutating func append(_ item:T) {
        if !self.contains(item) {
            items.append(item)
        }
    }
    
    // 要素の削除
    mutating func remove(_ item:T) {
        if let idx = items.index(of: item) {
            items.remove(at: idx)
        }
    }
    
    // 要素の存在確認
    func contains(_ item: T) -> Bool {
        return items.contains(item)
    }
}

class UNTestGenerics {
    init() {
        
    }
    
    func bigger<T:Comparable>(_ val1: T, val2: T) -> T {
        return val1 > val2 ? val1 : val2
    }
    
    func test1() {
        print("UNTestGenerics:test1")
        print("----- 1 -----")
        let i1 = 10
        let i2 = 20
        print(bigger(i1, val2:i2))
        
        let f1 : Float = 10.0
        let f2 : Float = 20.0
        print(bigger(f1,val2:f2))
        
        let d1 : Double = 10.0
        let d2 : Double = 20.0
        print(bigger(d1, val2:d2))
        
        let s1 : String = "Mickey"
        let s2 : String = "Miffy"
        print(bigger(s1,val2:s2))
    }
    
    /*
     * 構造体のジェネリクス対応
     * いろいろな型で使用できる重複しない配列を作成
     */
    func test2() {
        var party = Set<String>()
        party.append("ルフィ")
        party.append("ゾロ")
        party.append("ナミ")
        party.append("ゾロ")
        print(party.items)
        
        var numbers = Set<Int>()
        numbers.append(10)
        numbers.append(20)
        print(numbers.contains(10))   // true
        print(numbers.items)
    }
    
}
