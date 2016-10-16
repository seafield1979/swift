//
//  test_basis.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
  Swiftの基本構文のテスト


 */

import Foundation


class UNTestBasis {
    init(){
        
    }
    
    func test1() {
        // 変数の宣言
        var hoge1:String = "hoge1"
        var int1:Int = 100
        
        // 変数の代入
        hoge1 = "hoge2"
        int1 = 200
        
        // 変数の参照
        let hoge2:String = "hello" + hoge1
        let int2:Int = 100 + int1
        print("hoge2 \(hoge2) int2:\(int2)")
        
        // CGFloatの計算 CGFloat * Int の計算はできない
        let posX : CGFloat = 10.0
        let num : Int = 3
        //let posX2 : CGFloat = posX * num
        let posX2 : CGFloat = posX * CGFloat(num)
    }
    
    // MAKR: 文字列
    /*
         文字列
     */
    func test_str() {
        
        // 文字列の連結
        let str : String = "hoge" + "hoge2" + "hoge3"
        print(str)
    }
    
    // MARK: IF
    /*
        if文
     */
    func test_if() {
        
        var hoge : Int = 1
        
        hoge = 0
        if hoge == 1 {
            print("hoge == 1")
        } else if hoge == 2 {
            print("hoge == 2")
        } else {
            print("hoge else")
        }
        
//        if hoge = 1 {  <= エラー
//            println("hoge == 1")
//        }
//        if hoge { <- エラー
//            
//        }
        
        // オブジェクトのnil判定
        let hoges:String? = nil
        if hoges == nil {
        //if hoges {        <- エラー。nilかどうかで判定できない。BOOL値を返さないといけない。
            print("hoge == nil")
        }
        else {
            print("hoge != nil")
        }
    }
    
    func test_for() {
        //・基本
        //C言語のforループ
//        print("----- for1 -----")
//        for var cnt = 0; cnt < 10; cnt++ {
//            print("cnt:\(cnt)")
//        }
        
        //・範囲指定 (tupleを使用)
        print("----- for2 -----")
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        //・高速列挙 (要素数を繰り返す)
        print("----- for3 -----")
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print("Hello, \(name)!")
        }
        
        //・index省略
        print("----- for4 -----")
        for _ in 1...3 {
            // 何らかの処理を3回実施します
            print("hogehoge")
        }
        
        let array = [10,20,30,40,50]
        for (index, value) in array.enumerated() {
            print("\(index) : \(value)")
        }
        
        // 多重ループを一気に抜ける
        print("----- for5 -----")
        for_i: for i in 1...5 {
            for j in 1...5 {
                print("i=\(i) j=\(j)")
                if i == 2 && j == 2 {
                    print("break for_i")
                    break for_i
                }
            }
        }
    }
    
    // forEachのテスト
    func test_forEach() {
        // forEachを使うと簡単に配列の要素のループを行うことができる
        let array = [1,2,3,4,5];
        array.forEach {
            print($0)
        }
        
        // 辞書型をforEachで表示してみる
        let d1 : [String : Int] = ["Apple" : 100, "Orange": 200, "Banana" : 50]
        d1.forEach {
            print(String(format:"key=%@, value=%d",$0.0, $0.1))
        }
    }
    
    // MARK: SWITCH ~ CASE
    /*
        switch~caseのテスト
    */
    func test_switch() {
        // 基本
        print("----- case1 -----")
        var hoge:Int = 5
        switch hoge {
        case 1:
            print("1だよ")
        case 2,3:
            print("2か3だよ")
        case 4...10:
            print("4から10だよ")
        default:
            break
        }
        
        // 文字列
        print("----- case2 -----")
        let hoges:String = "tomato"
        switch hoges{
        case "banana":
            print("ばなな")
        case "tomato":
            print("とまと")
        case "cucumber":
            print("きゅうり")
        default:
            break
        }
        
        // break、fallthrough
        print("----- case3 -----")
        hoge = 1
        switch hoge {
        case 1:
            print("1")
            fallthrough
        case 2:
            print("2")
            break
        case 3:
            print("3")
        default:
            break
        }
    }
    
    // MARK: is as
    func testIs()
    {
        let array : [Any] = ["text", 10, 20, "30"]
        for obj in array {
            if obj is Int {
                print("\(obj) is Int")
            }
            else if obj is String{
                print("\(obj) is String")
            }
        }
    }
    
    // Animalクラスとそれを継承したDog/Catクラスを用意する
    class Animal{
        
    }
    class Cat: Animal{
        let say = "nya-"
    }
    class Dog: Animal{
        let say = "wan wan"
    }

    func testAs()
    {
        // animalsの型はDogとCatの共通ベースクラスにアップキャストされたAnimal配列になる
        // let animals = [Dog(), Cat()] でも型推論で同じ動作になる
        let animals : [Animal] = [Dog(), Cat()]
        
        // animalは配列animalsの要素なので、型はAnimalとして扱われる
        for animal in animals {
            // Animal型にアップキャストされているanimalをCatでダウンキャストするように試みる
            if let cat = animal as? Cat {
                // ダウンキャストされてCatのインスタンスとして扱えるので、sayプロパティが使える
                print("Cat say \(cat.say)")
                
                // 同様にDogにダウンキャストを試みる
            } else if let dog = animal as? Dog {
                print("Dog say \(dog.say)")
            }
        }
    }
}
