//
//  ExtInitializers.swift
//  Extensions
//
//  Created by Csy on 2020/10/21.
//

import Foundation

extension NSObject {
    convenience init(withName name: String) {
        self.init()
        print("Initializer : init(withName:), in extension of NSObject");
    }
}

func testInitializers() -> Void {
    _ = NSObject(withName: "123")
}
