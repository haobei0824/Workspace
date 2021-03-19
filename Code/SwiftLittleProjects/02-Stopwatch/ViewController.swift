//
//  ViewController.swift
//  02-Stopwatch
//
//  Created by jiayou on 2021/3/16.
//

import UIKit
/**
 label1：展示总的运行时间
 label2: 展示最近一次lap到现在的运行时间
 Reset/Lap 按钮
 Start/Stop 按钮
 Lap列表
 https://chrisyu.cn/20200813/ios_timer/
 */

class ViewController: UIViewController {
    var timer: DispatchSourceTimer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap));
        self.view.addGestureRecognizer(tap)
        
        let view = UIView(frame: CGRect(x: 0, y: 100, width: self.view.bounds.size.width, height: 100))
        view.backgroundColor = UIColor.blue;
        view.addGestureRecognizer(tap)
        self.view .addSubview(view)
        
        let timer = DispatchSource.makeTimerSource()
        let currentTime1 = DispatchTime.now()
        
        timer.setEventHandler {
            print("123")
            let currentTime2 = DispatchTime.now()
            
            let diff = currentTime1.distance(to: currentTime2)
            print("diff: " + "\(diff)")
            
        }
        timer.schedule(deadline: DispatchTime.now(), repeating: 2)
        timer.resume()
        self.timer = timer
    }
    
    @objc func onTap() -> Void {
        
    }

}

