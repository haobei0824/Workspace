//
//  ViewController.swift
//  NoStoryboard
//
//  Created by jiayou on 2021/5/28.
//

import Cocoa

class ViewController: NSViewController {
    // 必须重写 loadView 方法，并且创建view，否则运行时会出错
    override func loadView() {
        view = NSView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

