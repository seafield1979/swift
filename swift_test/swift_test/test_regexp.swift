//
//  test_regexp.swift
//  swift_test
//    正規表現のサンプル
//  Created by Shusuke Unno on 2017/07/30.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

/**
 String の機能拡張(正規表現)
 
 http://qiita.com/KikurageChan/items/807e84e3fa68bb9c4de6
 */
extension String {
    //絵文字など(2文字分)も含めた文字数を返します
    var count: Int {
        let string_NS = self as NSString
        return string_NS.length
    }
    
    //正規表現の検索をします
    func pregMatche(pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.count > 0
    }
    
    //正規表現の検索結果を利用できます
    // 引数の matches に結果が入る
    func pregMatche(pattern: String, options: NSRegularExpression.Options = [], matches: inout [String]) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let targetStringRange = NSRange(location: 0, length: self.count)
        let results = regex.matches(in: self, options: [], range: targetStringRange)
        for i in 0 ..< results.count {
            for j in 0 ..< results[i].numberOfRanges {
                let range = results[i].rangeAt(j)
                matches.append((self as NSString).substring(with: range))
            }
        }
        return results.count > 0
    }
    
    //正規表現の置換をします
    func pregReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String
    {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.count), withTemplate: with)
    }
}

class UNTestRegExp {
    // 基本
    func test1() {
//        let text = "Swwwwift"
//        let patternText = "Sw*ift"
        let text = "hoge (123)"
        let patternText = "hoge \\(123\\)"
    
        if text.pregMatche(pattern: patternText){
            print(text + " " + patternText)
            print("マッチしました")
        }else{
            print("マッチしていません")
        }
    }
    
    // マッチング文字列を取得
    func test2() {
        let text = "hoge 123"
        let patternText = "(.*) (.*)"
        var matches : [String] = []
        
        if text.pregMatche(pattern: patternText, matches: &matches) {
            // マッチした文字列を取得
            // [0] マッチ部分全体
            // [1...] マッチ文字列1...
            for matche in matches {
                print("matche:" + matche)
            }
        }
    }
    
    // 置換
    func test3() {
        let text = "hoge 123"
        let patternText = "\\d+"

        let output = text.pregReplace(pattern: patternText, with: "hoge")
        print("置換後:" + output)
    }
    
    // その他
    func test4() {
        let text = "¥n                        UWindowCallbacks windowCallbacks"
        let patternText = "([¥n|\\s]*)(\\w+)\\s+(\\w+)"
//                let patternText = "([¥n|\\s]*)(\\w+).*"
        var matches : [String] = []
        
        if text.pregMatche(pattern: patternText, matches: &matches){
            print(text + " " + patternText)
            print("マッチしました")
        }else{
            print("マッチしていません")
        }

        
    }
}
