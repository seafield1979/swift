//
//  test_closure.swift
//  swift_test
//
//  クロージャーのテスト
//  Created by Shusuke Unno on 2017/07/04.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestClosure {
    /**
     * テスト
     */
    init() {
        
    }
    
    /**
     クロージャーテスト１
     */
    func test1() {
        // クロージャーを使わない
        func add1(a:Int, b:Int) -> Int {
            return a + b
        }
        let addFunc = add1
        let v1 = addFunc(1,2)
        print("v1:" + String(v1))
        
        // クロージャー
        let add = {(a:Int, b:Int) -> Int in
            return a + b
        }
        let v2 = add(10,20)
        print("v2:" + String(v2))
    }
    
    /**
        クロージャテスト2
    */
    func test2() {
        func operate(a: Int, b: Int, function:(Int,Int) -> Int) -> Int {
            return function(a,b)
        }
        
        // クロージャを使わない
        func add(a: Int, b: Int) -> Int {
            return a + b
        }
        let ret = operate(a:1, b:2, function: add)
        print("ret:" + String(ret))
        
        // クロージャを使う
        let ret2 = operate(a:2, b:3, function:{(a: Int, b: Int) -> Int in
            return a + b
        })
        print("ret2:" + String(ret2))
    }
}
