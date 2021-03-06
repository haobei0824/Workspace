[TOC]

### Extensions in Swift

Extensions add new functionality to 

- class, 
- structure, 
- enumeration, 
- protocol type

Extensions can

- Add computed instance properties and computed type properties
- Define instance methods and type methods
- Provide new initializers
- Define subscripts
- Define and use new nested types
- Make an existing type conform to a protocol



### Extension Syntax

```swift
extension SomeType {
    // new functionality to add to SomeType goes here
}

extension SomeType: SomeProtocol, AnotherProtocol {
    // implementation of protocol requirements goes here
} 
```

### Computed Property

can add instance properties and computed type properties

```swift
// computed instance properties
// computed type properties
extension Double {
    var km: Double {return self / 1000}
    static var max: Double {
        return Double.greatestFiniteMagnitude
    }
}
```

### Convenience initializers

can add convenience initializers，not designated initializers.

```swift
extension NSObject {
    convenience init(withName name: String) {
        self.init()
        print(" convenience initializer: initWithName(),in extension of NSObject");
    }
}
```

### Subscripts

Extensions can add new subscripts to an existing type

```swift
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0] == 5
```

### Nested Types

Extensions can add new nested types to existing classes, structures, and enumerations

```swift
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
```

