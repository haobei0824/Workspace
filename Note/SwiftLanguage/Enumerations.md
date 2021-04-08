[toc]

### Syntax

introduce enumerations with the ``enum`` keyword

```swift
enum SomeEnumeration {
    // enumeration definition goes here
} 
```

use the ``case``  keyword to introduce new enumeration cases

```swift
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
```

Define a var with enum type

```swift
var directionToHead = CompassPoint.west
directionToHead = .east
```

#### Matching Enumeration Values with a Switch Statement

```swift
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// Prints "Mostly harmless”
```

#### Iterating over Enumeration Cases

it’s useful to have a collection of all of that enumeration’s cases. 

You enable this by writing : ``CaseIterable`` after the enumeration’s name.”

```swift
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available”

for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice”

```



### Raw value

Each raw value must be unique within its enumeration declaration. Raw values can be

- strings
- characters
- integer or floating-point

You should specify type in define

```swift
enum CompassPoint: Int{
    case north = 1
    case south = 2
    case east = 3
    case west = 4
}

let p1 = CompassPoint.south
print("CompassPoint.south self: " + "\(p1)")
print("CompassPoint.south rawValue: " + "\(p1.rawValue)")
```



#### Implicitly Assigned Raw Values

Swift automatically assigns the values for you with above type

- integer
- String

The implicit rule is:

-  Integer: each case is one more than the previous case. If the first case doesn’t have a value set, its value is 0.
- String:  the implicit value for each case is the text of that case’s name.


```swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let p2 = Planet.venus
print("Planet.venus self: " + "\(p2)")
print("Planet.venus rawValue: " + "\(p2.rawValue)")

enum Zimu: String {
    case A = "a"
    case B
    case C
}
let z2 = Zimu.B
print("Zimu.B self: " + "\(z2)")
print("Zimu.B rawValue: " + "\(z2.rawValue)")
```

#### Initializing from a Raw Value

the enumeration automatically receives an initializer that takes a value of the raw value’s type (as a parameter called rawValue)

the raw value initializer always returns an ``optional enumeration case``

```swift
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
} 
```



### Associated Values

Enumeration cases can specify associated values of any type to be stored along with each different case value.

it varies each time you use that case as a value in your code.

You extract each associated value as a constant (with the let prefix) or a variable (with the var prefix) for use within the switch case’s body:

```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
```

