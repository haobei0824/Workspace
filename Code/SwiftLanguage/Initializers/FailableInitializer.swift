//
//  FailableInitializer.swift
//  Initializers
//
//  Created by Xinhong on 2021/1/20.
//

import Foundation


class InitDocument {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}


func testFailableInitializer() -> Void {
    let d = InitDocument(name: "")
    print(d)
}
