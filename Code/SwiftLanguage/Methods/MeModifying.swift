//
//  MeModifying.swift
//  Methods
//
//  Created by Csy on 2020/12/8.
//

import Foundation

struct MePoint {
    var x = 0.0, y = 0.0
    
    // modify property
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
    // modify self
    mutating func moveBy2(x deltaX: Double, y deltaY: Double) {
        self = MePoint(x: x + deltaX, y: y + deltaY)
    }
}

func testMeModifying() -> Void {
    var point = MePoint()
    print("init point: " + "\(point)")
    
    point.moveBy(x: 1, y: 1)
    print("change point with modify property : " + "\(point)")
    
    point.moveBy2(x: 2, y: 5)
    print("change point with modify self : " + "\(point)")
}

