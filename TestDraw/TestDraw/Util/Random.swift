//
//  Random.swift
//  TestDraw
//
//  Created by Shusuke Unno on 2017/08/07.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import Foundation


class Random {
    
    /**
     * 整数の乱数を取得する
     @parameter maxValue: 乱数の最大値
     @return 乱数
     */
    func nextInt(_ maxValue : UInt32) -> UInt32 {
        return arc4random() % (maxValue + 1)
    }
}
