//
//  test_sequence.swift
//  swift_test
//      自前のクラスにイテレータを実装する
//      イテレータを実装すると for in 構文で全要素にアクセスできる
//  Created by Shusuke Unno on 2017/07/10.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class TestIterator  {
    func test1() {
        let countDown = Cowntdown(10)
        for count in countDown {
            print("\(count!)...")
        }

    }
    func test2() {
        let strList = StringList()
        strList.append("hoge1")
        strList.append("hoge2")
        strList.append("hoge3")
        strList.append("hoge4")
        
        for str in strList {
            print(str ?? "none")
        }
    }
}

// 指定した値から１ずつ減らした数を返すイテレータ
// 例 10 という初期値を与えたら 10,9,8...1 を返す
class Cowntdown : Sequence {
    let start: Int
    
    init(_ start: Int) {
        self.start = start
    }

    func makeIterator() -> AnyIterator<Int?> {
        
        var times = 0
        
        return AnyIterator {
            
            let nextNumber = self.start - times
            if nextNumber <= 0 {
                // nilを返したら終了
                return nil
            }
            
            times += 1
            
            return nextNumber
        }
    }
}

// 文字列のリストを返すイテレータクラス
class StringList : Sequence {
    var list : [String] = []
    
    func append(_ str : String) {
        list.append(str)
    }
    
    func makeIterator() -> AnyIterator<String?> {
        
        var count = 0
        
        return AnyIterator {
            if self.list.count <= count {
                // nilを返したら終了
                return nil
            }
            let str : String? = self.list[count]
            
            count += 1
            
            return str
        }
    }
}
