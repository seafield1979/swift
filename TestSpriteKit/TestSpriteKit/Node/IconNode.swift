//
//  IconNode.swift
//  TestSpriteKit
//      いくつかのSKNodeを持つアイコン
//      １つのオブジェクトで複数のノードを管理するサンプル
//  Created by Shusuke Unno on 2017/08/08.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import SpriteKit
import GameplayKit

public class IconNode {
    
    var basePos : CGPoint
    
    var parentNode : SKNode
    
    init(imageName: String, title : String, pos: CGPoint) {
        basePos = pos
        
        // 親ノード
        parentNode = SKNode()
        parentNode.position = basePos
        
        let w : CGFloat = 200.0
        // Shape
        let shape = SKShapeNode(rect: CGRect(x:-w/2,y:-w/2,width: w, height: w), cornerRadius: 10.0)
        shape.name = "icon shape"
        shape.fillColor = UIColor.red
        shape.lineWidth = 3.0
        shape.position = CGPoint(x: 0, y: 0)
        shape.zPosition = 0.0
        
        parentNode.addChild(shape)
        
        //イメージ
        let sprite = SKSpriteNode(imageNamed: imageName)
        sprite.name = "icon sprite"
        sprite.position = CGPoint(x: 0, y: 0)
        sprite.size = CGSize(width: w - 30, height: w - 30)
        sprite.zPosition = 0.1
        parentNode.addChild(sprite)
        
        // ラベル
        let label = SKLabelNode(text: title)
        label.name = "icon label"
        label.fontColor = SKColor.white
        label.fontSize = 30.0
        label.zPosition = 0.2
        label.position = CGPoint(x:0, y:-30.0)
        
        parentNode.addChild(label)
    }
}

