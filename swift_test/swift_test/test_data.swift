//
//  test_data.swift
//  swift_test
//  テストデータ用のクラス、構造体
//  Created by Shusuke Unno on 2017/07/27.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

public class CHoge {
    var name : String
    var age : Int
    
    init(name: String, age : Int) {
        self.name = name
        self.age = age
    }
    var description : String {
        get {
            return "name:" + name + " age:" + age.description
        }
    }
}

public struct SHoge {
    var name : String
    var age : Int
    
    var description : String {
        get {
            return "name:" + name + " age:" + age.description
        }
    }
}
