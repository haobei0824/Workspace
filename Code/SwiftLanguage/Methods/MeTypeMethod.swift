//
//  MeTypeMethod.swift
//  Methods
//
//  Created by Csy on 2020/12/8.
//

import Foundation

class MeLevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    func test() -> Void {
        let level = MeLevelTracker.highestUnlockedLevel
        if level > 0 {
            
        }
    }
}

