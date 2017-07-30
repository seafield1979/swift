//
//  class_advance2.swift
//  swift_test
//
//  Created by Shusuke Unno on 2017/07/30.
//  Copyright © 2017年 sunsunsoft. All rights reserved.
//

import Foundation

private protocol Protocol1 {
    func hoge();
}

private class CTest1 : Protocol1 {
    internal func hoge() {
        print("hoge")
    }
}
private class CTest2 : Protocol1 {
    internal func hoge() {
        print("hoge2")
    }
}

public protocol TangoItem {
    func getId() -> Int
}

public class TangoCard : TangoItem {
    public func getId() -> Int {
        return 1
    }
}

public class TangoBook : TangoItem {
    public func getId() -> Int {
        return 2
    }
}

public class UIcon {
    // 保持するTangoItemを返す
    public func getTangoItem() -> TangoItem? {
        // 抽象メソッド
        return nil
    }
}

public class IconCard : UIcon {
    var card : TangoCard = TangoCard()
    
    public override func getTangoItem() -> TangoItem {
        return card
    }
}

public class IconBook : UIcon {
    var book = TangoBook()
    
    public override func getTangoItem() -> TangoItem {
        return book
    }
}

class UNTestClassAdvance2 {
    func test1() {
        let iconCard = IconCard()
        let iconBook = IconBook()

        let card : TangoItem = TangoCard()
        let book : TangoItem = TangoBook()
        
        //command failed due to signal segmentation fault 11
//        let card2 : TangoCard = iconCard.getTangoItem() as! TangoCard
//        let book2 : TangoBook = iconBook.getTangoItem() as! TangoBook
        
        let card2 : TangoCard = iconCard.card
        let book2 : TangoBook = iconBook.book
        
        print("card id :" + card2.getId().description)
        print("book id :" + book2.getId().description)
    }
    func test2() {
        
    }
    func test3() {
        
    }
}
