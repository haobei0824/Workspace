//
//  SubInstanceSubscript.swift
//  Subscripts
//
//  Created by Csy on 2020/12/9.
//

import Foundation

struct SubMatrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

func testSubInstanceSubscript() -> Void {
    var m1 = SubMatrix(rows: 2, columns: 2)
    print("init Matrix: " + "\(m1)")
    
    m1[0,1] = 5
    print("set Matrix[0,1]: " + "\(m1)")
}
