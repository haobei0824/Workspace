//
//  PrProtocolComposition.swift
//  Protocols
//
//  Created by Csy on 2020/11/13.
//

import Foundation

protocol PrNamed {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}


class PrComposition: PrNamed,  Aged{
    var name: String = ""
    
    var age: Int = 0
}


func testProtocolComposition(composition: PrNamed & PrNamed) -> Void {
    composition.name
}
