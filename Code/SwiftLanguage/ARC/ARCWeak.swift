//
//  ARCWeak.swift
//  ARC
//
//  Created by jiayou on 2021/3/2.
//

import Foundation

class ARCPerson {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ARCApartment?
    deinit { print("\(name) is being deinitialized") }
}

class ARCApartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: ARCPerson?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

class ARCHTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    lazy var asHTML2: () -> String = {
        [weak weakSelf = self] in

        if let strongSelf = weakSelf {
            if let text = strongSelf.text {
                return "<\(strongSelf.name)>\(text)</\(strongSelf.name)>"
            } else {
                return "<\(strongSelf.name) />"
            }
        }
        return ""
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}
