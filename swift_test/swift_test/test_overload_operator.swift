//
//  test_overload_operator.swift
//  swift_test
//
//  Created by SunSunSoft on 2015/04/21.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
/*
    演算子のオーバーロード
    構造体に対して演算子で処理を行うことが出来る。オーバーロードで切る演算子は以下
        二項演算子   A + B
        単項演算子   A = -B
        複合代入演算子 A -= B
        等価演算子   A == B

    宣言の仕方
        ２項演算子の場合
        func (演算子) (left:型, right:型) -> 戻り値の型
        例： func + (left:Vector2D, right:Vector2D) -> Vector2D {
                return Vector2D(x:left.x + right.x, y:left.y + right.y)
            }

        単項演算子の場合
        (演算子の種類) func (演算子) (変数名 : 型)
        例: prefix func - (vector : Vector2D) -> Vector2D{
            return Vector2D(x: -vector.x, y:vector.y)
        }


 */

import Foundation

struct Vector3D {
    var x : Float = 0, y : Float = 0, z : Float = 0
    var description : String {
        return "x:\(x) y:\(y) z:\(z)"
    }
}

// 二項演算子   A + B
func + (left: Vector3D, right: Vector3D) -> Vector3D {
    return Vector3D(x:left.x + right.x,
        y:left.y + right.y,
        z:left.z + right.z)
}

// 二項演算子   A - B
func - (left: Vector3D, right: Vector3D) -> Vector3D {
    return Vector3D(x:left.x - right.x,
        y:left.y - right.y,
        z:left.z - right.z)
}

//単項演算子   A = -B
prefix func - (vector : Vector3D) -> Vector3D{
    return Vector3D(x:-vector.x, y:-vector.y, z:-vector.z)
}

postfix func ++ (vector : Vector3D) -> Vector3D{
    return Vector3D(x:vector.x + 1.0, y:vector.y + 1.0, z:vector.z + 1.0)
}

//複合代入演算子 A += B
func += (left : inout Vector3D, right : Vector3D){
    left = left + right
}

//複合代入演算子 A -= B
func -= (left : inout Vector3D, right : Vector3D){
    left = left - right
}

//等価演算子   A == B
func == (left : Vector3D, right : Vector3D) -> Bool {
    return (left.x == right.x && left.y == right.y && left.z == right.z)
}

// 等価演算子
func != (left : Vector3D, right : Vector3D) -> Bool {
    return !(left == right)
}

// 独自の演算子
prefix func ~ (left : Vector3D) -> Vector3D {
    return Vector3D(x:(left.x + left.x),
        y:(left.y + left.y),
        z:(left.z + left.z))
}

class UNTestOverloadOperator
{
    init() {
        
    }
    func test1() {
        print("UNTestOverloadOperation:test1")
        
        var a : Vector3D = Vector3D(x:1.0, y:2.0, z:3.0)
        let b : Vector3D = Vector3D(x:10.0, y:20.0, z:30.0)
        
        // 足し算
        print((a + b).description)
        
        // 引き算
        print((a - b).description)
        
        // 単項演算子
        print((-a).description)
        print((a++).description)
        
        // 複合代入演算子
        a += b
        print(a.description)
        
        a -= b
        print(a.description)
        
        // 等価演算子
        let c1 : Vector3D = Vector3D(x:0, y:0, z:0)
        let c2 : Vector3D = Vector3D(x:0, y:1, z:0)
        let c3 : Vector3D = Vector3D(x:0, y:0, z:0)
        print(c1 == c2)
        print(c1 == c3)
        print(c1 != c2)
        
        // 独自の演算子
        print((~a).description)
    }
}
