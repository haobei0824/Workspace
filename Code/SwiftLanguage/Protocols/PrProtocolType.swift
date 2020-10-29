//
//  PrProtocolType.swift
//  Protocols
//
//  Created by Csy on 2020/10/29.
//

import Foundation

func testProtocolType() -> Void {
    var persons = [PropertiesProtocol]()
    persons.append(PrPropertiesPerson())
    if let firstItem = persons.first {
        print("persons contain PropertiesProtocol: " + "\(firstItem)")
    }
}
