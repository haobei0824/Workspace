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



