//
//  InitializerInheritance.swift
//  Initializers
//
//  Created by Xinhong on 2021/1/12.
//

import Foundation

// has default initializer
class InitVehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class InitBicycle: InitVehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

class InitHoverboard: InitVehicle {
    var color: String
    
    override init() {
        self.color = "Red"      // must init own properties first
        super.init()
        numberOfWheels = 2      // must custom super properties after super's init
    }
    
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
//        super.init()
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}



class InitVehicle2 {
    var numberOfWheels: Int
    init(numberOfWheels wheelNum:Int) {
        self.numberOfWheels = wheelNum
    }
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class InitHoverboard2: InitVehicle2 {
    var color: String = "RED"
    
    // inherte init(numberOfWheels wheelNum:Int)
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

//
class InitFood {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

// Automatic Initializer Inheritance Rule 2
// inherits all of the superclass convenience initializers.
class InitRecipeIngredient: InitFood {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
    // inherte init()
}

// Automatic Initializer Inheritance Rule 1 and Rule 2
// inherte all initializers
class InitShoppingItems: InitRecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}


func testInitInheritance() -> Void {
    let bicycle = InitBicycle()
    print("Bicycle: \(bicycle.description)")
    
    let h2 = InitHoverboard2(numberOfWheels: 2)
    
}
