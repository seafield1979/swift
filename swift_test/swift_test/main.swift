//
//  main.swift
//  swift_test
//
//  Created by sunsunsoft on 2015/01/23.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//
//  使用方法:
//    [コマンド名].[モード番号]
//  例:
//    array.3
//    enum.1

import Foundation
import Darwin

func testPrint() {
    print("hello:")
    
    // 変数を埋め込む
    let str1 = "syutaro"
    print("str1:\(str1)")
    
    // カンマ区切りで変数のリストを渡す
    let hoge = "syutaro"
    print("aaa", "bbb", hoge)
    
    // フォーマットする
    let posX : Float = 1.123456789
    let posY : Float = 2.123456789
    print( String(format: "%.4f %.4f", posX, posY))
}

func testBasis(_ mode:Int) {
    print("test_basis")
    let basis1 = UNTestBasis()
    
    switch mode {
    case 1:
        basis1.test_str()
    case 2:
        basis1.test_switch()
    case 3:
        basis1.test_for()
    case 31:
        basis1.test_forEach();
    case 4:
        basis1.testIs()
    case 5:
        basis1.testAs()
    default:
        break
    }
}

func testClass() {
    print("test_class")
    let class1 = UNClassTest(str1: "ok", str2: "ng")
    print (class1.test1())

    // オブジェクトからクラス名を取得
    print("dynamicType")
    print( NSStringFromClass(type(of: class1)))
    
    // クラスの配列
    var classes : [UNClassTest] = [];
    for index in 1...10 {
        let class1 : UNClassTest = UNClassTest(str1: "hoge \(index)", str2: "hage")
        classes.append(class1)
    }
    
    var cnt : Int = 0
    for class1 in classes {
        print("classess[\(cnt)] is " + class1.str1)
        cnt += 1
    }
}

func testClass2(_ mode:Int) {
    let class1 = UNTestClassAdvance()
    
    switch mode {
    case 1:
        class1.test1()
    case 2:
        class1.test2()
    case 3:
        class1.test3()
    default:
        break
    }
}

func testFunc(_ mode:Int) {
    print("test_func mode:\(mode)")
    
    let func1 = UNTestFunc()
    switch mode {
    case 1:
        func1.test1()
    case 2:
        func1.test2()
    case 3:
        func1.test3()
    case 4:
        func1.test4()
    case 5:
        func1.test5()
    default:
        break
    }
}

func testArray(_ mode : Int) {
    print("test_array")
    let array1 = UNTestArray()
    
    switch mode {
    case 1:
        array1.test1()
    case 2:
        array1.test2()
    case 3:
        array1.test3()
    case 4:
        array1.testMap()
    case 5:
        array1.testFilter()
    case 6:
        array1.testSort()
    case 7:
        array1.testReverse()
    default:
        break
    }
}

func testDictionary(_ mode: Int) {
    let dictionary1 = UNTestDictionary()
    
    let ret = dictionary1.test1()
    print("\(ret)")
}

func testString(_ mode : Int) {
    let string1 = UNTestString()
    
    switch mode {
    case 1:
        string1.test1()
    case 2:
        string1.testRegEx()
    case 3:
        string1.testReplace()
    default:
        break
    }
}

func testOptional(_ mode: Int){
    let optional1 = UNTestOptional()
    
    switch mode {
    case 1:
        optional1.test1()
    case 2:
        optional1.test2()
    case 3:
        optional1.test3()
    case 4:
        optional1.test4()
//    case 5:
        //optional1.test5()
    default:
        break
    }
}

func testEnum(_ mode : Int) {
    let enum1 = UNTestEnum()
    
    switch mode {
    case 1:
        enum1.test1()
    default:
        break;
    }
}

func testStruct(_ mode:Int) {
    let struct1 = UNTestStruct()
    
    switch mode {
    case 1:
        struct1.test1()
    case 2:
        struct1.test2()
    default:
        break
    }
}

func testTuple(_ mode:Int) {
    let tuple1 = UNTestTuple()
    
    switch mode {
    case 1:
        tuple1.test1()
    case 2:
        tuple1.test2()
    case 3:
        tuple1.test3()
    default:
        break
    }
}

func testProperty(_ mode:Int) {
    let property = UNTestProperty()
    
    switch mode {
    case 1:
        property.test1()
    case 2:
        property.test2()
    default:
        break
    }
}

func testARC(){
    let arc = UNTestARC()
    arc.test1()
}


func testExtension() {
    let ext1 = UNTestExtension()
    ext1.test1()
}

func testProtocol(_ mode:Int) {
    let prot1 = UNTestProtocol()
    switch mode {
    case 1:
        prot1.test1()
    case 2:
        prot1.test2()
    case 3:
        prot1.test3()
    default:
        break;
    }
}

func testNested() {
    let nest = UNTestNested()
    
    nest.test1()
}

func testGenerics(_ mode: Int) {
    let generics = UNTestGenerics()
    
    switch mode {
    case 1:
        generics.test1()
    case 2:
        generics.test2()
    default:
        break
    }
}

func testOverload(_ mode:Int) {
    let overload = UNTestOverloadOperator()
    overload.test1()
}

//
// subscriptのテスト
// hoge[1] のような書き方をした時に自前の処理を行うことができる
func testSubscript(_ mode:Int) {
    
    if mode == 1 {
        let sample = SubscriptSample()
        sample[0] = "happy_ryo"
        sample[1] = "crazy_ryo"
        print(sample[0])
        print(sample[1])

        let test1 = UNTestSubscript()
        test1[0] = "hoge"
        test1[0] = "hage"
        print(test1[0])
        print(test1[1])
    }
    else if mode == 2 {
        print("kuku")
        let kuku = UNTestSubscript2()
        for i:Int in 1...9 {
            for j:Int in 1...9 {
                print(kuku[i,j].description + " ", terminator: "")
            }
            print("")   // 改行
        }
    }
}

// NSクラスのテスト
func testNSClass(_ mode:Int) {
    let nsclass = UNTestNSClass()
    
    switch mode {
    case 1:
        nsclass.testNSArray()
    case 2:
        nsclass.testNSData1()
    case 3:
        nsclass.testNSData2()
    case 4:
        nsclass.testNSData3()
    case 5:
        nsclass.testNSData4()
    case 6:
        nsclass.testNSString()
    default:
        print("\(mode) is not suport")
        break
    }
}

// エラークラスのテスト
func testException(_ mode:Int) {
    let exception = UNTestException()
    
    switch mode {
    case 1:
        exception.test1()
    case 2:
        exception.test2()
    case 3:
        exception.test3()
    default:
        break
    }
}

/*
 * コンソールでユーザーの入力を取得する
 *
 *  hoge.1 みたいに [コマンド名].[モード番号] で返す
 */
func getInput() -> (name:String, mode:Int) {
    print("\nplease input test name! ")

    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: 4)!  // 4->NSUTF8StringEncoding
    let command = strData.trimmingCharacters(in: CharacterSet.newlines)
    
    let splited = command.components(separatedBy: ".")
    if splited.count >= 2 {
        if let testNo = Int(splited[1]) {
            return (splited[0], testNo)
        }
    }
    
    return (command, 1)
}

// プリプロセッサーテスト
hoge1()

var breakWhile = false
while !breakWhile {
    let command = getInput()

    switch command.name {
        case "basis":
            testBasis(command.mode)
        case "class":
            testClass()
        case "class2":
            testClass2(command.mode)
        case "func":
            testFunc(command.mode)
        case "array":
            testArray(command.mode)
        case "dic":
            testDictionary(1)
        case "enum":
            testEnum(command.mode)
        case "exception":
            testException(command.mode)
        case "extension":
            fallthrough
        case "ext":
            testExtension()
        case "filter":
            testArray(5)
        case "nsclass":
            fallthrough
        case "ns":
            testNSClass(command.mode)
        case "map":
            testArray(4)
        case "opt":
            testOptional(command.mode)
        case "property":
            testProperty(command.mode)
        case "protocol":
            testProtocol(command.mode)
        case "prot":
            testProtocol(command.mode)
        case "reverse":
            testArray(7)
        case "subscript":
            testSubscript(command.mode)
        case "sort":
            testArray(6)
        case "string":
            testString(command.mode)
        case "struct":
            testStruct(command.mode)
        case "tuple":
            testTuple(command.mode)
        case "arc":
            testARC()
        case "nest":
            testNested()
        case "generics":
            testGenerics(command.mode)
        case "overload":
            testOverload(1)
        case "exit":
            breakWhile = true
        default:
            print("\(command) isn't test name")
    }
}
