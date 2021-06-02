//
//  ViewController.swift
//  LifeCycle
//
//  Created by jiayou on 2021/6/2.
//

import Cocoa

class ViewController: NSViewController {
    override func loadView() {
        super.loadView()
        print("Life Cycle: " +  #function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Life Cycle: " +  #function)
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        print("Life Cycle: " +  #function)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print("Life Cycle: " +  #function)
    }
    
    override func viewWillLayout() {
        super.viewWillLayout()
        print("Life Cycle: " +  #function)
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        print("Life Cycle: " +  #function)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        print("Life Cycle: " +  #function)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

