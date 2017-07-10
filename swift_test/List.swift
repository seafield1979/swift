//
//  List.swift
//  swift_test
//
//  Created koher
//  https://github.com/koher/Swift-List/blob/master/List.swift
//  上記のソースをSwift3でコンパイル時にエラーになった箇所を幾つか修正しています

import Foundation

class List<T> : Sequence{
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
    
    subscript(index: Int) -> T {
        get {
            return elements[index]
        }
        set {
            elements[index] = newValue
        }
    }
    
    func append(_ newElement: T) {
        elements.append(newElement)
    }
    
    func insert(_ newElement: T, atIndex index: Int) {
        elements.insert(newElement, at: index)
    }
    
    func removeAtIndex(index: Int) -> T {
        return elements.remove(at: index)
    }
    
    func removeLast() -> T {
        return elements.removeLast()
    }
    
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
        elements.sorted(by: isOrderedBefore)
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
    
    typealias Generator = ListGenerator<T>
    
    func generate() -> Generator {
        return ListGenerator(self)
    }
    
    func makeIterator() -> AnyIterator<T?> {
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

}

struct ListGenerator<T> {
    let list : List<T>
    var index : Int
    
    init(_ list: List<T>) {
        self.list = list
        index = 0
    }
    
    mutating func next() -> T? {
        if index >= list.count { return nil }
        index += 1
        return list[index]
    }
}
