//
//  test_hash.swift
//  swift_test
//    Dictionaryのキーとして使用出来るクラスを作成
//
//  Created by Shusuke Unno on 2017/07/11.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

// 自作クラスをDictionaryのキーに使用するサンプル
// プロパティをキーにする
class KeyClass {
    
    var value:String
    
    init(_ value:String) {
        
        self.value = value
    }
}

// Dictionaryのキーとして使用するには Hashable プロトコルを実装する
extension KeyClass : Hashable {
    // ハッシュ値を返す
    var hashValue: Int {
        return self.value.hashValue
    }
    
    // ハッシュ値を比較する
    static func == (lhs: KeyClass, rhs: KeyClass) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

// 配列をキーにする
class KeyClass2 {
    var array: Array<Int>
    
    init(_ value : Int, _ value2 : Int) {
        self.array = []
        self.array.append(value)
        self.array.append(value2)
    }
}

extension KeyClass2 : Hashable {
    
    // ハッシュ値を返す
    var hashValue: Int {
        if array.count == 0 {
            return 0
        }
        return self.array.description.hashValue
    }
    
    // ハッシュ値を比較する
    static func == (lhs: KeyClass2, rhs: KeyClass2) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}


class UNTestHashable {
    func test1() {
        var dic : Dictionary<KeyClass, String> = Dictionary()
        
        dic[KeyClass("hoge")] = "hoge value"
        dic[KeyClass("hoge2")] = "hoge2 value"
        dic[KeyClass("hoge3")] = "hoge3 value"
        
        for value : String in dic.values {
            print(value)
        }
    }
    
    // KeyClass2でテスト。配列を元にハッシュを生成
    func test2() {
        var dic : Dictionary<KeyClass2, String> = Dictionary()
        
        dic[KeyClass2(1,1)] = "100"
        dic[KeyClass2(2,0)] = "200"
        dic[KeyClass2(1,1)] = "300"
        
        for value : String in dic.values {
            print(value)
        }
    }
}
