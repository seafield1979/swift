//
//  test_function_obj.swift
//  swift_test
//
//  Created by Shusuke Unno on 2017/07/04.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestFuncObj {
    
    init() {
        
    }
    
    /**
        2つの値を加算する
        - parameter a:値1
        - parameter b:値2
        - return: aとbの加算値
      */
    func addition(a: Int, b: Int) -> Int {
        return a + b
    }
    
    /**
     sayHello
     */
    func sayHello() {
        print("hello")
    }
    
    func test1() {
        var math: (Int, Int) -> Int = addition
        var val = math(100, 200)
        print("val:" + String(val))
     
        // 引数なし
        let say: () -> Void = sayHello
        say()
    }
}
