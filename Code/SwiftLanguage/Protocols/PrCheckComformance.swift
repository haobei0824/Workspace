//
//  PrCheckComformance.swift
//  Protocols
//
//  Created by Csy on 2020/11/16.
//

import Foundation

protocol PrHasArea {
    var area: Double { get }
}

class PrCircle: PrHasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

func testCheckComformance() -> Void {
    let objects: [AnyObject] = [
        PrCircle(radius: 2.0)
    ]
    
    for obj in objects {
        if obj is PrHasArea {
            let circle = obj as! PrHasArea
            print("check protocol comformance use (is), (as!): " + "\(circle.area)" )
        }
        
        if let circle = obj as? PrHasArea {
            print("check protocol comformance use (as?): " + "\(circle.area)" )
        }
        
        if let circle = obj as? (PrHasArea & PrNamed) {
            print("check protocol comformance use (as?): " + "\(circle.area)" )
        }
    }
}
