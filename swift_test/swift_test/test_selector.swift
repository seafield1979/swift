//
//  test_selector.swift
//  swift_test
//
//  Created by Shusuke Unno on 2017/07/31.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestSelector {
    func test1() {
        let sel1 : Selector = #selector(UNTestSelector.func1(_:))
        let sel2 : Selector = #selector(UNTestSelector.func2(arg1:))
        let sel3 : Selector = #selector(UNTestSelector.func3(arg1: arg2:))
        
    }
    
    func test2() {
        
    }
    
    func test3() {
        
    }
    
    
    @objc func func1( _ arg1 : Int) {
        print("func1:" + arg1.description)
    }
    
    @objc func func2( arg1 : Int) {
        print("func2:" + arg1.description)
    }
    @objc func func3( arg1 : Int, arg2 : String) {
        print("func3:" + arg1.description + " " + arg2)
    }
    
}
