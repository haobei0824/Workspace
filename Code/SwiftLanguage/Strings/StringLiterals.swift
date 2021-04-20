//
//  StringLiterals.swift
//  Strings
//
//  Created by jiayou on 2021/4/12.
//

import Foundation

func access() -> Void {
    let greeting = "Guten Tag!"
    greeting[greeting.startIndex]
    // G
    greeting[greeting.index(before: greeting.endIndex)]
    // !
    greeting[greeting.index(after: greeting.startIndex)]
    // u
    let index = greeting.index(greeting.startIndex, offsetBy: 7)
    greeting[index]
    // a”
    
    for index in greeting.indices {
        print("\(greeting[index]) ", terminator: "")
    }
}
