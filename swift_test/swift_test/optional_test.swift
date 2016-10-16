//
//  optional_test.swift
//  swift_test
//
//  Created by sunsunsoft on 2015/01/23.
//  Copyright (c) 2015年 sunsunsoft. All rights reserved.
//

import Foundation

class Optional1{
    // プロパティ
    var name : String
    let number : Int
    
    //メソッド
    init(name: String, number: Int) {
        self.name = name // 引数の変数名とクラスのプロパティを区別するため、selfをつける
        self.number = number // 定数もinitの中なら設定できる
    }
    
    func hello() -> String {
        return "hello, \(name)"
    }
}
