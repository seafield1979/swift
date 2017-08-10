//
//  MovingNode.swift
//  TestSpriteKit
//
//  Created by Shusuke Unno on 2017/08/08.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import SpriteKit
import GameplayKit

// 移動速度を持つ SKShapeNode
class MovingNode: SKShapeNode {
    
    // 移動速度
    public var movingSpeed : CGPoint = CGPoint()
    
    // 移動端
    public var minPos = CGPoint()
    public var maxPos = CGPoint()
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 移動する
    public func move() {
        self.position.x += movingSpeed.x
        self.position.y += movingSpeed.y
        
        let hw = self.frame.size.width / 2
        let hh = self.frame.size.height / 2
        if self.position.x - hw < minPos.x {
            position.x = minPos.x + hw
            movingSpeed.x *= -1
        }
        if self.position.y - hh < minPos.y {
            position.y = minPos.y + hh
            movingSpeed.y *= -1
        }
        if self.position.x + hw > maxPos.x {
            position.x = maxPos.x - hw
            movingSpeed.x *= -1
        }
        if self.position.y + hh > maxPos.y {
            position.y = maxPos.y - hh
            movingSpeed.y *= -1
        }
    }
}
