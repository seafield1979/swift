//
//  TestDataDao.swift
//  TestRealm
//
//  Created by Shusuke Unno on 2017/07/19.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import Foundation
import RealmSwift

public class TestDataDao {
    static private var mRealm : Realm? = nil
    
    static func setRealm(_ realm : Realm) {
        mRealm = realm
    }
    
    /**
     全オブジェクト(のコピー)を取得する
     - returns: 全オブジェクトのコピー
     */
    static func selectAll() -> [TestData] {
        // Realmに保存されてるDog型のオブジェクトを全て取得
        let tests : Results = mRealm!.objects(TestData.self)
        
        return Array(tests)
    }
    
    /**
     指定した
     - parameter <#name#>: <##>
     - throws: <#throw detail#>
     - returns: <#return value#>
     */
    static func selectInCase(ids : [Int]) -> [TestData] {
        let results = mRealm!.objects(TestData.self).filter("id In %@", ids)
        
        var ret : [TestData] = []
        for result in results {
            ret.append(TestData(value:result))
        }
        return ret
    }
    
    static func selectNotInCase(ids: [Int]) -> [TestData] {
        let results = mRealm!.objects(TestData.self).filter("NOT (id IN %@)", ids)
        
        return Array(results)
    }
    
    // 複数回のfilterをかける
    static func selectWithFilter() -> [TestData] {
        var results = mRealm!.objects(TestData.self).filter("name contains 'hoge'")
        results = results.filter("age > 10")
        
        return Array(results)
    }
    
    // 最大値を取得する
    static func selectMaxAge() -> Int {
        let max = mRealm!.objects(TestData.self).max(ofProperty: "age") as Int!
        
        return max!
    }
    
    // 最小値を取得する
    static func selectMinAge() -> Int {
        let min = mRealm!.objects(TestData.self).min(ofProperty: "age") as Int!
        
        return min!
    }
    
    // (A AND B) OR (C AND D) ... のテスト
    static func selectMultiInCase() -> [TestData] {
        let names : [String] = ["hoge", "hogehoge2", "chiro"]
        let ages : [Int] = [100, 39, 10]
        
        var filterStr = ""
        for i in 0...1 {
            if i != 0 {
                filterStr += " OR "
            }
            filterStr += String(format: "(name = '%@' AND age = %d)", names[i], ages[i])
        }
        let results = mRealm!.objects(TestData.self).filter(filterStr)
        
        return Array(results)
    }
    
    /**
     指定したIDのオブジェクトを取得
     - parameter id: 選択するオブジェクトのID
     */
    static func selectById(_ id : Int) -> TestData? {
        // 更新対象のオブジェクトを取得
        let result = mRealm!.objects(TestData.self).filter("id = " + id.description).first
        if result == nil {
            return nil
        }
        
        return TestData(value: result)
    }
    
    /**
     nameに指定の文字列が含まれて居るオブジェクトを取得
     - parameter name: nameに含まれて居る文字列
     - returns: 見つかったオブジェクトのコピー
     */
    static func selectByName(_ name : String) -> [TestData]? {
        // 更新対象のオブジェクトを取得
        let results = mRealm!.objects(TestData.self).filter("name contains %@", name)
        if results.count == 0 {
            return nil
        }
        
        return Array(results)
    }
    
    
    
    /**
     オブジェクトを１件追加
     - parameter name: 名前
     - parameter age: 年齢
     - returns: 成功失敗のフラグ
     */
    static func addOne(name : String, age : Int) -> Bool {
        // 追加するデータを用意
        let test = TestData()
        test.name = name
        test.age = age
        test.id = getNextId()
        
        // データを追加
        try! mRealm!.write() {
            mRealm!.add(test)
        }
        return true
    }
    
    /**
     オブジェクトを更新
     - parameter id: 更新対象オブジェクトのID
     - parameter name: 新しいname
     - parameter age: 新しいage
     - returns: 成功失敗のフラグ
     */
    static func updateOne(id: Int, name: String, age: Int) -> Bool {
        // 更新対象のオブジェクトを取得
        let result = mRealm!.objects(TestData.self).filter("id = " + id.description).first
        if result == nil {
            return false
        }
        try! mRealm!.write() {
            result!.name = name
            result!.age = age
        }
        return true
    }
    
    /**
     １件削除する
     - parameter id: 削除オブジェクトのID
     */
    static func deleteById(_ id: Int) -> Bool{
        // 更新対象のオブジェクトを取得
        let result = mRealm!.objects(TestData.self).filter("id = " + id.description).first
        if result == nil {
            return false
        }
        
        try! mRealm!.write() {
            mRealm?.delete(result!)
        }
        return true
    }
    
    /**
     指定した名前のオブジェクトを削除する
     - parameter name: 削除するオブジェクトの名前
     */
    static func deleteByName(_ name : String) -> Bool {
        // 更新対象のオブジェクトを取得
        let results = mRealm!.objects(TestData.self).filter("name = " + name)
        if results.count == 0{
            return false
        }
        
        try! mRealm!.write() {
            for resutl in results {
                mRealm?.delete(resutl)
            }
        }
        return true
    }
    
    /**
     オブジェクトを全て削除する
     */
    static func deleteAll() {
        let results = mRealm!.objects(TestData.self)
        try! mRealm!.write() {
            mRealm?.delete(results)
        }
    }
    
    /**
     * かぶらないプライマリIDを取得する
     * @return
     */
    public static func getNextId() -> Int {
        // 初期化
        var nextId : Int = 1
        // userIdの最大値を取得
        let lastId = mRealm!.objects(TestData.self).max(ofProperty: "id") as Int?

        if lastId != nil {
            nextId = lastId! + 1
        }
        return nextId
    }
}
