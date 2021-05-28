//
//  AppDelegate.swift
//  NoStoryboard
//
//  Created by jiayou on 2021/5/28.
//

// https://zyqhi.github.io/2019/08/29/empty-macos-app.html

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    lazy var windowController: NSWindowController = {
        let frame = CGRect(x: 0, y: 0, width: 400, height: 280)
        let style: NSWindow.StyleMask = [NSWindow.StyleMask.titled, NSWindow.StyleMask.closable,NSWindow.StyleMask.resizable]
//        let window = NSWindow(contentViewController: ViewController())
        let window = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
        let controller = NSWindowController()
        controller.window = window
        controller.contentViewController = ViewController()
        window.contentView?.addSubview(controller.contentViewController!.view)
        
        return controller
    }()
    
    var window: NSWindow!
    var vc: ViewController!
    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        self.windowController.showWindow(self)
        self.windowController.window?.makeKeyAndOrderFront(nil)
//        window = NSWindow(contentRect: NSRect(x: 100, y: 100, width: 640, height: 480), styleMask: .resizable, backing: .buffered, defer: false)
//        vc = ViewController()
//        window?.contentView?.addSubview(vc.view)
//        vc.view.
        
//        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

