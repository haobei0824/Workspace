//
//  PrOptional.swift
//  Protocols
//
//  Created by Csy on 2020/11/17.
//

import Foundation

@objc protocol PrCounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
    func name() -> String;
}

class PrThreeSource: NSObject, PrCounterDataSource {
    func name() -> String {
        return self.description
    }
    
    let fixedIncrement = 3
}

class PrTowardsZeroSource: NSObject, PrCounterDataSource {
    func name() -> String {
        return self.description
    }
    
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

func testOptional() -> Void {
    let datasource1 = PrThreeSource()
    print("protocol optional datasource 1 :" + datasource1.name())
    
    let datasource2 = PrTowardsZeroSource()
    print("protocol optional datasource 2 :" + datasource2.name())
}







