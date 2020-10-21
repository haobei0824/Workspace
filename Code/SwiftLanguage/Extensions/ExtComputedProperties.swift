//
//  ExtComputedProperties.swift
//  Extensions
//
//  Created by Csy on 2020/10/16.
//

import Foundation

// computed instance properties
// computed type properties
extension Double {
    var km: Double {return self / 1000}
    static var max: Double {
        return Double.greatestFiniteMagnitude
    }
}

// instance methods and type methods
extension NSObject {
    func myName() -> Void {
        print("myName func extension in NSObject ")
    }
    
    static func object() -> NSObject {
        print("static func: object(), in extension of NSObject")
        return self.init()
    }
}

// mutating
extension Int {
    mutating func square() {
        self = self * self
    }
}

extension NSObject {
    convenience init(withName name: String) {
        self.init()
        print("initWithName func extension in NSObject");
    }
}


func testProperty() -> Void {
    let myHeight = 1.68
    print("my height :" + "\(myHeight.km)" + "km")
    
    print("Double max value : " + "\(Double.max)")
}

func testMutatingInstanceMethods() -> Void {
    var aInt = 4
    aInt.square()
    print("int 4 become" + " \(aInt)" + " after square()")
    
}
