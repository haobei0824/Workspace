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
- mutating



### Initializer Requirements

protocol syntax:

```swift
protocol SomeProtocol {

  init(someParameter: Int)

}
```

