//
//  ExtComputedProperties.swift
//  Extensions
//
//  Created by Csy on 2020/10/16.
//

import Foundation

// computed instance properties
// computed type properties
extension Double {
    var km: Double {return self / 1000}
    static var max: Double {
        return Double.greatestFiniteMagnitude
    }
}

func testProperties() -> Void {
    let myHeight = 1.68
    print("computed instance property of Double: " + "\(myHeight.km)" + "km")
    
    print("computed type property of Double max value : " + "\(Double.max)")
}

