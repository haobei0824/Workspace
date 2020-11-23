//
//  PropStoredProperties.swift
//  Properties
//
//  Created by Csy on 2020/11/22.
//

import Foundation

struct PropFixedLengthRange {
    var firstValue: Int
    let length: Int
}

class PropDataImporter {
    var filename = "data.txt"
    init() {
        print("PropDataImporter inited")
    }
}

class PropDataManager {
    lazy var importer = PropDataImporter()
    var data = [String]()
    lazy var dataName: String = {
        if data.capacity > 0 {
            return "data is full"
        }
        return "date is empty"
    }()
    init() {
        print("PropDataManager inited")
        print("PropDataManager access importer")
        print("importer file name: " + importer.filename)
        print("dataName : " + dataName)
    }
}

func testPropStoredProperties() -> Void {
    var rang1 = PropFixedLengthRange(firstValue: 12, length: 2)
    rang1.firstValue = 13
    
    let dataManager = PropDataManager()
    let dataName = dataManager.dataName
    print("second dataName : " + dataName)
}
