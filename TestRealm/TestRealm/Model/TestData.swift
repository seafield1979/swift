//
//  TestData.swift
//  TestRealm
//
//  Created by Shusuke Unno on 2017/07/18.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//
/*
 Realmのプロパティについて
    基本的に、プロパティは全て『dynamic var』にする必要がある
    List型はletで非オプショナルにする必要がある
    読み出し専用のプロパティは保存されない
*/

import Foundation
import RealmSwift

/// Realmで使える基本的なデータ型
class TestData: Object, NSCopying {
    
    
    dynamic var id : Int = 0
    dynamic var name : String? = nil
    dynamic var age : Int = 0
    dynamic var date : Date? = nil
    
    dynamic var tempId : Int = 0
    
    
    // idをプライマリキーに設定
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //インデックスの指定にはindexedProperties()をoverrideします。
    //インデックスが指定出来るのは整数型、Bool、String、NSDateのプロパティです。
    override static func indexedProperties() -> [String] {
        // titleにインデックスを貼る
        return ["age"]
    }
    
    //保存しないプロパティを指定する場合、ignoredProperties()をoverrideします。
    override static func ignoredProperties() -> [String] {
        return ["tempId"]
    }
    
    // コピーを返す
    // Realmから取得したオブジェクトはそのままだと書き換えることはできないので、コピーをつくって返す
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = TestData()
        copy.age = age
        copy.id = id
        copy.name = name
        copy.date = date
        copy.tempId = tempId
        
        return copy
    }
}
