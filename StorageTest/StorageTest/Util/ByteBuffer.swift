//
//  ByteBuffer.swift
//  StorageTest
//    Java ByteBuffer for Swift
//  Created by Shusuke Unno on 2017/08/31.
//  Copyright © 2017年 Shusuke Unno. All rights reserved.
//

import Foundation

typealias Byte = UInt8


class ByteBuffer {
    // MARK: Constants
    private let BUF_SIZE = 1024
    
    // MARK: Properties
    private var data : [Byte]
    private var pos : Int = 0
    
    // MARK: Accessor
    public func position() -> Int {
        return pos
    }
    
    public func array() -> [Byte] {
        return Array(data.suffix(pos))
    }
    
    public func setPosition(_ pos : Int) {
        if pos >= data.count {
            self.pos = 0
        } else {
            self.pos = pos
        }
    }
    
    // MARK: Initializer
    public init() {
        data = Array(repeating: 0, count: BUF_SIZE)
    }
    
    // MARK: Public Methods
    
    // MARK: put
    // put Byte (unsigned 8bit) data
    public func put(_ b : Byte) {
        data[pos] = b
        pos += 1
    }
    
    public func putByte(_ b: Byte) {
        data[pos] = b
        pos += 1
    }
    
    // put signed 8bit data
    public func put(_ b : Int8) {
        data[pos] = Byte(b)
        pos += 1
    }
    
    // put Short(signed 16bit) data
    public func putShort(_ s: Int16) {
        putUInt16(UInt16(s))
    }
    
    // put signed 16bit data
    public func putInt16(_ s : Int16) {
        putUInt16(UInt16(s))
    }
    
    // put unsigned 16bit data
    public func putUInt16(_ s : UInt16) {
        // big endian
        data[pos] = Byte(s >> 8)
        pos += 1
        data[pos] = Byte(s & 0xff)
        pos += 1
    }
    
    // put Int (signed 32bit) data
    public func putInt(_ i : Int) {
        putUInt32( UInt32(i) )
    }
    
    // put signed 32bit data
    public func putInt32(_ i : Int32) {
        putUInt32( UInt32(i) )
    }
    
    // put unsigned 32bit data
    public func putUInt32(_ i : UInt32) {
        // big endian
        data[pos] = Byte(i >> 24)
        pos += 1
        data[pos] = Byte(i >> 16)
        pos += 1
        data[pos] = Byte(i >> 8)
        pos += 1
        data[pos] = Byte(i & 0xff)
        pos += 1
    }
    
    public func put<T>( _ data : T) {
        let data = toByteArray(data)
        write(data)
    }
    
    public func putFloat( _ f : Float) {
        put(f)
    }
    
    public func putDouble( _ d : Double) {
        put(d)
    }
    
    // write Byte array data
    public func write( _ array : [Byte]) {
        for b in array {
            data[pos] = b
            pos += 1
        }
    }
    
    // write Byte array data
    //   with offset and length
    public func write(array : [Byte], off : Int, len : Int) {
        for i in 0 ..< len {
            data[pos] = array[off + i]
            pos += 1
        }
    }
    
    public func write(repeating b: Byte, count : Int) {
        for _ in 0 ..< count {
            data[pos] = b
            pos += 1
        }
    }
    
    public func writeDate(date : Date?) {
        if let _date = date {
            let cal : Calendar = Calendar(identifier: .gregorian)
            putShort( Int16(cal.component(.year, from: _date)))
            putByte( Byte(cal.component(.month, from: _date)))
            putByte( Byte(cal.component(.day, from: _date)))
            putByte( Byte(cal.component(.hour, from: _date)))
            putByte( Byte(cal.component(.minute, from: _date)))
            putByte( Byte(cal.component(.second, from: _date)))
        } else {
            // 全て0で書き込み
            write(repeating: 0, count: 7)
        }
    }
    
    // write string
    public func writeString(str : String) {
        let data = toByteArray(str)
        write(data)
    }
    
    // write string count (4byte) and string
    public func writeStringWithSize(str : String) {
        let data = toByteArray(str)
        putInt(data.count)
        write(data)
    }
    
    // MARK: get
    // get signed 8bit data
    public func getByte() -> Byte {
        let ret = data[pos]
        pos += 1
        return ret
    }
    
    // get signed 16bit data
    public func getShort() -> Int16 {
        let ret = Int16((Int(data[pos]) << 8) | Int(data[pos + 1]))
        pos += 2
        return ret
    }
    
    // get signed 32bit data
    public func getInt() -> Int {
        let ret = UInt32( (UInt32(data[pos]) << 24) |
            (UInt32(data[pos + 1]) << 16) |
            (UInt32(data[pos + 2]) << 8) |
            (UInt32(data[pos + 3])))
        pos += 4
        return Int(ret)
    }
    
    // get float data
    public func getFloat() -> Float {
        let _data = Array(data[pos..<pos+4])
        let ret : Float = fromByteArray(_data,  Float.self)
        pos += 4
        return ret
    }
    
    public var description : String {
        get {
            let _data = data.prefix(pos)
            
            // convert 1byte data to string
            let stringArray = _data.map{String(format: "%02X", $0)}
            
            // joind with "-"
            let binaryString = stringArray.joined(separator: "-")
            
            return binaryString
        }
    }
    
    // MARK: Private Methods
    private func toByteArray<T>(_ value: T) -> [UInt8] {
        var value = value
        return withUnsafePointer(to: &value) {
            $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<T>.size) {
                Array(UnsafeBufferPointer(start: $0, count: MemoryLayout<T>.size))
            }
        }
    }
    
    private func fromByteArray<T>(_ value: [UInt8], _: T.Type) -> T {
        return value.withUnsafeBufferPointer {
            $0.baseAddress!.withMemoryRebound(to: T.self, capacity: 1) {
                $0.pointee
            }
        }
    }
}
