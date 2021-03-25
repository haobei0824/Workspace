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
            
            if var lastItem = self.intervals.last {
                lastItem.end = DispatchTime.now().rawValue
                
                self.intervals.removeLast()
                self.intervals.append(lastItem)
            }
        }
        self.status = WatchStatus.INITIAL
    }
    
}


extension Watch {
    func start() -> Void {
        if self.status == WatchStatus.INITIAL || self.status == WatchStatus.SUSPENDED {
            let item = WatchInterval()
            self.intervals.append(item)
            
            self.timer.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.milliseconds(10))
            self.timer.resume()
            self.status = WatchStatus.RUNNING
        }
    }
    
    func pause() -> Void {
        if self.status != WatchStatus.RUNNING {
            return
        }
        
        self.timer.suspend()
        self.status = WatchStatus.SUSPENDED
    }
    
    func reset() -> Void {
        if self.status != WatchStatus.SUSPENDED {
            return
        }
        
        self.intervals.removeAll()
        
        self.timer.suspend()
        self.status = WatchStatus.INITIAL
    }
    
    func lap() -> Void {
        if self.status != WatchStatus.RUNNING {
            return
        }
        
        if var lastItem = self.intervals.last {
            lastItem.laps.append(DispatchTime.now().rawValue)
            lastItem.end = DispatchTime.now().rawValue
            
            self.intervals.removeLast()
            self.intervals.append(lastItem)
        }
    }
}

extension Watch {
    func currentLapTime() -> TimeItem {
        var time = TimeItem()
        
        if let lastItem = self.intervals.last {
            let naSeconds = (lastItem.end - lastItem.start)
            print("naSeconds:" + "\(naSeconds)")
            let tmpMilliseconds = (naSeconds / 10_000_000)
            time.milliseconds = tmpMilliseconds.twoText()
            
            let totalSeconds = naSeconds / 1000_000_000
            time.seconds =  (totalSeconds % 60).twoText()
            time.minute = (totalSeconds / 60).twoText()
        }
        
        return time
    }
    
    func totalTime() -> TimeItem {
//        var time = TimeItem()
        
        return TimeItem()
    }
    
    func lapItems() -> [TimeItem] {
        return [TimeItem]()
    }
}

extension UInt64 {
    func twoText() -> String {
        let first = self % 10
        let second = (self / 10) % 10
        return "\(second)" +  "\(first)"
    }
}

//dispatch_time_t
//dispatch_source_set_timer
//
//DispatchSourceTimer
