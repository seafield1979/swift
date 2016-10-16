//
//  test_struct.swift
//  swift_test
//
//  Created by SunSunSoft on 2015/04/07.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    構造体
    主にデータを保持するために特化したクラス。
    機能的には継承、デストラクタが使用できないクラス。

    構造体のプロパティを変更するメソッドは先頭にmutatingを付加する
 */

import Foundation

class UNTestStruct {
// MARK: 自分でイニシャライザを用意する
    struct Enemy {
        var x : Float
        var y : Float
        var name : String
        var birth : Date?     // オプショナル
        init(){
            x = 0
            y = 0
            name = "no name"
            birth = nil
        }
        func description() {
            print("x:\(x) y:\(y) name:\(name) birth:\(birth)")
        }
    }
    var enemy : Enemy = Enemy()
    
    init(){
        enemy.x = 10
        enemy.y = 20
        enemy.name = "angry bird"
        enemy.birth = Date()
    }
    
    func test1(){
        print("----- struct1 -----")
        print(enemy)
        enemy.description()
    }
    
// MARK: test2 自動で生成されたイニシャライザを使用する
    struct Enemy2 {
        var x : Float
        var y : Float
        var name : String
        var birth : Date?     // オプショナル
        func description() {
            print("x:\(x) y:\(y) name:\(name) birth:\(birth)")
        }
        mutating func goUp() {
            y += 10
        }
        mutating func goDown() {
            y -= 10
            if (y < 0) { y = 0 }
        }
    }
    
    func test2() {
        print("----- struct2 -----")
        let enemy2 : Enemy2 = Enemy2(x:12, y:34, name:"donky", birth:Date())
        print(enemy2)
        let bd : Date = enemy2.birth!
        print(bd.description)
    }
    
 }
