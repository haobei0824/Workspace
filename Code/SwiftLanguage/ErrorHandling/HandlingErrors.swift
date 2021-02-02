//
//  HandlingErrors.swift
//  ErrorHandling
//
//  Created by Xinhong on 2021/2/1.
//

import Foundation


struct ErrItem {
    var price: Int
    var count: Int
}

enum ErrVendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

class ErrVendingMachine {
    var inventory = [
        "Candy Bar": ErrItem(price: 12, count: 7),
        "Chips": ErrItem(price: 10, count: 4),
        "Pretzels": ErrItem(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw ErrVendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw ErrVendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw ErrVendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")

    }
    
    func vend2() throws -> Int {
        let a = 2
        if a > 4 {
            throw ErrVendingMachineError.outOfStock
        }
        

        return 2
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

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

func testCallReturnFun1() throws {
    let machine = ErrVendingMachine()
    let result = try machine.vend2()    // 如果error，代码会中断
    print("result : " + "\(result)")
}

func testCallReturnFun2() {
    let machine = ErrVendingMachine()
    let result = try? machine.vend2()    // 如果error，代码不会中断
    print("result : " + "\(result)")
}

func testCallReturnFun3() {
    let machine = ErrVendingMachine()
    let result = try! machine.vend2()    // 如果error，程序异常
    print("result : " + "\(result)")
}

func testErrorHandling() -> Void {
    do {
//        try testCallReturnFun1()
        try testCallReturnFun2()
        try testCallReturnFun3()
    } catch  {
        
    }
}

