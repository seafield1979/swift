//
//  test_tuple.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/09/01.
//  Copyright © 2016年 sunsunsoft. All rights reserved.
//
//  タプルのテスト

import Foundation

class UNTestTuple {

    func test1() {
        // 名前なしタプル
        let item = ("ジュース", 100, 0.08, 108)
        print("商品名=\(item.0), 税抜き価格=\(item.1)円, 消費税=\(item.2 * 100)%, 税込み価格=\(item.3)円")
        // 商品名=ジュース, 税抜き価格=100円, 消費税=8.0%, 税込み価格=108円
        
        // 複数の変数をまとめて宣言するタプル
        let (name, price, tax, priceWithTax) = ("ジュース", 100, 0.08, 108)
        print("商品名=\(name), 税抜き価格=\(price)円, 消費税=\(tax * 100)%, 税込み価格=\(priceWithTax)円")
        
        // 名前つきタプル
        let item2 = (name:"ジュース", price:100, tax:0.08, priceWithTax:108)
        print("商品名=\(item2.name), 税抜き価格=\(item2.price)円, 消費税=\(item2.tax * 100)%, 税込み価格=\(item2.priceWithTax)円")
    }

    // メソッドの戻り値を複数持たせる
    func test2() {
        // 引数が１つの場合は要素が１つのタプルを返している
        func inner1() -> (Int) {
            return 1
        }
        
        var ret1 = inner1()
        print("ret1: \(ret1)")
        
        // 引数が２つのタプル
        func inner2() -> (Int, String) {
            return (2, "syutaro2")
        }
        
        var ret2 = inner2()
        print("ret2: \(ret2.0) \(ret2.1)")
        
        // 名前つきタプル
        func inner3() -> (number:Int, name:String) {
            return (number:3, name:"syutaro3")
        }
        let ret3 = inner3()
        print("ret3: \(ret3.number) \(ret3.name)")
    }
    
    // タプルの値を更新できるかのテスト
    func test3() {  
        let hoge = CHoge(name: "hoge", age: 14)
//        var tuple1 = (name : "hoge", age : 10, hoge: nil) エラー タプルにnilは設定できない
        var tuple1 = (name : "hoge", age : 10, hoge: hoge)
        
        tuple1.name = "shutaro"
        tuple1.age = 20
        tuple1.hoge = CHoge(name: "hoge2", age:17)
        
        print(tuple1)
    }
}
