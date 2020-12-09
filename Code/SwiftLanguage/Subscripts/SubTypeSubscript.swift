//
//  SubTypeSubscript.swift
//  Subscripts
//
//  Created by Csy on 2020/12/9.
//

import Foundation

enum SubPlanet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> SubPlanet {
        return SubPlanet(rawValue: n)!
    }
}

func testSubTypeSubscript() -> Void {
    let mars = SubPlanet[3]
    print(mars)
}
