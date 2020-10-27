//
//  PrMethods.swift
//  Protocols
//
//  Created by Csy on 2020/10/27.
//

import Foundation

protocol PrMethodsProtocol {
    func random() -> Double
    static func getMax() -> Int
    mutating func increase() -> Void
}


class PrMethodsNumber: PrMethodsProtocol {
    var age = 10
    
    func random() -> Double {
        return 1.0
    }
    
    static func getMax() -> Int {
        return Int.max
    }
    
    func increase() -> Void {
        self.age += 1
    }
}

enum PrMethodsSwitch: PrMethodsProtocol {
    case off, on
    
    func random() -> Double {
        return 1.0
    }
    
    static func getMax() -> Int {
        return Int.max
    }
    
    mutating func increase() -> Void {
        self = .off
    }
}

func testMethodsProtocol() -> Void {
    let p1 = PrMethodsNumber()
    print("methodsProtocol random() -> Double: " + "\(p1.random())")
    print("methodsProtocol static func getMax() -> Int: " + "\(PrMethodsNumber.getMax())")
    
    var s1 = PrMethodsSwitch.on
    print("methodsProtocol mutating func increase(), init value: " + "\(s1)")
    s1.increase()
    print("methodsProtocol mutating func increase(), after increase value: " + "\(s1)")
}



