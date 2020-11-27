//
//  PropPropertyWrappers.swift
//  Properties
//
//  Created by Csy on 2020/11/26.
//

import Foundation

@propertyWrapper
struct PropTwelveOrLess {
    private var number: Int
    init() { self.number = 0 }
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct PropSmallRectangle {
    @PropTwelveOrLess var height: Int
    @PropTwelveOrLess var width: Int
}

func testPropertyWrappers() -> Void {
    var rectangle = PropSmallRectangle()
    print("rectangle init height: " + "\(rectangle.height)")
    rectangle.height = 17
    print("rectangle after set height 17: " + "\(rectangle.height)")
}


