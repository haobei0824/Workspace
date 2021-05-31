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
        let frame = CGRect(x: 0, y: 0, width: 400, height: 100)
        let style: NSWindow.StyleMask = [NSWindow.StyleMask.titled, NSWindow.StyleMask.closable,NSWindow.StyleMask.resizable]
        let window = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
        
        let windowController = NSWindowController(window: window)
        window.windowController = windowController
        
        // ViewController内部一定要设置frame。window的frame以ViewController的frame为准
        let contentViewController = ViewController()
        windowController.contentViewController = contentViewController
        
        return windowController
    }()
    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.windowController.showWindow(self)
        self.windowController.window?.center()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

