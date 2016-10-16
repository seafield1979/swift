//
//  test_class_advance.swift
//  swift_test
//
//  Created by SunSunSoft on 2015/03/05.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    更に進んだクラスの使い方
    ・継承
        継承で親クラスの機能を引き継いだ小クラスを作れる

    ・オーバーライド
    ・タイプ・プロパティとタイプ・メソッド

    ・クラスの判定（あるクラスを継承しているかどうか）
        あるクラスを継承しているかを判定するには  as? を使用する
        if let sub1 = object1 as? SubClass {
        }

        もしくは is演算子を使用する
        if sub1 is SubClass {

        }

    ・クラスの判定（特定のクラスかどうか） Objective-cのisMemberOfClass:メソッドと同じ
        if sub1.dynamicType === SubClass.self

    ・同一インスタンスの判定
        var monsterA = Monster()
        monsterA.name = "スライム"
        var monsterB = monsterA

        if monsterA === monsterB {
        println("同じインスタンス")
        }
        if monsterA !== monsterB {
        println("同じインスタンスではない")
        }
 */
import Foundation

// MARK: - 継承
class Parent1{
    var position : CGRect
    init() {
        self.position = CGRect(x: 1, y: 2, width: 3, height: 4)
    }
    func hoge() {
        print("Parent1:hoge")
    }
}

class Child1 : Parent1{
    var name : String?
    
    override init() {
        super.init()
        self.name = ""
    }
    
    func test1() {
        // 親クラスのメンバの参照、メソッドの呼び出し
        self.hoge()
        print("position: \(position)")
    }
}

// MARK: - オーバーライド
/*
    Parent2のinit,hogeを子クラスのChild2でオーバーライドする
 */
class Parent2{
    init(){
        print("Parent2:init")
    }
    func hoge(){
        print("Parent2:hoge")
    }
}

class Child2 : Parent2 {
    override init(){
        super.init()
        print("Child2:init")
    }
    override func hoge(){
        super.hoge()    // 親クラスのメソッドを呼び出す
        print("Child2:hoge")
    }
    func test1() {
        self.hoge()
    }
}

// MARK: - オーバーライド禁止(@final)
class Parent3{
    final func hoge(){
        
    }
}

class Child3 : Parent3 {
//    override func hoge(){     // <- オーバーライド禁止に引っかかってエラーんなる
//        
//    }
}

// MARK: クラス判定
class UNTestClassAdvance
{
    init() {
    }
    
    func test1() {
        // 継承
        print("test_class2")
        let class2 : Child1 = Child1()
        class2.test1()
        
        // オーバーライド
        let class22 : Child2 = Child2()
        class22.test1()
    }
    
    
    func test2() {
        // あるクラスを継承しているかを判定
        print("\nInherit check")
        let array = [Child1(), Parent1(), Parent3()] as [Any];
        
        for obj in array {
            print("----")
            if obj is Child1 {
                print("obj is Child1")
            }
            if obj is Parent1 {
                print("obj is Parent1")
            }
            if obj is Parent3 {
                print("obj is Parent3")
            }
        }
        
        // 同一インスタンスのチェック
        print("Instance same check")
        let obj1 : AnyObject = array[1] as AnyObject;
        for obj in array {
            print("----")
            // todo
//            if obj1 === obj {
//                print("obj1 is instance of \(NSStringFromClass(type(of: (obj) as AnyObject)))")
//            }
        }
    }
    
    
    // クラスのキャスト
    func test3() {
        class Test3P1 {
            init() {
                
            }
            func goStraight() {
                print("P1:goStraight ", terminator: "")
            }
        }
        // 子クラス
        class Test3C1 : Test3P1{
            override init() {
                
            }
            override func goStraight() {
                super.goStraight()
                print("C1:goStraight ", terminator: "")
            }
            func goBack(){
                print("C1:goBack ", terminator: "")
            }
        }
        // 孫クラス
        class Test3G1 : Test3C1 {
            override init() {
                
            }
            override func goStraight() {
                super.goStraight()
                print("G1:goStraight ", terminator: "")
            }
            override func goBack() {
                super.goBack()
                print("G1:goBack ", terminator: "")
            }
            func goThrough(){
                print("G1:goThrough ", terminator: "")
            }
        }
        
        print("---- test3 ----")
        var p1 : Test3P1 = Test3P1()
        let c1 : Test3C1 = Test3C1()
        let g1 : Test3G1 = Test3G1()
        
        print("---- 1 ----")
        let p2 : Test3P1 = c1       // p2はインスタンスはc1だけど、Test3P1のインターフェイスに制限される
        p2.goStraight()
//        p2.goBack()       // Test3P1にgoBack()は実装されていないのでエラーになる
        
        print("\n---- 2 ----")
        let p3 : Test3P1 = g1
        p3.goStraight()
//        p3.goBack()         // Test3P1にgoBack()は実装されていないのでエラーになる
        
        print("\n---- 3 ----")
        let c2 : Test3C1 = g1
        c2.goStraight()
        print("")
        c2.goBack()
//        c2.goThrought()       // Test3C1にgoThrough()は実装されていないのでエラーになる
        
//        var c3 : Test3C1 = p1     // 子クラス変数に親クラスのインスタンスは入れない
//        var g2 : Test3G1 = p1     // 孫クラス変数に親クラスのインスタンスは入れない
        
    }
}


// MARK: - タイププロパティとタイプメソッド
