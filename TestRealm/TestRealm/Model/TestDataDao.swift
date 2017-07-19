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
        
        var ret : [TestData] = []
        for test in tests {
            ret.append(TestData(value:test))
        }
        return ret
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
