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
        
        let windowController = NSWindowController(window: window)
        window.windowController = windowController
//        window.windowController?.window = window
        
        let contentViewController = ViewController()
        window.windowController?.contentViewController = contentViewController
        window.contentView?.addSubview(contentViewController.view)
        
        return windowController
    }()
    
    var window: NSWindow!
    var windowController1 : NSWindowController!
    
    var vc: ViewController!
    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.showWindow2()
        
//        self.windowController.window?.makeKeyAndOrderFront(self)
//        self.windowController.window?.makeKeyAndOrderFront(nil)
//        window = NSWindow(contentRect: NSRect(x: 100, y: 100, width: 640, height: 480), styleMask: .resizable, backing: .buffered, defer: false)
//        vc = ViewController()
//        window?.contentView?.addSubview(vc.view)
//        vc.view.
        
//        window.makeKeyAndOrderFront(nil)
    }
    
    func showWindow2() -> Void {
        let frame = CGRect(x: 0, y: 0, width: 400, height: 280)
        let style: NSWindow.StyleMask = [NSWindow.StyleMask.titled, NSWindow.StyleMask.closable,NSWindow.StyleMask.resizable]
        window = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
        
        self.windowController1 = NSWindowController(window: window)
        window.windowController = self.windowController1
        
        vc = ViewController()
        window.contentView?.addSubview(vc.view)
        self.windowController1.contentViewController = self.vc
//        self.windowController1.window?.contentView?.addSubview(self.vc.view)
        
//        window.makeKeyAndOrderFront(nil)
        self.windowController1.showWindow(self)
    }
    
    func showWindow1() -> Void {
        let frame = CGRect(x: 0, y: 0, width: 400, height: 280)
        let style: NSWindow.StyleMask = [NSWindow.StyleMask.titled, NSWindow.StyleMask.closable,NSWindow.StyleMask.resizable]
        window = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
        
        self.windowController1 = NSWindowController(window: window)
        window.windowController = self.windowController1
        
        vc = ViewController()
        window.contentView?.addSubview(vc.view)
        
//        window.makeKeyAndOrderFront(nil)
        self.windowController1.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

