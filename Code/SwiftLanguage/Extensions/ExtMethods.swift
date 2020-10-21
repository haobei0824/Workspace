//
//  ExtMethods.swift
//  Extensions
//
//  Created by Csy on 2020/10/21.
//

import Foundation

// instance methods and type methods
extension NSObject {
    func myName() -> Void {
        print("instance method: myName(), in extension of NSObject")
    }
    
    static func object() -> NSObject {
        print("static method: object(), in extension of NSObject")
        return self.init()
    }
}

// mutating method
extension Int {
    mutating func square() {
        self = self * self
    }
}

func testMethods() -> Void {
    var a = NSObject();
    a.myName()
    a = NSObject.object()
}

func testMutatingInstanceMethods() -> Void {
    var aInt = 4
    aInt.square()
    print("mutating instance method: square(), in extension of Int")
    
}
