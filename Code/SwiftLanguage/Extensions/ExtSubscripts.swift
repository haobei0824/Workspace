//
//  ExtSubscripts.swift
//  Extensions
//
//  Created by Csy on 2020/10/21.
//

import Foundation

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

func testSubscripts() -> Void {
    let firstNumber = 12345[0]
    
    print("subscript: 12345[0] == " + "\(firstNumber)" + " in extension of Int")
}
