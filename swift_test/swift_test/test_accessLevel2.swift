//
//  test_accessLevel2.swift
//  swift_test
//
//  Created by SunSunSoft on 2015/04/21.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//

import Foundation

open class CChild2 : CParent {
    override init() {
        
    }
    open func test(){
        // CParent:testは privateなので別のソースからはアクセス不可
        // super.test()     CParent:testはprivateなのでエラー
        
        // CParent:test2は publicなので別のソースからもアクセス可能
        super.test2()
    }
}
