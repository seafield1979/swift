//
//  test_dictionary.swift
//  swift_test
//
//  Created by SunSunSoft on 2015/03/10.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    SwiftではMapの代わりにDictionaryという名前
 
    辞書型 Dictionary
    特徴
        宣言時にキーと値の型を宣言できる。ちなみにObjective-CではキーはNSString,値はオブジェクト型だった
        プリミティブ型(Int, Float等)がそのまま入る
        var で宣言するとMutable, letで宣言するとImmutable
        キーに整数型が使用できるので、配列のような使い方もできる。（もしかしたら内部的にはArrayとDictionaryの違いがないのかもしれない）
    
 */

import Foundation

class UNTestDictionary
{
    var dic1 : SharedDictionary<Int, String> = SharedDictionary()
    var dic2 : SharedDictionary<Int, SharedDictionary<Int, String>> = SharedDictionary()
    init() {
        
    }
    
    func test1() {
        // 宣言 Dictionary型
        let d0 : Dictionary<String, Int> = ["Apple1" : 1001, "Orange2": 2001, "Banana3" : 501]
        print(d0)
        
        // 宣言 キーと値の型を宣言できる
        let d1 : [String : Int] = ["Apple" : 100, "Orange": 200, "Banana" : 50]
        print(d1)
        
        // 宣言2 型を指定しないでも宣言できる
        let d2 = ["Apple2" : 10000, "Orange2" : 20000, "Banana2" : 5000]
        print(d2)
        
        // 宣言3 型が混在
        var d3 = ["Apple" : 1000, "Orange" : "2000", 100 : 100] as [AnyHashable : Any]
        print( d3["Apple"] as Any )
        print( d3["Orange"] as Any )
        print( d3[100] as Any )          // インデックスでも参照できる。これが出来るのはすごい
        print(d3)
        
        // 値の変更 キーを指定して値を代入する
        var d4 = ["Apple" : 100, "Orange" : 200]
        d4["Apple"] = 120
        d4["Orange"] = 240
        print(d4)
        
        // 要素の削除  nilを代入
        var d5 = ["Apple" : 100, "Orange" : 200]
        d5["Orange"] = nil      // Orangeの要素は消える
        print(d5)
        
        // 辞書型のコピー
        let d6 = ["Apple" : 100, "Orange" : 200]
        var d62 = d6        // d62はd6をコピーしてできた新しいDictionary
        d62["Apple"] = 130  // これで変わるのはd62だけ
        print("d6" + d6.description)
        print("d62" + d62.description)
        
        // キーだけ取得 Array型
        var d7 = ["Apple" : 100, "Orange" : 200]
        print("d7'keys: " + Array(d7.keys).description);
        
        // イテレーションでループを回す
        print("d7'values: " + Array(d7.values).description)
        for key in d7.keys {
            print("d7_2 \(key):\(d7[key])")
        }
        
        // イテレーションでループを回す(キーと値を取得)
        for (key, value) in d7 {
            print("d7_3 \(key):\(value)")
        }
    }
    
    func test2() {
        var d1 : Dictionary<String ,Int> = Dictionary()
        d1["hoge"] = 100
        d1["hoge2"] = 200
        
        for (key, value) in d1 {
            print("key:" + key + " value:" + value.description)
        }
        
        // 存在しないキーを参照
        print(d1["hoge3"] as Any)
    }
    
    // 参照型の辞書型テスト
    func test3() {
        var dic = getDic1()
        dic[1] = "hoge"
        dic[2] = "hoge2"
        
        dic2[1] = dic1
        dic2[2] = dic1
//        var _dic2 = getDic2(key:1)
        var _dic2 = dic2[1]
        _dic2![1] = "hogehoge"
        
        
        print("dic[1]:" + dic1[1]!)
        
        for key in dic.keys {
            print("dic_key:" + key.description)
        }
    }
    func getDic1() -> SharedDictionary<Int, String> {
        return dic1
    }
    func getDic2(key : Int) -> SharedDictionary<Int, String>? {
        return dic2[key]
    }
}

// 参照型の辞書型
class SharedDictionary<K : Hashable, V> {
    private var dict : Dictionary<K, V> = Dictionary()
    subscript(key : K) -> V? {
        get {
            return dict[key]
        }
        set(newValue) {
            dict[key] = newValue
        }
    }

    // keysを実装
    // 元々のDictionaryのkeysと同じように使用出来る
    var keys : [K] {
        get {
            return Array(dict.keys)
        }
    }
    
    // valuesを実装
    // 元々のDictionaryのvaluesと同じように使用出来る
    var values : [V] {
        get {
            return Array(dict.values)
        }
    }
    
    func getDict() -> Dictionary<K,V> {
        return dict
    }
    
    // すべての要素を削除する
    func removeAll() {
        dict.removeAll()
    }
    
    // 指定したキーの要素を削除する
    func removeValue(forKey: K) {
        dict.removeValue(forKey: forKey)
    }
}
