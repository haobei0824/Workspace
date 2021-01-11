### Initial Values 

Stored Properties

- setting values in Initializer
- specify a default property value as part of the property’s declaration

```swift
struct Fahrenheit1 {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

struct Fahrenheit2 {
    var temperature = 32.0
} 
```

Optional Property Types

- automatically initialized with a value of nil

```swift
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
```

Constant Properties, once a constant property is assigned a value, it can’t be further modified

- specify a default property value as part of the property’s declaration
- setting values in Initializer

```swift
class IniSurveyQuestion {
    let text: String = "12"			// init
    let text2: String
    var response: String?
    init(text: String) {
        self.text2 = text			// init
    }
    func ask() {
        print(text)
    }
}
```





### Customizing Initialization

Parameter

- Parameter Names and Argument Labels
- Initializer Parameters Without Argument Labels



### Default Initializer

- for any structure or class 
- provides default values for all of its properties 
- does not provide at least one initializer itself

```swift
// default initializer, for class , struct
class InitShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

let item = InitShoppingListItem()
print("test default initializer: " , item)
```



### Memberwise Initializers for Structure Types

- do not define any of their own custom initializers
- even if it has stored properties that don’t have default values

```swift
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)”
```



###  Initializer Delegation for Value Types

initializer delegation

- structures and enumerations
- Initializers can call other initializers

```swift
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
```



### Class Inheritance and Initialization

Designated initializers 

- are the primary initializers for a class. 
-  fully initializes all properties introduced by that class and
-  calls an appropriate superclass initializer to continue the initialization process up the superclass chain

Convenience initializers

- to call a designated initializer from the same class
- 

