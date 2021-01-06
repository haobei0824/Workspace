//
//  IniInitialProterty.swift
//  Initializers
//
//  Created by Csy on 2020/12/14.
//

import Foundation

class InitSurveyQuestion {
    let text: String = "12"
    let text2: String
    var response: String?
    init(text: String) {
        self.text2 = text
    }
    func ask() {
        print(text)
    }
}

// default initializer, for class , struct
class InitShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}


func testInit() -> Void {
    // default initializer
    let item = InitShoppingListItem()
    print("test default initializer: " , item)
}


