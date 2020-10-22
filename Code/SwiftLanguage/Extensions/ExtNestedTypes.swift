//
//  ExtNestedTypes.swift
//  Extensions
//
//  Created by Csy on 2020/10/22.
//

import Foundation

extension Int {
    enum Kind {
        case Negative
        case Zero
        case Positive
    }
    
    var kind: Kind {
        if self > 0 {
            return Kind.Positive
        }
        
        if self < 0 {
            return Kind.Negative
        }

        return .Zero
    }
}

func testNestType() -> Void {
    var num = 0
    print("Nested Types, the kind of " + "\(num)" + " is " + "\(num.kind)")
    
    num = 10
    print("Nested Types, the kind of " + "\(num)" + " is " + "\(num.kind)")
    
    num = -1
    print("Nested Types, the kind of " + "\(num)" + " is " + "\(num.kind)")
}
