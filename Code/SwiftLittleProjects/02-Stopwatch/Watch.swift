//
//  Watch.swift
//  02-Stopwatch
//
//  Created by jiayou on 2021/3/18.
//

import Foundation

enum WatchStatus {
    case INITIAL
    case RUNNING
    case SUSPENDED
}

struct WatchInterval {
    var start: Int64
    var end: Int64
    var laps : [Int64]
    
//    init() {
//        self.start =
//    }
    
}

//dispatch_time_t
//dispatch_source_set_timer
//
//DispatchSourceTimer
