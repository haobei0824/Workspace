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
    // projectedValue can be any type.
    // Here projectedValue means number be set with newValue or not
    var projectedValue: Bool
    init() {
        self.number = 0
        self.projectedValue = true
    }
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                self.projectedValue = false
            } else {
                number = newValue
                self.projectedValue = true
            }
        }
    }
}

@propertyWrapper
struct PropSmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
//        self.init(wrappedValue:0)
        print("propertyWrapper PropSmallNumber init() ")
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
//        self.init(wrappedValue: wrappedValue, maximum: 12)
        print("propertyWrapper PropSmallNumber init(wrappedValue: Int)")
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        print("propertyWrapper PropSmallNumber init(wrappedValue: Int, maximum: Int)")
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

//Initial Values for Wrapped Properties
struct PropSmallRectangle {
    @PropTwelveOrLess var height: Int
    @PropTwelveOrLess var width: Int
    @PropSmallNumber var height2: Int   // init()
    @PropSmallNumber var height3: Int = 2       // init(wrappedValue: Int)
    @PropSmallNumber(wrappedValue: 2, maximum: 5) var height4: Int  // init(wrappedValue: Int, maximum: Int)
    @PropSmallNumber(maximum: 9) var height5: Int = 4   // init(wrappedValue: Int, maximum: Int)
    // 编译不过
//    @PropSmallNumber(wrappedValue: 2, maximum: 5) var height6: Int = 4
}

struct PropSmallRectangle2 {
    @PropTwelveOrLess var height: Int
    @PropTwelveOrLess var width: Int
}



func testPropertyWrappers() -> Void {
    var rectangle = PropSmallRectangle()
    print("rectangle init height: " + "\(rectangle.height)")
    print("rectangle init height, projectedValue:: " + "\(rectangle.$height)")
    
    rectangle.height = 5
    print("rectangle after set height 5: " + "\(rectangle.height)")
    print("rectangle after set height 5, projectedValue: " + "\(rectangle.$height)")
    
    rectangle.height = 17
    print("rectangle after set height 17: " + "\(rectangle.height)")
    print("rectangle after set height 17, projectedValue: " + "\(rectangle.$height)")
}


