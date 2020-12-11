//
//  InhOverriding.swift
//  Inheritance
//
//  Created by Csy on 2020/12/11.
//

import Foundation

class InhVehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

class InhCar: InhVehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

// Overriding Property Observers
class InhAutomaticCar: InhCar {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
