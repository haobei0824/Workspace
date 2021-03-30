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
    
    func timeText() -> String {
        let isZero = (minute == "00") && (seconds == "00") && (milliseconds == "00")
        let separa = isZero ? ":" : "."

        return minute + ":" + seconds + separa + milliseconds
    }
}

protocol WatchDelegate: AnyObject {
    func watch(onFire watch:Watch) -> Void
}

class Watch {
    weak var delegate: WatchDelegate?
    
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
            
            DispatchQueue.main.async {
                if let delegate = self.delegate {
                    delegate.watch(onFire: self)
                }
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
    
    func watchStatus() -> WatchStatus {
        return self.status
    }
}

extension Watch {
    func currentLapTime() -> TimeItem {
        if self.intervals.count == 0 {
            return TimeItem()
        }
        
        var latestLap : UInt64? = nil
        var totalSeconds:UInt64 = 0
        var currentLapSeconds : UInt64  = 0
        
        for interval in self.intervals {
            if interval.laps.count > 0 {
                latestLap = interval.laps.last
                currentLapSeconds = interval.end - latestLap!
            } else {
                let intervalSeconds = interval.end - interval.start
                
                totalSeconds += intervalSeconds
                currentLapSeconds += intervalSeconds
            }
        }
        
        if latestLap == nil {
            return self.timeItem(WithNanoseconds: totalSeconds)
        }
        
        return self.timeItem(WithNanoseconds: currentLapSeconds)
    }
    
    func totalTime() -> TimeItem {
        var time = TimeItem()
        if self.intervals.count == 0 {
            return time
        }
        
        var nanoSeconds:UInt64 = 0
        for interval in self.intervals {
            nanoSeconds += (interval.end - interval.start)
        }
        time = self.timeItem(WithNanoseconds: nanoSeconds)
        
        return time
    }
    
    func lapItems() -> [TimeItem] {
        if self.intervals.count == 0 {
            return [TimeItem]()
        }
        
        var lapTimeItems = [TimeItem]()
        var previousNano: UInt64 = 0
        
        for interval in self.intervals {
            let start = interval.start
            for lapTime in interval.laps {
                lapTimeItems.append(self.timeItem(WithNanoseconds: (previousNano + (lapTime - start))))
            }
            
            previousNano += interval.end - start
        }
        
        return lapTimeItems
    }
    
    func timeItem(WithNanoseconds nanoSeconds:UInt64) -> TimeItem {
        var time = TimeItem()
        
        print("naSeconds:" + "\(nanoSeconds)")
        let tmpMilliseconds = (nanoSeconds / 10_000_000)
        time.milliseconds = tmpMilliseconds.twoText()
        
        let totalSeconds = nanoSeconds / 1000_000_000
        time.seconds =  (totalSeconds % 60).twoText()
        time.minute = (totalSeconds / 60).twoText()
        
        return time
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
