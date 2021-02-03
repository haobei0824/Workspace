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

- Use ``try`` keyword  in front of throwing function, it will pass error to caller function, caller function need declare `throws`
- Use ``try?`` keyword  in front of throwing function, it will not pass error. Caller function no need declare `throws`
- Use ``try!`` keyword  in front of throwing function, it will crash if error happen,. caller function no need declare `throws`



#### Handling Errors Using Do-Catch

- Use ``do-catch``, if caller handle all error, the caller function do not need declare `throws`

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

```swift
// 未处理error，该函数需要声明为throws
func buyFavoriteSnack(person: String, vendingMachine: ErrVendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

// 处理了一种错误，该函数需要声明为throws
func buyFavoriteSnack2(person: String, vendingMachine: ErrVendingMachine) throws  {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    
    do {
        try vendingMachine.vend(itemNamed: snackName)
    } catch ErrVendingMachineError.invalidSelection {
        
    }
}

// 处理了所有错误，该函数就可以声明为no throws
func buyFavoriteSnack3(person: String, vendingMachine: ErrVendingMachine)  {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    
    do {
        try vendingMachine.vend(itemNamed: snackName)
    } catch {
        
    }
}
```



