//
//  test_generator.swift
//  swift_test
//      ジェネレーターのサンプル
//      ジェネレータープロトコルを実装したクラスは for a in b の b の部分に指定できるようになる
//  Created by Shusuke Unno on 2017/07/27.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestGenerator {
    func test1() {
        let text = "いろはにほへと ちりぬるを\nわかよたれそ つねならむ\nういのおくやま けふこえて\nあさきゆめみし よひもせず"
        let generator1 = LineGenerator(text: text)
        print(generator1.next() ?? "") //=> いろはにほへと ちりぬるを
        print(generator1.next() ?? "") //=> わかよたれそ つねならむ
        print(generator1.next() ?? "") //=> ういのおくやま けふこえて
        print(generator1.next() ?? "") //=> あさきゆめみし よひもせず
        print(generator1.next() ?? "") //=> nil
    }
    
    func test2() {
//        let text = "いろはにほへと ちりぬるを\nわかよたれそ つねならむ\nういのおくやま けふこえて\nあさきゆめみし よひもせず"
//        let generator1 = LineGenerator(text: text)
//        
//        for line in generator1 {
//            print(line ?? "")
//        }
    }
}


// 使用例
// 文字列を各行を返すgeneratorはこんな感じで実装する。
class LineGenerator: IteratorProtocol {
    typealias Element = String
    
    var lines: [String]
    
    init(text: String) {
        self.lines = text.components(separatedBy: "\n")
    }
    
    func next() -> Element? {
        return lines.isEmpty ? nil : lines.remove(at: 0)
    }
}

