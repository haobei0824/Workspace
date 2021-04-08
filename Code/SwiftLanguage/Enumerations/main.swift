//
//  main.swift
//  Enumerations
//
//  Created by jiayou on 2021/4/8.
//

import Foundation

enum Beverage {
    case coffee, tea, juice
}

let b1 = Beverage.tea
if b1 == .tea {
    print("Beverage.tea self: " + "\(b1)")
}

enum CompassPoint: Int{
    case north = 1
    case south = 2
    case east = 3
    case west = 4
}

let p1 = CompassPoint.south
print("CompassPoint.south self: " + "\(p1)")
print("CompassPoint.south rawValue: " + "\(p1.rawValue)")

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let p2 = Planet.venus
print("Planet.venus self: " + "\(p2)")
print("Planet.venus rawValue: " + "\(p2.rawValue)")
if p2 == .venus {
    print("Planet.venus self: " + "venus")
}

enum Zimu: String {
    case A = "a"
    case B
    case C
}
let z2 = Zimu.B
print("Zimu.B self: " + "\(z2)")
print("Zimu.B rawValue: " + "\(z2.rawValue)")

let positionToFind = 2
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

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
