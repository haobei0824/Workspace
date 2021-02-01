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

```swift
func canThrowErrors() throws -> String
```

#### Throw Errors

use a ``throw`` statement to throw an error

```swift
func canThrowErrors() throws -> Void {
    throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
}
```

#### call throwing function

- Use ``try`` keyword  in front of throwing function
- Use ``do-catch``, if caller handle all error, the caller do not need declare `throws`

```swift
do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
} catch pattern 3, pattern 4 where condition {
    statements
} catch {
    statements
} 
```



