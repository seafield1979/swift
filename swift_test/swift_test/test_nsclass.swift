//
//  test_nsclass.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/09/06.
//  Copyright © 2016年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestNSClass {
    
    // NSArrayとかNSDictionaryのテスト
    func testNSArray() {
        let nsarray = NSArray(array: ["hoge", "hoge2", "hoge3"])
        
        print(type(of: nsarray))
        
        // NSArrayの全要素に参照
        for value in nsarray {
            if value is String {
                print(value)
            }
        }
    }
    
    // NSDataのテスト
    func testNSData1() {
        // String -> NSData
        let data1 = "hogehoge".data(using: String.Encoding.utf8)
        
        // ファイルに書き込んでみる
        if let dir : NSString = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true ).first as NSString?
        {
            print(dir)  // /Users/[ユーザー名]/Documents
            let filePath = String(dir) + "/hoge1.dat"
            
            // ファイルに書き込む
            try? data1!.write( to: URL(fileURLWithPath: filePath), options: [])
            
            print("output hoge1.dat")
        }
    }
    
    // NSMutableDataのテスト
    func testNSData2() {
        // NSMutableDataを生成、データを追加
        let data2 = NSMutableData()
        data2.append("hoge".data(using: String.Encoding.utf8)!)
        data2.append("hoge".data(using: String.Encoding.utf8)!)
        
        var int1: NSInteger = 2525
        data2.append( Data(bytes: &int1, count: MemoryLayout<NSInteger>.size))
        
        // ファイルに書き込んでみる
        if let dir : NSString = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true ).first as NSString?
        {
            // ファイルに書き込む
            data2.write( toFile: String(dir) + "/hoge2.dat", atomically: false)
            
            print("output hoge2.dat")
        }
    }
    
    // NSDataから他の型に変換
    func testNSData3() {
        // String -> NSData
        let data1 = "hogehoge".data(using: String.Encoding.utf8)
        
        // NSData -> NSString -> String
        let string1 : String = String(NSString(data: data1!, encoding:String.Encoding.utf8.rawValue)!)
        print(string1)
        
        // NSInteger -> NSData
        var int12 : NSInteger = 1234
        let intData1 = Data(bytes: &int12, count: MemoryLayout<NSInteger>.size)
        
        // NSData -> NSInteger
        var int2 : NSInteger = 0
        (intData1 as NSData).getBytes(&int2, length: MemoryLayout<NSInteger>.size)
        print(int2) // 1234
    }
    
    
    // Byte配列からNSDataを作成、ファイルに書き込む
    func testNSData4() {
        let data1 = NSMutableData()
        
        let bytes : [CChar] = [1,2,3,4,5,6,7,8,9,10]
        data1.append( bytes, length: bytes.count)
        
        // ファイルに書き込んでみる
        if let dir : NSString = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true ).first as NSString?
        {
            // ファイルに書き込む
            data1.write( toFile: String(dir) + "/hoge3.dat", atomically: false)
        }
    }
    
    // NSStringのテスト
    // Swiftでも古いメソッドがNSStringを返したりする
    func testNSString() {
        // String -> NSString
        let str1 : String = "hoge"
        let nsstr1 : NSString = NSString(string: str1)
        print(nsstr1)  // hoge
        
        // NSString -> String
        let nsstr2 : NSString = NSString(string:"hoge")
        let str2 : String = nsstr2 as String
        print(str2)
        let str3 : String = String(nsstr2)
        print(str3)
    }
    
    init() {
        
    }
}
