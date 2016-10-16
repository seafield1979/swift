//
//  test_string.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/08/30.
//  Copyright © 2016年 sunsunsoft. All rights reserved.
//

import Foundation

//
// 正規表現クラス
// http://qiita.com/coa00@github/items/ae9c38dc92f3626dcd19
//
class Regexp {
    let regexp: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        do {
            self.regexp = try NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
        } catch let error as NSError {
            print(error.localizedDescription)
            self.regexp = NSRegularExpression()
        }
    }
    
    // 正規表現を利用した一致判定
    // 使用例 bool = Regexp(正規表現パターン).isMatch(対象文字列)
    // 例: if Regexp("hoge\\d+").isMatch("hoge123") {}
    func isMatch(_ input: String) -> Bool {
        let matches = self.regexp.matches( in: input, options: [], range:NSMakeRange(0, input.characters.count) )
        return matches.count > 0
    }

    // 正規表現を使用したマッチング パターンの中の()でマッチした文字列を取得する
    // 使用方法: let [String] = Regexp(正規表現パターン).matches(マッチング対象の文字列)
    // 例: let matches:[String] = Regexp("hoge(\\d+) (\\d+)").matches("hoge100 200")
    //     matches は配列 ["hoge100 200", "100", "200"] となる
    func matches(_ input: String) -> [String]? {
        let nsInput = input as NSString
        if self.isMatch(input) {
            var results = [String]()
            if let matches = self.regexp.firstMatch(in: nsInput as String, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, input.characters.count))
            {
                for i in 0...matches.numberOfRanges - 1 {
                    results.append(nsInput.substring(with: matches.rangeAt(i)))
                }
            }
            return results
        }
        return nil
    }
    
    // 文字列を置換する
    // 使用方法: Regexp(正規表現パターン).replace(置換対象の文字列, 置換パターン)
    // 例: Regexp("hoge(\\d+).(\\d+)").replace("hoge1.2", "hage$1.$2")
    func replace(_ input: String, replace: String) -> String {
        return input.replacingOccurrences(
            of: pattern,
            with: replace,
            options: NSString.CompareOptions.regularExpression,
            range: nil)
    }
}

class UNTestString
{
    func test1() {
        // 文字列の長さ
        let str = "hoge123"
        print(str.characters.count)
    }
    
    // 正規表現テスト
    func testRegEx() {
        let pattern = "(hoge1) (hoge2)"
        let str = "hoge1 hoge2"
        
        let ret:[String] = Regexp(pattern).matches(str)! //http以下を取得
        print ("--- matches ---")
        ret.forEach { print($0) }
    }
    
    // 正規表現を使った文字列の置換
    func testReplace() {
        let replaceString = Regexp("\\[test\\|([a-z0-9]+)\\|([a-z0-9]+)\\]").replace(
            "[test|hoge|hoge123] [test|huge|huge456]",
            replace:"found : $1 : $2")
        print(replaceString)
    }
}
