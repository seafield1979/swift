//
//  test_array.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    配列 Array
    var で宣言したArrayはMutable
    let で宣言したArrayはImmutable

    高速列挙はObjCと同じ感じで使用できる
    配列の中にいろいろな型を混ぜてもOK
    結合が簡単 append(), +=[]
 */

import Foundation

class UNTestArray{
    // プロパティ
    var array1 : [Int]   // 空 もしくは Array<Int>
    var array2 : [String]  // 空 もしくは Array<String>
    let array3 : [Int] = [1,2,3]
    let array4 : [String] = ["a","b","c","d","e"];
    let array5 : Array<Any> = [1,2,"aaa"]            // 型を混ぜてもOK
    let array6 : [[Int]] = [[1,2],[3,4]]        // 多次元配列
    //var array7 : [Int] = []  // 要素が0だけど空ではない
    var array7 = [Int]()
    var array8 : [String] = []  // 要素が0だけど空ではない
    var array_empty1 : [String]
    var param1 : Param1 = Param1(i1: 10, str1: "hoge")
    
    //メソッド
    init() {
        self.array1 = [1,2,3,4,5]
        self.array2 = ["1","2","3","4","5"]
        self.array7.append(1)
        array_empty1 = Array(repeating: "hoge", count: 10)
    }
    
    func test1() {
        var retStr : String = ""
        // 全要素を参照 高速列挙
        for i : Int in self.array1 {
            retStr += i.description
        }
        
        // 多次元配列の参照
        print("multi array")
        for i in 0...1 {
            for j in 0...1 {
                print(array6[i][j])
            }
        }
        
        // 空の配列を宣言、初期化、要素追加
        var array1 : [String]
        array1 = []
        array1.append("hoge")
        
        // 初期化、要素追加
        var array2 = [String]()
        array2.append("hoge")
        
        // for ~ in を使って全要素にアクセス
        let array4 = [1,2,3,4,5]
        for i in array4 {
            print(i)
        }
        
        // enumerateを使って全要素にアクセス
        let array3 = [10,20,30,40,50]
        array3.enumerated().forEach { print("index:\($0.0) value:\($0.1)") }
    }
    
    func test2() {
        // 出力
        self.array1.display()
        self.array2.display()
        self.array3.display()
        self.array4.display()
        self.array5.display()
        
        // 要素参照
        print("\(self.array1[2])")
        
        // 要素を追加
        self.array1.append(1)       // １つだけ追加
        self.array1 += [5,6,7]      // まとめて追加
        self.array1.insert(100, at: 3)     // 途中に挿入
        self.array1.display()
        
        // 要素の削除
        self.array1.remove(at: 0)
        self.array1.removeLast()
        self.array1.display()
        
        // イテレータとしてforループをまわす
        for i in [1,2,3] {
            print("for:%d", i)
        }
    }
    
    func test3() {
        // 混合型の配列から指定の方の値だけを抜き出す
        var ks : [AnyObject] = []
        var ki : [AnyObject] = []
        let array: [AnyObject] = ["abc" as AnyObject, 1 as AnyObject, "def" as AnyObject, 2 as AnyObject, "ghi" as AnyObject, 3 as AnyObject]
        
        //for var i = 0; i < array.count; i+=1 {
        for value in array {
            // String
            if let string = value as? String {
                ks.append(string as AnyObject)
            }
            // Int
            if let int1 = value as? Int {
                ki.append(int1 as AnyObject)
            }
        }
        print("test3_1: \(ks)")
        print("test3_1: \(ki)")
        
        
        // その２
        let array2: [Any] = ["abc", 1, "def", 2, "ghi", 3]
        let k2 = array2.filter{v in v is String}
        print("test3_2: \(k2)")
        
        // その３ 配列の要素を指定の値で初期化
        let count = Array(repeating: 100, count: 100)
        let repeated : [AnyObject] = Array(repeating: "hoge", count: 10) as [AnyObject]
        print("test3_3: \(count)")
        print("test3_3: \(repeated)")
    }
    
    // 参照渡しのテスト
    // Swiftの配列は値渡しなので、配列の要素をコピーして他の変数に設定。その変数を通してオブジェクトのプロパティを変更しても、元の配列の要素の値は変わらない
    func test4() {
        var names = ["hoge1", "hoge2"]
        add(array1: &names)
        print("names:" + names.debugDescription)

        var arr = getRefArray()
        arr.append("hoge")
        print("array4:" + array4.debugDescription)
        
        // オブジェクトの参照を取得
        let p1 = getObj()
        p1.i1 = 123
        
        print("param1:" + param1.i1.description)
    }
    
    // 配列をコピーしたときの挙動
    // コピー先の配列がコピー元の配列に影響を与えないかをテスト
    func test5() {
        let array1 : [Int] = [1,2,3,4,5]
        var array2 = Array(array1)
        
        array2[0] = 100
        array2[1] = 200
        
        print("array1:" + array1.description)
        
        print("array2:" + array2.description)
        
        var array3 : [Int] = Array(repeating: 0, count: 5)
        array3[0] = 100
        array3[1] = 200
        print(array3.debugDescription)
    }
    
    // シャッフルのテスト
    func test6() {
        print("test_array test6")
        var arr1 : [Int] = [1,2,3,4,5,6,7,8,9,10]
        
        let arr2 = arr1.shuffled()
        
        for i in 0..<arr2.count {
            print(i.description + " " + arr2[i].description)
        }
    }
    
    func test7() {
        var list1 : List<Int> = List()
        for i in 1...10 {
            list1.append(i)
        }
        
        list1.shuffled()
        
        for i in 0..<list1.count {
            print(i.description + " " + list1[i].description)
        }
    }
    
    func test8() {
        
    }
    
    func add( array1:inout [String]) {
        array1.append("hoge")
    }
    
    func getRefArray() -> [String]{
        return array4
    }
    
    func getObj() -> Param1 {
        return param1
    }
    
    // mapのテスト
    func testMap(){
        // 全要素を10倍した新しい配列を取得
        let array1 = [1,2,3,4,5]
        let newArray = array1.map{ $0 * 10 }
        newArray.forEach{ print($0) }
        
        // 結果をもともとの配列で受け取る
        var array2 = [1,2,3,4,5]
        array2 = array2.map{ $0 * 100 }
        array2.forEach{ print($0) }
        
        // 文字列の配列を処理する
        var array3 = ["hoge1", "hoge2", "hoge3"]
        array3 = array3.map{ $0 + " is good!" }
        array3.forEach { print($0) }
    }
    
    // filterのテスト
    func testFilter() {
        // 指定の値以上の値のみ残す
        let array1 = [1,2,3,4,5,6,7,8,9,10]
        let array2 = array1.filter { $0 > 5 }
        array2.forEach { print($0) }
        
        // 指定のフォーマットにあった文字列のみ残す
        let arrayS1 = ["hoge", "123", "hoge123", "hoge55"]
        let arrayS2 = arrayS1.filter { Regexp("hoge\\d+").isMatch($0) }
        arrayS2.forEach { print($0) }
    }

    // sort
    // 配列の要素を並び替える
    func testSort() {
        let array1 = [50,30,21,35,55,1]
        let array2 = ["hoge", "abc", "123", "ddd", "a123"]
        
        // sort ソート済みの新しい配列を返す
        // sortで並べ替え(整数)
        print("-- sort int --")
        array1.sorted().forEach { print($0) }
        
        // sortで並べ替え(文字列)
        print("-- sort str --")
        array2.sorted().forEach { print($0) }
        
        // 昇順(小さい順)に並び替え
        print("-- sort ascending --")
        //let newArray = array1.sort {$0 < $1}
        let newArray = array1.sorted(by: <)
        newArray.forEach {print($0)}
        
        // 降順(大きい順)に並び替え
        print("-- sort descending --")
        //let newArray2 = array1.sort {$0 > $1}
        let newArray2 = array1.sorted(by: >)
        newArray2.forEach {print($0)}
        
        // for文で使用する
        print("-- sort for --")
        for i in array1.sorted(by: >) {
            print(i)
        }
        
        // sortInPlace 元の配列を書き換える
        print("-- sortInPlace 1 --")
        var arrayIP1 = [50,30,21,35,55,1]
        var arrayIP2 = ["hoge", "abc", "123", "ddd", "a123"]
        arrayIP1.sort()
        arrayIP1.forEach { print($0) }
        
        print("-- sortInPlace 2 --")
        arrayIP2.sort()
        arrayIP2.forEach { print($0) }
        
        // 昇順
        print("-- sortInPlace 3 --")
        arrayIP1.sort(by: <)
        arrayIP1.forEach { print($0) }
        
        // 降順
        print("-- sortInPlace 4 --")
        arrayIP1.sort(by: >)
        arrayIP1.forEach { print($0) }
    }
    
    // reverse
    // 配列の要素を逆順にする
    func testReverse() {
        let array1 = ["a1", "hoge", "b3", "hage"]
        let newArray = array1.reversed()
        newArray.forEach { print($0) }
    }

    // 通常の配列は要素の値をコピーして返すが、それを参照で返すようにしたListクラスをテスト
    func testList() {
        var list1 : List<String> = List()
        
        list1.append("hoge1")
        list1.append("hoge2")
        list1.append("hoge3")
        list1.append("hoge4")
        
        for str : String? in list1 {
            print(str ?? "nil")
        }
    }
    
    class Param1 {
        var i1 : Int = 0
        var str1 : String = ""
        init(i1 : Int, str1 : String) {
            self.i1 = i1
            self.str1 = str1
        }
    }
}
