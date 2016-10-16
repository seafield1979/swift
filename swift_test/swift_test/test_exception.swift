//
//  test_exception.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/09/06.
//  Copyright © 2016年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestException
{
    // エラーをenumで定義する
    // ErrorTypeを継承する必要がある
    enum MyError : Error {
        case hogeError1
        case hogeError2
        case hogeError3 (count : Int)
    }
    
    func test1()
    {
        do {
            try hogeFunc(1)
            try hogeFunc(2)
            try hogeFunc(50)
            try hogeFunc(-1)
            try hogeFunc(101)
        }
        catch MyError.hogeError1 {
            print("HogeError1 value is too low")
        }
        catch MyError.hogeError2 {
            print("HogeError2 value is too large")
        }
        catch MyError.hogeError3(let count) {
            print("error \(count)")
        }
        catch {
            print("Unkwnon Error")
        }
    }
    
    // エラー無視
    func test2()
    {
        // try? do~catch が不要になる  エラー発生時、エラーを無視
        // try! do~catch が不要になる  エラー発生時、クラッシュ
        try? hogeFunc(-1)
        try! hogeFunc(1)
        try! hogeFunc(-1)
    }
    
    // defer
    func test3() {
        do {
            defer {
                // エラーがあろうがなかろうが、最後に必ず実行される処理
                print("Fix defer")
            }
            try hogeFunc(1)
            try hogeFunc(101)
            defer {
                // エラーが起きなかった場合のみ、最後に実行される処理
                print("No error defer")
            }
        }
        catch {
            print("Error!!")
        }
    }
    
    // エラーを投げる可能性があるメソッド
    // 関数名定義の最後に throws をつける
    func hogeFunc(_ num : Int) throws {
        
        if num < 0 {
            throw MyError.hogeError1
        }
        else if num > 100 {
            throw MyError.hogeError2
        }
        else if num == 50 {
            throw MyError.hogeError3(count:100)
        }
        print(num)
    }
    
    init() {
        
    }
}
