//
//  test_sequence.swift
//  swift_test
//    Sequenceプロトコルのサンプル
//  Created by Shusuke Unno on 2017/07/27.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

/**
   Sequenceプロトコル
    public protocol Sequence {
        public func makeIterator() -> Self.Iterator
    }
 */

// 整数値のイテレータ
class Sequence1 : Sequence {
    var list : [Int]
    init(list : [Int]) {
        self.list = list
    }

    // Sequenceプロトコルでは makeIterator メソッドを実装することで for-in でイテレートできるようになる
    public func makeIterator() -> AnyIterator<Int?> {
        // カウンタはイテレータが作成されるたびに初期化される
        var count = 0
        return AnyIterator {
            if self.list.count <= count {
                // nilを返したら終了
                return nil
            }
            let element = self.list[count]
            count += 1
            
            return element
        }
    }
}

// 文字列配列のシーケンス
class Sequence2 : Sequence {
    var list : [String]
    init(list : [String]) {
        self.list = list
    }
    
    // Sequenceプロトコルでは makeIterator メソッドを実装することで for-in でイテレートできるようになる
    public func makeIterator() -> AnyIterator<String?> {
        // カウンタはイテレータが作成されるたびに初期化される
        var count = 0
        return AnyIterator {
            if self.list.count <= count {
                // nilを返したら終了
                return nil
            }
            let element = self.list[count]
            count += 1
            
            return element
        }
    }
}

// 文字列を１文字ずつ返すイテレータ
class Sequence3 : Sequence {
    var text : String
    init(text : String) {
        self.text = text
    }
    
    // Sequenceプロトコルでは makeIterator メソッドを実装することで for-in でイテレートできるようになる
    public func makeIterator() -> AnyIterator<String?> {
        // カウンタはイテレータが作成されるたびに初期化される
        var count = 0
        let characters = text.characters.map { String($0) } // String -> [String]

        return AnyIterator {
            if characters.count <= count {
                // nilを返したら終了
                return nil
            }
            let element = characters[count]
            count += 1
            
            return element
        }
    }
}


class UNTestSequence {
    // 整数値配列のイテレータ
    func test1() {
        let list1 = Sequence1(list: [1,2,3,4,5])
        
        for value in list1 {
            if value != nil {
                print(value!.description)
            }
        }
    }
    
    // 文字列配列のイテレータ
    func test2() {
        let list1 = Sequence2(list: ["apple", "orange", "banana", "cherry", "grape"])
        
        for value in list1 {
            if value != nil {
                print(value!.description)
            }
        }
    }
    
    // 文字列を１文字づつ切り出すイテレータ
    func test3() {
        let list = Sequence3(text: "abcdeあいうえお")
        for value in list {
            if value != nil {
                print(value!)
            }
        }
    }
}

