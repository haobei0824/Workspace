//
//  PrProtocolExtension.swift
//  Protocols
//
//  Created by Csy on 2020/10/30.
//

import Foundation

protocol PrPEDescription {
    var textualDescription: String { get }
}

protocol PrPEMyNameProtocol {
    var myName: String { get }
}

extension NSObject: PrPEDescription {
    var textualDescription: String {
        return self.description
    }
    
    var myName: String {
        return "NSObject"
    }
}

func testProtocolExtension() -> Void {
    let obj = NSObject()
    
    print("textualDescription() impled in extension: " + obj.textualDescription)
}

extension Array: PrPEDescription where Element: PrPEDescription {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

func testProtocolContionalExtension() -> Void {
    let objs = [NSObject(),NSObject()]
    
    print("Array contional implement textualDescription() in extension: " + objs.textualDescription)
}

extension NSObject: PrPEMyNameProtocol {}

func testProtocolDeclarInExtension() -> Void {
    let obj = NSObject()
    let nameProtocol: PrPEMyNameProtocol = obj
    
    print("NSObject declar implement PrPEMyNameProtocol myName() in extension: " + nameProtocol.myName)
}

