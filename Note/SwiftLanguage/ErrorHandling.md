[TOC]

### Basic

#### Representing Errors

Errors are represented by values of types that conform to the ``Error`` protocol

``Error``  is an empty protocol,  indicates that a type can be used for error handling

```swift
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
```

#### Propagating Errors

write the`` throws`` keyword in the function’s declaration after its parameters

- function
- method
- initializer



