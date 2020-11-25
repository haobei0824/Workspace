//
//  PropComputedProperties.swift
//  Properties
//
//  Created by Csy on 2020/11/25.
//

import Foundation

struct PropPoint {
    var x = 0.0, y = 0.0
}
struct PropSize {
    var width = 0.0, height = 0.0
}
struct PropRect {
    var origin = PropPoint()
    var size = PropSize()
    var center: PropPoint {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return PropPoint(x: centerX, y: centerY)
        }
        // 推荐使用这种样式
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    
    // readonly computed property
    var area:Double {
        return size.width * size.height
    }
}

struct PropAlternativeRect {
    var origin = PropPoint()
    var size = PropSize()
    var center: PropPoint {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return PropPoint(x: centerX, y: centerY)
        }
        set {
            // 使用newValue
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

func testPropComputedProperties() -> Void {
    var rect1 = PropRect()
    rect1.size = PropSize(width: 1.0, height: 2.0)
    print("rect1 read center: " + "\(rect1.center)")
    
    rect1.center = PropPoint(x: 1.2, y: 5.0)
    print("rect1 set center: " + "\(rect1.center)")
    
    rect1.center = PropPoint(x: 1.2, y: 5.0)
    print("rect1 read only property area: " + "\(rect1.area)")
    
    var rect2 = PropAlternativeRect()
    rect2.size = PropSize(width: 1.0, height: 2.0)
    print("rect2 read center: " + "\(rect2.center)")
    
    rect2.center = PropPoint(x: 1.2, y: 5.0)
    print("rect2 set center: " + "\(rect2.center)")
}


