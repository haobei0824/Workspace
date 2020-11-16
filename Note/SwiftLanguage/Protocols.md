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

### Protocols as Types

- As a parameter type or return type in a function, method, or initializer

- As the type of a constant, variable, or property

- As the type of items in an array, dictionary, or other container

```swift
func testProtocolType() -> Void {
    var persons = [PropertiesProtocol]()
    persons.append(PrPropertiesPerson())
    if let firstItem = persons.first {
        print("persons contain PropertiesProtocol: " + "\(firstItem)")
    }
}
```

### Delegate

`weak` reference delegate must be `Class-Only Protocols`.

```swift
protocol PrRondomDelegate: AnyObject {
    func random() -> Int;
}

class PrProtocolRandomer: PrRondomDelegate {
    func random() -> Int {
        return 1
    }
}

class PrProtocolDelegateViewController {
    weak var weakDelegate: PrRondomDelegate?
    var delegate: PropertiesProtocol?
    
    func work() -> Void {
        if let randomNum =  weakDelegate?.random(){
            print("weak delegate random(): " + "\(randomNum)")
        }
        
        if let name =  delegate?.readonlyName {
            print("delegate readonlyName(): " + name)
        }
    }
}
```

### conform to Protocol by type with Extension 

- extend an existing type to adopt and conform to a new protocol 
- Conditionally extend a `generic type` to adopt and conform to a new protocol
- Declaring Protocol Adoption with an Extension

```swift
protocol PrPEDescription {
    var textualDescription: String { get }
}

// extend an existing type to adopt and conform to a new protocol 
extension NSObject: PrPEDescription {
    var textualDescription: String {
        return self.description
    }
    
    var myName: String {
        return "NSObject"
    }
}

// Conditionally extend a `generic type` to adopt and conform to a new protocol
extension Array: PrPEDescription where Element: PrPEDescription {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

// Declaring Protocol Adoption with an Extension
protocol PrPEMyNameProtocol {
    var myName: String { get }
}
extension NSObject: PrPEMyNameProtocol {}
```

### Synthesized Implementation

Swift can automatically provide the below protocol conformance：

- Equatable
- Hashable
- Comparable

**Equatable**, the following kinds of custom types:

- Structures that have only stored properties that conform to the `Equatable` protocol
- Enumerations that have only associated types that conform to the `Equatable` protocol
- Enumerations that have no associated types

**Hashable**, the following kinds of custom types:

- Structures that have only stored properties that conform to the `Hashable` protocol
- Enumerations that have only associated types that conform to the `Hashable` protocol
- Enumerations that have no associated types

**Comparable**, the following kinds of custom types:

- enumerations that don’t have a raw value

- If the enumeration has associated types, they must all conform to the Comparable protocol

```swift
struct PrVector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

extension PrVector3D: Hashable {}

enum PrSkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}

func testSynthesizedImplementation() -> Void {
    let twoThreeFour = PrVector3D(x: 2.0, y: 3.0, z: 4.0)
    let anotherTwoThreeFour = PrVector3D(x: 2.0, y: 3.0, z: 4.0)
    if twoThreeFour == anotherTwoThreeFour {
        print("PrSynthesizedImplementation Equatable")
    }
    
    print("PrSynthesizedImplementation Hashable value: " + "\(twoThreeFour.hashValue)")

    
    print("PrSynthesizedImplementation Comparable : ")
    let levels = [PrSkillLevel.intermediate, PrSkillLevel.beginner,
                  PrSkillLevel.expert(stars: 5), PrSkillLevel.expert(stars: 3)]
    for level in levels.sorted() {
        print(level)
    }
}
```

### Protocol Inheritance

A protocol can 

- inherit one or more other protocols and can 
- add further requirements on top of the requirements it inherits

```swift
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}
```

### Class-Only Protocols

limit protocol adoption to class types (and not structures or enumerations) by adding the ``AnyObject`` protocol

```swift
protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
    // class-only protocol definition goes here
}
```




