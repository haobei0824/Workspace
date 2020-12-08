//
//  PropTypeProperties.swift
//  Properties
//
//  Created by Csy on 2020/12/7.
//

import Foundation

class PropStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
    
    class var name: String {
        return "PropStructure"
    }
    
    // 不支持 class stored property
//    class var age: Int = 2
}

class PropSubStructure: PropStructure {
    class override var name: String {
        let superName = super.name;
        return "son + " + superName
    }
}
