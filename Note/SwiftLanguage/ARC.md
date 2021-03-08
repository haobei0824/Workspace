[TOC]

### What is ARC

 ARC automatically frees up the memory used by class instances when those instances are no longer needed.

### Resolving Strong Reference Cycles for classes

- weak references
- unowned references

#### Weak References

A `weak` reference is a reference that does not keep a strong hold on the instance it refers to.

- it’s possible for that instance to be deallocated while the weak reference is still referring to it
- they are always declared as variables, rather than constants, of an `optional type`
- ARC automatically sets a weak reference to nil when the instance that it refers to is deallocated


```swift
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
```

#### unowned references

A `unowned` reference is a reference that does not keep a strong hold on the instance it refers to.

- an unowned reference is used when the other instance has the same lifetime or a longer lifetime

- an unowned reference is expected to always have a value

- ARC never sets an unowned reference’s value to nil


```swift
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
```

#### Unowned Optional References

A `unowned` optional reference is a reference that does not keep a strong hold on the instance it refers to.

- it’s possible for that instance to be deallocated while the weak reference is still referring to it
- you’re responsible for making sure it always refers to a valid object or is set to nil


### Resolving Strong Reference Cycles for Closures

- Define a capture list as part of the closure’s definition
- declare each captured reference to be a weak or unowned reference rather than a strong reference in capture list


```swift
lazy var someClosure = {
    [unowned self, weak delegate = self.delegate]
    (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}
```

