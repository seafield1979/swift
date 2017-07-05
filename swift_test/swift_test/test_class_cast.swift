//
//  test_class_cast.swift
//  swift_test
//  クラスのアップキャストダウンキャスト、型チェック
//  Created by Shusuke Unno on 2017/07/05.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class Food {
    func printName(){
        print("Food")
    }
}

class Noodle : Food {
    override func printName() {
        print("Noodle")
    }
}

class Curry : Food {
    override func printName() {
        print("Curry")
    }
}

// 食べ物とは関係ないクラス
class Dog {
    func printName() {
        print("Dog")
    }
}

class UNTestCast {
    // アップキャストのテスト
    func test1() {
        let noodle = Noodle()
        let curry = Curry()
        let dog = Dog()
        
        let food1 = noodle as Food
        let food2 = curry as Food
//        let food3 = dog as Food       // エラー。親クラスへ以外にはアップキャストできない
        
        food1.printName()
        food2.printName()
    }
    
    // ダウンキャストのテスト
    func test2() {
        // ダウンキャスト成功例
        let food1:Food = Noodle()       // Noodleのインスタンスをアップキャストしてfood1に設定
        let noodle = food1 as? Noodle    // ダウンキャスト
        noodle?.printName()
        
        // ダウンキャスト失敗例
        // 関係のないクラスをダウンキャストしようとすると失敗する、がオプショナル型なのでエラーにならない
        let dog = Dog()
        let noodle2 = dog as? Noodle
        noodle2?.printName()            // 何も実行されない
        
        // ダウンキャスト失敗例2
        // 強制ダウンキャストに失敗して実行時エラーが起きてプログラムが停止する
//        let noodle3 = dog as! Noodle  // 実行時エラー(EXC_BAD_INSTRUCTION)
//        noodle3.printName()
    }
    
    // 型チェック
    func test3() {
        let food1 = Noodle()
        let food2 = Curry()
        
        // food1
        if food1 is Noodle {
            print("food1 is Noodle")
        }
        if (food1 is Food) {
            print("food1 is Food")
        }
        if (food1 is Curry) {
            print("food1 is Curry")
        }
        
        // food2
        if food2 is Noodle {
            print("food2 is Noodle")
        }
        if (food2 is Food) {
            print("food2 is Food")
        }
        if (food2 is Curry) {
            print("food2 is Curry")
        }
    }
}
