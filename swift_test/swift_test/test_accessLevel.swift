//
//  test_accessLevel.swift
//  swift_test
//
//  Created by sunsunsoft on 2015/04/21.
//  Copyright (c) 2015年 sunsunsoft. All rights reserved.
//
/*
    クラス、クラスのプロパティ、クラスのメソッド、構造体、列挙型に外部からのアクセスを制限するためのレベルを設定できる

    設定可能なレベルは
    public
        どこからでもアクセス可能
    internal
        同じモジュール内からにはアクセス可能。具体的には別FrameWorkから取り込まれた場合にアクセスができなくなる。
        よって、FrameWorkのクラスはPublicにすること。
    private
        同じソースファイルからしかアクセスできません。モジュールの使用者から内部構造を隠蔽したい場合等に使用します。
 */

import Foundation


open class CParent {
    init() {
        
    }
    fileprivate func test(){
        print("CParent:test()")
    }
    open func test2(){
        print("CParent:test2()")
    }
}

open class CChild1 : CParent {
    override init() {
        
    }
    override open func test(){
        // CParent:testは privateだが同じソース内なのでアクセス可能
        super.test()
    }
}

open class CProperty {
    fileprivate(set) var getOnly = 0    // setterがprivateなので、クラス外から値の設定が出来ない
}

open class UNTestAccessLevel {
    init() {
        
    }
    open func test1() {
        print("UNTestAccessLevel:")
        // 同じクラスのメソッドからはprivateメソッドも呼び出し可能
        test_private1()
        
        
    }
    
    fileprivate func test_private1() -> String{
        return "hello private"
    }
    
}
