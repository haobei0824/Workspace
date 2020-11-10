//
//  PrProtocolInheritance.swift
//  Protocols
//
//  Created by Csy on 2020/11/10.
//

import Foundation

protocol PrMoreMethodsProtocol: PrMethodsProtocol {
    
}

class PrMorePerson:  PrMoreMethodsProtocol{
    func random() -> Double {
        return 1.0
    }
    
    static func getMax() -> Int {
        return Int.max
    }
    
    func increase() {
        
    }
}
