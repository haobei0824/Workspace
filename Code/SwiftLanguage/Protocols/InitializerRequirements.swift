//
//  InitializerRequirements.swift
//  Protocols
//
//  Created by Csy on 2020/10/8.
//

import Foundation

protocol InitProtocol {
    init()
    init(withName name:String)
    init(withName name:String, age:Int16)
}

class InitProtocolClass: InitProtocol {
    required init(withName name: String, age: Int16) {
        print("InitProtocolClass conform init(withName,age) of InitProtocol")
    }
    
    required init(withName name: String) {
        print("InitProtocolClass conform init(withName) of InitProtocol")
    }
    
    required init() {
        print("InitProtocolClass conform init() of InitProtocol")
    }
}

class IRSuperClass {
    init() {
        // initializer implementation goes here
    }
}

class IRSubClass: IRSuperClass, InitProtocol {
    required init(withName name: String, age: Int16) {
        print("IRSubClass conform init(withName,age) of InitProtocol")
    }
    
    required init(withName name: String) {
        print("IRSubClass conform init(withName) of InitProtocol")
    }
    
    required override init() {      // must declare override
        print("IRSubClass conform init() of InitProtocol")
    }
}
