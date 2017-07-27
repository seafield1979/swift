//
//  test_list.swift
//  swift_test
//      List(要素をコピーしないで参照できるクラス)のテスト
//  Created by Shusuke Unno on 2017/07/26.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestList {
        
    // リストに追加、参照
    // これは Arrayと同じ
    func test1() {
        let list1 : List<CHoge> = List()
        
        list1.append( CHoge(name: "name1", age: 10))
        list1.append( CHoge(name: "name2", age: 20))
        list1.append( CHoge(name: "name3", age: 30))
        
        for hoge in list1 {
            print(hoge!.description)
        }
        
        // containsのテスト
        print("contains:")
        
        let ref1 = list1[1]
        
        if list1.contains(ref1) {
            print("contained!!")
        } else {
            print("not contained!!")
        }
        
    }
    
    // メソッドに渡したオブジェクトの中身を書き換えるテスト
    func test2() {
        print("test2")
        let list1 : List<CHoge> = List()
        
        list1.append( CHoge(name: "name1", age: 10))
        list1.append( CHoge(name: "name2", age: 20))
        list1.append( CHoge(name: "name3", age: 30))
        
        // list1[0]の内容を書き換える（成功）
        updateHoge1(list1[0])
        
        // list1[1]の内容を書き換える（成功）
        let hogeCopy = list1[1]
        hogeCopy.name = "name2 updated"
        hogeCopy.age = 0
        
        for hoge in list1 {
            print(hoge!.description)
        }
    }
    
    // ただの配列(Array)でtest2と同じ処理を行う
    // この処理に関してはtest2と同じ結果になる。
    func test3() {
        print("test3")
        var array1 : [CHoge] = []
        
        array1.append( CHoge(name: "name1", age: 10))
        array1.append( CHoge(name: "name2", age: 20))
        array1.append( CHoge(name: "name3", age: 30))
        
        // list1[0]の内容を書き換える（成功）
        updateHoge1(array1[0])
        
        // list1[1]を変数に代入してから内容を書き換える（成功）
        let hogeCopy = array1[1]
        hogeCopy.name = "name2 updated"
        hogeCopy.age = 0
        
        for hoge in array1 {
            print(hoge.description)
        }
    }
    
    // Listでコピー元とコピー先が同じになることを確認する
    func test4() {
        
        let list1 : List<CHoge> = List()
        
        list1.append( CHoge(name: "name1", age: 10))
        list1.append( CHoge(name: "name2", age: 20))
        list1.append( CHoge(name: "name3", age: 30))
        
        // list2にlist1を設定
        // Arrayでは list2とlist1は独立した別のものになるが、Listでは同じになる
        let list2 = list1
        list2[0].name = list2[0].name + " updated"
        
        // list1に要素を追加。list2にも追加される。（実際にはlist2に追加されるのではなくてlist2がlist1の参照なので
        list1.append( CHoge(name: "name4", age: 40))
        
        print("list1")
        for hoge in list1 {
            print(hoge!.description)
        }
        
        print("list2")
        for hoge in list2 {
            print(hoge!.description)
        }
    }
    
    // Arrayを変数に代入して、その編集でArrayの中身を書き換える
    // コピー元とコピー先が別の配列であることが確認出来る
    func test5() {
        
        var list1 : [CHoge] = []
        
        list1.append( CHoge(name: "name1", age: 10))
        list1.append( CHoge(name: "name2", age: 20))
        list1.append( CHoge(name: "name3", age: 30))
        
        // list2にlist1を代入。list2 は list1の要素をコピーした別のものになる
        // list1,list2のどちらかの変更がもう片方の配列にも反映される
        let list2 = list1
        list2[0].name = list2[0].name + " updated"
        
        // list1に要素を追加。list1とlist2は別物なのでlist2には追加されない
        list1.append( CHoge(name: "name4", age: 40))
        
        print("list1")
        for hoge in list1 {
            print(hoge.description)
        }
        
        print("list2")
        for hoge in list2 {
            print(hoge.description)
        }
    }
    
    // 勘違いを補正
    // Arrayの要素(オブジェクト)を変数に設定した場合、それは参照になる
    // Arrayの要素(構造体)を変数に設定した場合、それはコピーになる
    func test6() {
        // クラスのオブジェクトは変数への代入が参照になる
        let classObj = CHoge(name: "hoge", age: 10)
        let copyObj = classObj
        copyObj.name = copyObj.name + " updated"
        
        print("classObj:" + classObj.description)  // classObj:name:hoge updated age:10
        
        // 構造体のオブジェクトは変数への代入が参照になる
        let structObj = SHoge(name: "hoge2", age: 20)
        var copyObj2 = structObj
        copyObj2.name = copyObj2.name + " updated"
        
        print("structObj:" + structObj.description)  // structObj:name:hoge2 age:20
        
    }
    

    
    // リストの要素をメソッドに渡して更新
    // Swiftではメソッドに引数に渡されるのはあくまでコピー。呼び出し元のオブジェクトは変更されない
    func updateHoge1( _ hoge : CHoge) {
        let hoge = hoge
        hoge.name = hoge.name + " updated"
        hoge.age = 0
    }
    
    // リストの要素をメソッドに渡して更新する（構造体用)
    func updateHoge2( _ hoge : inout CHoge) {
        hoge.name = hoge.name + " updated"
        hoge.age = 0
    }
}
