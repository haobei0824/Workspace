//
//  PrSynthesizedImplementation.swift
//  Protocols
//
//  Created by Csy on 2020/11/6.
//

import Foundation

struct PrVector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

extension PrVector3D: Hashable {}

enum PrSkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}

func testSynthesizedImplementation() -> Void {
    let twoThreeFour = PrVector3D(x: 2.0, y: 3.0, z: 4.0)
    let anotherTwoThreeFour = PrVector3D(x: 2.0, y: 3.0, z: 4.0)
    if twoThreeFour == anotherTwoThreeFour {
        print("PrSynthesizedImplementation Equatable")
    }
    
    print("PrSynthesizedImplementation Hashable value: " + "\(twoThreeFour.hashValue)")

    
    print("PrSynthesizedImplementation Comparable : ")
    let levels = [PrSkillLevel.intermediate, PrSkillLevel.beginner,
                  PrSkillLevel.expert(stars: 5), PrSkillLevel.expert(stars: 3)]
    for level in levels.sorted() {
        print(level)
    }
}
