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

func substring() -> Void {
    let greeting = "Hello, world!"
    let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
    let beginning = greeting[..<index]
    // beginning is "Hello"

    // Convert the result to a String for long-term storage.
    let newString = String(beginning)
    
    print(newString)
}

func unicodeRepresentations() -> Void {
    let dogString = "Dog‼🐶"
    for codeUnit in dogString.utf8 {
        print("\(codeUnit) ", terminator: "")
    }
    // Prints "68 111 103 226 128 188 240 159 144 182 
    
    for codeUnit in dogString.utf16 {
        print("\(codeUnit) ", terminator: "")
    }
    // Prints "68 111 103 8252 55357 56374
    
    for scalar in dogString.unicodeScalars {
        print("\(scalar.value) ", terminator: "")
    }
    print("")
    // Prints "68 111 103 8252 128054 ”

}
