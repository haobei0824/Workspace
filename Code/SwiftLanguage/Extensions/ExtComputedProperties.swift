//
//  ExtComputedProperties.swift
//  Extensions
//
//  Created by Csy on 2020/10/16.
//

import Foundation

extension Double {
    var km: Double {return self / 1000}
}

extension NSObject {
    convenience init(withName name: String) {
        self.init()
        print("initWithName func extension in NSObject");
    }
    
    func myName() -> Void {
        print("myName func extension in NSObject ")
    }
}
