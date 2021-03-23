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
    var start: UInt64
    var end: UInt64
    var laps : [UInt64]
    
    init() {
        self.start = DispatchTime.now().rawValue
        self.end = DispatchTime.now().rawValue
        self.laps = [UInt64]()
    }
}

struct TimeItem {
    var minute = "00"
    var seconds = "00"
    var milliseconds = "00"
}

class Watch {
    private var timer : DispatchSourceTimer
    private var status : WatchStatus
    private var intervals = [WatchInterval]()
    
    deinit {
        self.timer.setEventHandler(handler: nil)
        self.timer.cancel()
        
    }
    
    init() {
        self.status = WatchStatus.INITIAL
        self.timer = DispatchSource.makeTimerSource()
        self.timer.setEventHandler {
            [unowned  self] in
            
            let count = self.intervals.count
            if count > 0 {
                let lastItem = self.intervals.last
                
            }
        }
    }
    
}


extension Watch {
    func start() -> Void {
        
    }
    
    func pause() -> Void {
        
    }
    
    func reset() -> Void {
        
    }
    
    func lap() -> Void {
        
    }
}

extension Watch {
    func currentLapTime() -> TimeItem {
        
    }
    
    func totalTime() -> TimeItem {
        
    }
    
    func lapItems() -> [TimeItem] {
        
    }
}


//dispatch_time_t
//dispatch_source_set_timer
//
//DispatchSourceTimer
