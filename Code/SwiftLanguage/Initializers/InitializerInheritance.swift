//
//  InitializerInheritance.swift
//  Initializers
//
//  Created by Xinhong on 2021/1/12.
//

import Foundation

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


func testInitInheritance() -> Void {
    let bicycle = InitBicycle()
    print("Bicycle: \(bicycle.description)")
}
