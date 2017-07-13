//
//  test_optional.swift
//  swift_test
//
//  Created by SunSunSoft on 2015/03/03.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    Optional型のサンプル
    通常の変数はnilを代入できないため、nilを代入するためにOptional型を使用する

    nilが入る変数を使用したい場合はOptional型か Implicitly unwrapeed Optional型を使用する
    Optional型 (nilを代入できる、使用時は!でアンラップする必要がある)
        宣言  var str : String? = "123"
        参照  str!

    Implicitly unwrapped Optional型 (nilを代入できる、使用時にアンラップする必要は無いがnilが入っているとエラーになるため、nilが入っている可能性がある場合は ?? でnilの時の置き換わる値を設定する必要がある）
        宣言  var str : String!
        参照  str

    nilの入る変数を使う一番間簡単な方法
        Optional型の変数を宣言
            var str : String? = nil
        変数を使用する
            println(str?.toInt())       // nilでも大丈夫
            str = "100"
            println(str?.toInt())       // nil以外でも大丈夫
*/

import Foundation

class UNTestOptional {
    // init
    init(){
        
    }

    func test1() {
        let optInt : Int? = nil        // オプショナル型なのでnilが代入できる
        let optStr : String? = nil     // オプショナル型なのでnilが代入できる
        
        print("1:\(optStr) \(optInt)")
        
        let optInt2 : Int? = 100     // もちろんnil以外も代入できる
        let optStr2 : String? = "hello"
        
        print("2:\(optStr2) \(optInt2)")
    }
    
    // アンラップのあれこれ
    func test2() {
        
        // Optional型をそのまま使用しようとしてエラーになる例
        var b: Int? = 1
        //println(b + 2) // -> Value of optional type 'Int?' not unwrapped; did you mean to use '!' or '?'?
        
        // Optional型はアンラップすれば使用できる
        // アンラップの方法は ? と ! の２つ方法がある
        // ?でアンラップすると nil の場合にオプショナルチェーンが無視される(メソッドが呼ばれないでnilを返す)
        // !でアンラップすると nil の場合に実行時エラーになる
        var c : String? = "123456789"
        var c2 : String = (c?.lowercased())!
        var c3 : String? = c?.lowercased()
        
        c = nil
//        c2 = (c?.lowercased())!       // 実行時エラー
        c3 = c?.lowercased()
        
        // nilが入った変数は?でアンラップするといい感じ
        // ?でアンラップすることをoptional Chainingという
        var e : String? = nil;
        // print("24: \(Int(e!))")     // エラー
        e = "123"
        print("25: \(e!.uppercased())")     // 25: 123
        print("25: \(e?.uppercased())")     // 25: Optional(123)
        e = nil
        print("25: \(e?.uppercased())")     // 25: nil

        /*
            e?.uppercaseString は 内部でこんな動き(optional chaining)をしている
            e をアンラップする
            uppercaseString メソッドを呼ぶ
            uppercaseString メソッドが String 型を返す
            String 型を optional 型にラップする
            Optional<String> 型を返す
        */
        let f : String? = nil
        let f2 : String? = f?.uppercased()       // ?を使用すると出力(String)をOptional型にラップしてから返す
        print("26: \(f2)")
    }
    
    func test3() {
        // implicitly unwrapped optional 型のテスト
        // implicitly unwrapped optional型は自動的にアンラップされる
        var str1 : String! = "hoge"
        print("31: \(str1.uppercased())")
        
        // でも nilの場合はエラーになってしまう
        str1 = nil
        //print("32: \(str1.uppercaseString)")      // ランタイムエラー
        
        // implicity unwrapped optional型はnilのときエラーになるじゃん、だめじゃん
        // ってときは ?? 演算子を使うと nilのときに別の値を返すようにできるYO
        var str2 : String! = "1"
        print(Int((str2 ?? "2")))      // str2はnilでないので 1が出力される
        str2 = nil
        print(Int((str2 ?? "2")))        // str2はnilなので 2が出力される
        
    }
    
    /*
     * オプショナル変数を簡単に使用する方法です
     */
    func test4() {
        print("UNTextOptional:test4")

        // 宣言時に?をつけて、参照時も?をつける。これが一番簡単
        // 参照時に?をつけるとnilのときとnil以外のときでエラーにならずに値が取り出せる
        var str : String? = "hoge"//nil
        str = "hoge"
        // print(Int(str?))       // エラー。理由は strがnilのときに print(nil)になるから
        var str12 : String? = str?.uppercased()      // これはOK。str?がnilのときに uppercaseStringがよばれずにnilをかえすだけ
        str = "100"
        //print(Int(str?))       // nil以外でも大丈夫
        print(Int(str!))       // 強制的にアンラップする
        
        // ?を使用せずに値を参照したい場合は自分でnilチェックする
        var str2 : String? = nil
        if str2 != nil {
            print("str2:\(str2)")
        } else {
            print("str2 is nil")
        }
        
        str2 = "hello"
        if str2 != nil {
            print("str2:\(str2)")
        } else {
            print("str2 is nil")
        }
    }
    
    //MARK: オプショナル連鎖
    // ?をつけてオプショナル変数がnilを返せるようにできる。これを連結させて複数のnilをとる可能性のある変数を１行にまとめることが出来る
    class optionalConnect1 {
        var Str : String?
        init(str : String?){
            Str = str;
        }
    }
    class optionalConnect2 {
        var Str1 : String?
        var connect1 : optionalConnect1?
        init(str : String?){
            Str1 = str
        }
    }
    
    func test5() {
        // オプショナルバインディングテスト
        let hoge : String? = "hoge"
        
        if hoge != nil {
            print(hoge!)
        }
    }
}
