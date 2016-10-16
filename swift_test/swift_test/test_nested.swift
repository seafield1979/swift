//
//  test_nested.swift
//  swift_test
//
//  Created by SunSunSoft on 2015/04/21.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    ネストした型
    Swiftではクラスや構造体、列挙型の定義の中に、さらにクラスや構造体、列挙型を定義することができます。つまり型をネストして定義できるということです。


 */

import Foundation


class UNTestNested {
    // UNTestNested の中に CNest1
    // CNest1 の中に CNest2
    // CNest2 の中に CNest3 がそれぞれ定義されている
    class CNest1 {
        class CNest2 {
            class CNest3 {
                func test1() {
                    print("CNest3:test1")
                }
            }
            var nest3 : CNest3 = CNest3()
            func test1() {
                nest3.test1()
                print("CNest2:test1")
            }
        }
        var nest2 : CNest2 = CNest2()
        func test1() {
            nest2.test1()
            print("CNest1:test1")
        }
    }
    
    var nest1 : CNest1 = CNest1()
//    var nest2 : CNest2 = CNest2()     これはできない。CNest2が使用できるのはCNest1のスコープ内だけ
    init () {
        
    }
    func test1() {
        nest1.test1()
    }
}