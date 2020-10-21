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

