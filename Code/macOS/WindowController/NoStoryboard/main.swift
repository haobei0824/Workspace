//
//  main.swift
//  NoStoryboard
//
//  Created by jiayou on 2021/5/28.
//

import Foundation
import Cocoa

autoreleasepool {
    let app =   NSApplication.shared //创建应用
    let delegate = AppDelegate()
    app.delegate =  delegate //配置应用代理
//    app.run() //启动应用
    _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
}
