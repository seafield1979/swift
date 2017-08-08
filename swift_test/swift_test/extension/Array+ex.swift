//
//  Array+ex.swift
//  swift_test
//
//  Created by Shusuke Unno on 2017/08/07.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

extension Array {
    func shuffled() -> Array<Element> {
        var array = self
        
        for i in 0..<array.count {
            let ub = UInt32(array.count - i)
            let d = Int(arc4random_uniform(ub))
            
            let tmp = array[i]
            array[i] = array[i+d]
            array[i+d] = tmp
        }
        
        return array
    }
}
