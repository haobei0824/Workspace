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
    var running = false
    
    var watch = Watch()
    var lapLabel = UILabel()
    var totalLabel = UILabel()
    var button1 = UIButton(type: .custom)
    var button2 = UIButton(type: .custom)
    var tableView = UITableView(frame: CGRect.zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lapLabel.textColor = UIColor.black
        self.lapLabel.font = UIFont.systemFont(ofSize: 15.0)
        self.lapLabel.text = self.watch.currentLapTime().timeText()
        self.view.addSubview(self.lapLabel)
        
        self.totalLabel.textColor = UIColor.black
        self.totalLabel.font = UIFont.systemFont(ofSize: 20.0)
        self.totalLabel.text = self.watch.totalTime().timeText()
        self.totalLabel.textAlignment = .center
        self.view.addSubview(self.totalLabel)
        
        self.button1.setTitle("Start", for: .normal)
        self.button1.setTitle("Stop", for: .selected)
        self.button1.setTitleColor(UIColor.systemGreen, for: .normal)
        self.button1.setTitleColor(UIColor.red, for: .selected)
        self.button1.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
        self.button1.addTarget(self, action: #selector(onTap1), for:UIControl.Event.touchUpInside)
        self.view.addSubview(self.button1)
        
        self.button2.setTitle("Lap", for: .normal)
        self.button2.setTitle("Reset", for: .selected)
        self.button2.setTitleColor(UIColor.black, for: .normal)
        self.button2.setTitleColor(UIColor.red, for: .selected)
        self.button2.setTitleColor(UIColor.gray, for: .disabled)
        self.button2.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
        self.button2.addTarget(self, action: #selector(onTap2), for:UIControl.Event.touchUpInside)
        self.button2.isEnabled = false
        self.view.addSubview(self.button2)
        
        self.tableView.backgroundColor = .white
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
        self.watch.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.lapLabel.frame = CGRect(x: self.view.bounds.size.width * 0.5, y: 100, width: self.view.bounds.size.width * 0.5, height: 30)
        self.totalLabel.frame = CGRect(x: 0, y: 140, width: self.view.bounds.size.width , height: 50)
        self.button1.frame = CGRect(x: 100, y: self.totalLabel.frame.origin.y + 60, width: 50, height: 30)
        self.button2.frame = CGRect(x: self.button1.frame.origin.x + 80, y: self.button1.frame.origin.y , width: 50, height: 30)
        self.tableView.frame = CGRect(x: 0, y: self.view.bounds.size.height - 400, width: self.view.bounds.size.width, height: 400)
    }
    
    func testTimer() -> Void {
        let timer = DispatchSource.makeTimerSource()
        let currentTime1 = DispatchTime.now()
        
        timer.setEventHandler {
//            print("123")
            let currentTime2 = DispatchTime.now()
            let diff = currentTime1.distance(to: currentTime2)
            print("diff: " + "\(diff)")
            
        }
        timer.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.milliseconds(10))
        timer.resume()
        self.timer = timer
        self.running = true
        
        let t1 = DispatchTimeInterval.microseconds(10)
        print("t1 : " + "\(t1)")
    }
    
    @objc func onTap() -> Void {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let ran = Int.random(in: 1...100)
        if ran % 2 == 0 {
            self.watch.lap()
            let lap = self.watch.currentLapTime()
            print("lap time:" + "\(lap)")
        } else {
            let lap = self.watch.currentLapTime()
            print("lap time:" + "\(lap)")
            
            let total = self.watch.totalTime()
            print("total time:" + "\(total)")
        }

    }

}

extension ViewController {
    @objc func onTap1() -> Void {
        switch self.watch.watchStatus() {
        case .INITIAL, .SUSPENDED:
            do {
                self.watch.start()
                self.button1.isSelected = true
                
                self.button2.isEnabled = true
                self.button2.isSelected = false
            }
            
        case .RUNNING:
            do {
                self.watch.pause()
                self.button1.isSelected = false
                
                self.button2.isEnabled = true
                self.button2.isSelected = true     // reset
            }
        }
    }
    
    @objc func onTap2() -> Void {
        if !self.button2.isSelected {       // lap
            self.watch.lap()
        } else {        // reset
            self.watch.reset()
            
            self.lapLabel.text = self.watch.currentLapTime().timeText()
            self.totalLabel.text = self.watch.totalTime().timeText()
            
            self.button1.isSelected = false
            self.button2.isSelected = false
            self.button2.isEnabled = false
        }
    }
}

extension ViewController: WatchDelegate {
    func watch(onFire watch:Watch) -> Void {
        self.lapLabel.text = self.watch.currentLapTime().timeText()
        self.totalLabel.text = self.watch.totalTime().timeText()
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.watch.lapItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell =  tableView.dequeueReusableCell(withIdentifier: "cell"){
            
            return cell
        }
        
        
        return UITableViewCell()
        
    }
    
    
}

