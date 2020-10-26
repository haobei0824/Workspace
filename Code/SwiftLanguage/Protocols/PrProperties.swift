//
//  PrProperties.swift
//  Protocols
//
//  Created by Csy on 2020/10/26.
//

import Foundation

protocol PropertiesProtocol {
    var name: String { get set }
    var readonlyName: String { get }
    
    static var count: Int {get set}
    static var max: Int { get }
}

class PrPropertiesPerson: PropertiesProtocol {
   
    var name: String = ""
    
    var readonlyName: String {
        return "My " + name
    }
    
    static var count: Int = 1
    
    static var max: Int {
        return self.count + 1
    }
}

func testPropertiesProtocol() -> Void {
    let p1 = PrPropertiesPerson()
    p1.name = "zhangsan"
    print("PropertiesProtocol name(get set): " + p1.name)
    print("PropertiesProtocol readonlyName(get): " + p1.readonlyName)
    
    PrPropertiesPerson.count = 3
    print("PropertiesProtocol static count(get set): " + "\(PrPropertiesPerson.count)")
    print("PropertiesProtocol static max(get): " + "\(PrPropertiesPerson.max)")
}



