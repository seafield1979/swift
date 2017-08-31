//
//  test_bytebuffer.swift
//  swift_test
//
//  Created by Shusuke Unno on 2017/08/31.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestByteBuffer {
    public func test1() {
        let buf : ByteBuffer = ByteBuffer()
        
        buf.putByte(0xff)
        buf.putUInt16(0xffff)
        buf.putUInt32(0xffffffff)
        buf.putFloat(4.0)
        
        print(buf.description)
        
        // 取り出す
        let b : Int8 = buf.getInt8()
        let s : Int16 = buf.getShort()
        let i : Int = buf.getInt()
        let f : Float = buf.getFloat()
        print( String(format: "%d %d %d %f", b, s, i, f))
        
        // 取り出す
        buf.setPosition(0)
        let ub : UInt8 = buf.getUInt8()
        let us : UInt16 = buf.getUInt16()
        let ui : UInt = buf.getUInt()
        
        print( String(format: "0x%x 0x%x 0x%x", ub, us, ui))
    }
    
    // Date,Stringの書き込み、読み込み
    public func test2() {
        let buf : ByteBuffer = ByteBuffer()
        
        buf.putDate(date: Date())
        buf.putString(str: "hogehoge")
        buf.putStringWithSize(str: "hogehoge2")
        
        print(buf.description)
        
        let date = buf.getDate()
        let str1 = buf.getStringWithNil()
        let str2 = buf.getStringWithSize()
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        print( String(format: "%@ %@ %@", df.string(from: date), str1, str2))
    }
    
    // 大量のデータを書き込み
    public func test3() {
        let buf = ByteBuffer()
        
        for i in 0..<1000 {
            buf.putInt(i+1)
        }
        
        for i in 0..<1000 {
            print("\(i) : \(buf.getInt())")
        }
    }
}
