//
//  PropPropertyObservers.swift
//  Properties
//
//  Created by Csy on 2020/11/26.
//

import Foundation

class PropStepCounter {
    var totalSteps: Int = 0 {       // stored property
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

func testPropertyObservers() -> Void {
    let stepCounter = PropStepCounter()
    stepCounter.totalSteps = 2
    stepCounter.totalSteps = 6
}
