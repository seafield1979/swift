//
//  test_extension.swift
//  swift_test
//
//  Created by SunSunSoft on 2015/04/17.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    既存のクラスを拡張できる。Objective-Cのカテゴリーのようなもの。
    IntやString等の基本クラスも拡張できる
    プロパティは追加できない（算出型プロパティは可能）
    
    拡張の方法
    extension 拡張元のクラス名 {
        func メソッドの定義
    }
*/

import Foundation

extension Int {
    // 16進数
    var hex: String {
        return String(self, radix: 16)
    }
    // 8進数
    var oct: String {
        return String(self, radix: 8)
    }
    // 2進数
    var bin: String {
        return String(self, radix: 2)
    }
    
    // メソッド
    func hoge() -> Int {
        return self * 100
    }
}

extension String {
    var dao: String {
        return self + " dao!"
    }
    
    var description2 : String {
        return self + " dao!"
    }
}

// イニシャライザを拡張
// パーソン
struct Person2 {
    let name: String        // 名前
    var email: String       // メールアドレス
    var age: Int            // 年齢
}
extension Person2 {
    init(name:String){
        self.init(name:name, email:"", age:18)
    }
    func description(){
        print("name:\(self.name) email:\(self.email) age:\(self.age)")
    }
    var description2:String {
        return "name:" + self.name + "email:" + self.email + "age:" + self.age.description
    }
    
    // enumを追加してみる
    enum Type1 {
        case hoge, hage, mage
        func japanese() -> String {
            switch(self) {
            case .hoge:
                return "ほげ"
            case .hage:
                return "ハゲ"
            case .mage:
                return "まげ"
            }
        }
    }
    // ageの値によって分類する算出プロパティ
    var type : Type1 {
        if (age < 20) {
            return Type1.hoge
        } else if (age < 40) {
            return Type1.mage
        } else {
            return Type1.hage
        }
    }
}


class UNTestExtension {
    init(){
        
    }
    
    func test1() {
        print("UNTestExtension:test1")
        
        
        print("---- 1 ----")
        print("hex:" + 256.hex)
        print("oct:" + 256.oct)
        print("bin:" + 256.bin)
        print("hoge:" + 256.hoge().description)
        print("syutaro".dao)
        print("syutaro".description2)
        
        print("---- 2 ----")
        var person : Person2 = Person2(name: "syutaro")
        print(person.description())
        print(person.description2)
        
        print("---- 3 ----")
        person.age = 40
        print(person.type.japanese())
    }
}
