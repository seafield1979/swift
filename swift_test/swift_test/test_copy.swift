//
//  test_copy.swift
//  swift_test
//
//  Created by Shusuke Unno on 2017/07/27.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//
// 配列や辞書型、オブジェクトのコピー関連のテスト

import Foundation

class UNTestCopy {
    
    
    // 勘違いを補正
    // Arrayの要素(オブジェクト)を変数に設定した場合、それは参照になる
    // Arrayの要素(構造体)を変数に設定した場合、それはコピーになる
    func test1() {
        // クラスのオブジェクトは変数への代入が参照になる
        let classObj = CHoge(name: "hoge", age: 10)
        let copyObj = classObj
        copyObj.name = copyObj.name + " updated"
        
        print("classObj:" + classObj.description)  // classObj:name:hoge updated age:10
        
        // 構造体のオブジェクトは変数への代入が参照になる
        let structObj = SHoge(name: "hoge2", age: 20)
        var copyObj2 = structObj
        copyObj2.name = copyObj2.name + " updated"
        
        print("structObj:" + structObj.description)  // structObj:name:hoge2 age:20
        
    }
    

    func test2() {
        
    }
    func test3() {
        
    }
    func test4() {
        
    }
    func test5() {
    
    }
    func test6() {
        
    }
}
