//
//  PrExtensionOfProtocol.swift
//  Protocols
//
//  Created by Csy on 2020/11/18.
//

import Foundation


extension PrPEMyNameProtocol {
    var myName: String {
        return "zhangsan"
    }
}

class PrEOPPerson1: PrPEMyNameProtocol {
    
}

class PrEOPPerson2: PrPEMyNameProtocol {
    var myName: String {
        return "lisi"
    }
uina
}

func testExtensionOfProtocol() -> Void {
    let p1 = PrEOPPerson1()
    print("ExtensionOfProtocol person1 :" + p1.myName)
    
    let p2 = PrEOPPerson2()
    print("ExtensionOfProtocol person2 :" + p2.myName)
}


