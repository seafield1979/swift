//
//  List.swift
//  TangoBook
//

//  Created by koher
//      https://github.com/koher/Swift-List
//  上記のソースをSwift3でコンパイル時にエラーになった箇所を幾つか修正しています
//
//  Swiftの配列(Array)は配列全体をコピーした際に、新しい配列を作成する。
//  このListは配列全体をコピーした際に参照を渡す。これにより、コピー元 = コピー先 が保持される。
//  例えば元々のArrayは リスト1 を新しい変数 リスト2 にコピーした場合、コピーした時点ではリスト1とリスト2の要素は同じだが、その後リスト1やリスト2を変更すると、それぞれが個別に反映されるので別のものになる。
// Java等ではリストをコピーした場合、コピー先のリストはあくまでコピー元の参照なのでこのようなことにはならず
// ずっと リスト1 = リスト2 が保たれる。
// Listクラスを使用するとJavaと同じようにコピー後も常にリスト1 = リスト2 が保たれる。

import Foundation

public class List<T> : Sequence, Hashable{
    final var elements: Array<T>
    
    init(_ elements: Array<T>) {
        self.elements = elements
    }
    
    convenience init() {
        self.init([])
    }
    
    convenience init(_ list: List<T>) {
        self.init(list)
    }
    
    convenience init(_ elements: T...) {
        self.init(elements)
    }
    
    // [index] で要素を参照するためのサブスクリプト
    subscript(index: Int) -> T {
        get {
            return elements[index]
        }
        set {
            elements[index] = newValue
        }
    }
    
    // リストに要素を追加する
    func append(_ newElement: T) {
        elements.append(newElement)
    }
    
    // リストに含まれているかをチェック
    //    func contains(_ element: T) -> Bool {
    //        return elements.contains(where: { $0 === element })
    //    }
    func contains2<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
    
    // リストの指定位置に要素を追加する
    func insert(_ newElement: T, atIndex index: Int) {
        elements.insert(newElement, at: index)
    }
    
    // リストの戦闘に要素を追加する
    func push(_ newElement: T) {
        elements.insert(newElement, at: 0)
    }
    
    // リストの指定位置の要素を削除する
    func remove(at index: Int) -> T {
        return elements.remove(at: index)
    }
    
    // リストの最後の要素を削除する
    func removeLast() -> T {
        return elements.removeLast()
    }
    
    // リストの全要素を削除する
    func removeAll(keepCapacity: Bool = false) {
        elements.removeAll(keepingCapacity: keepCapacity)
    }
    
    func reserveCapacity(minimumCapacity: Int) {
        elements.reserveCapacity(minimumCapacity)
    }
    
    var count: Int {
        get {
            return elements.count
        }
    }
    
    func first() -> T? {
        return elements.first
    }
    
    func last() -> T? {
        return elements.last
    }
    
    var isEmpty: Bool {
        get {
            return elements.isEmpty
        }
    }
    
    var capacity: Int {
        get {
            return elements.capacity
        }
    }
    
    func sort(isOrderedBefore: (T, T) -> Bool) {
        _ = elements.sorted(by: isOrderedBefore)
    }
    
    func reverse() -> Array<T> {
        return elements.reversed()
    }
    
    func filter(includeElement: (T) -> Bool) -> List<T> {
        return List(elements.filter(includeElement))
    }
    
    func map<U>(transform: (T) -> U) -> List<U> {
        return List<U>(elements.map(transform))
    }
    
    func reduce<U>(initial: U, combine: (U, T) -> U) -> U {
        return elements.reduce(initial, combine)
    }
    
    public func makeIterator() -> AnyIterator<T?> {
        var count = 0
        return AnyIterator {
            if self.elements.count <= count {
                // nilを返したら終了
                return nil
            }
            let element = self.elements[count]
            count += 1
            
            return element
        }
    }
    
    // Hashable
    // ハッシュ値を返す
    public var hashValue: Int {
        return self.elements.description.hashValue
    }
    
    // ハッシュ値を比較する
    public static func == (lhs: List, rhs: List) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

