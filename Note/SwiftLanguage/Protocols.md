[TOC]

The protocol define

- properties

- methods

The protocol can be adopted by 

- class

- structure
- enumeration



### Protocol Syntax

define protocol

```swift
protocol SomeProtocol {
    // protocol definition goes here
} 
```

adopt protocol

```swift
struct SomeStructure: FirstProtocol, AnotherProtocol {

  // structure definition goes here

}


class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {

  // class definition goes here

}
```

### Property Requirements

- instance property
-  type property

```swift
	protocol PropertiesProtocol {
    var name: String { get set }
    var readonlyName: String { get }
    
    static var count: Int {get set}
    static var max: Int { get }
}
```

### Method Requirements

- instance
- static
- mutating instance method, can be adopt by structures and enumerations

```swift
protocol PrMethodsProtocol {
    func random() -> Double
    static func getMax() -> Int
    mutating func increase() -> Void
}


class PrMethodsNumber: PrMethodsProtocol {
    var age = 10
    
    func random() -> Double {
        return 1.0
    }
    
    static func getMax() -> Int {
        return Int.max
    }
    
    func increase() -> Void {
        self.age += 1
    }
}

enum PrMethodsSwitch: PrMethodsProtocol {
    case off, on
    
    func random() -> Double {
        return 1.0
    }
    
    static func getMax() -> Int {
        return Int.max
    }
    
    mutating func increase() -> Void {
        self = .off
    }
}
```





### Initializer Requirements

protocol syntax:

```swift
protocol SomeProtocol {

  init(someParameter: Int)

}
```

- can be adopted as either a designated initializer or a convenience initializer

- In both cases, you must mark the initializer implementation with the `required` modifier:”

```swift
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}
```

use `required` and `override`, when a subclass

- overrides a designated initialize
- also implements a matching initializer protocol

```swift
protocol InitProtocol {
    init()
    init(withName name:String)
    init(withName name:String, age:Int16)
}

class IRSuperClass {
    init() {
        // initializer implementation goes here
    }
}

class IRSubClass: IRSuperClass, InitProtocol {
    required override init() {      // must declare override
        print("IRSubClass conform init() of InitProtocol")
    }
    
    required init(withName name: String, age: Int16) {
        print("IRSubClass conform init(withName,age) of InitProtocol")
    }
    
    required init(withName name: String) {
        print("IRSubClass conform init(withName) of InitProtocol")
    }
}
```

