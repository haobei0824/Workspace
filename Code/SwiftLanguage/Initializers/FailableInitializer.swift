//
//  FailableInitializer.swift
//  Initializers
//
//  Created by Xinhong on 2021/1/20.
//

import Foundation


class InitDocument {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

enum InitTemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

// has default init?(rawValue:)
enum InitTemperatureUnit2: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

class InitAutomaticallyNamedDocument: InitDocument {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class InitAutomaticallyNamedDocument2: InitDocument {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init?(name: String) {
        super.init(name: name)
        self.name = "123"   // 代码不会走到，提前终止
    }
}



func testFailableInitializer() -> Void {
    let d = InitDocument(name: "")
    print(d)
    let unit = InitTemperatureUnit(symbol: "D")
    print(unit)
    var u2 = InitTemperatureUnit2(rawValue: "1")
    print(u2)
    var u3 = InitTemperatureUnit2.kelvin
    print(u3)
    
    var d2 = InitAutomaticallyNamedDocument2(name: "")
    print(d2)
    
}
