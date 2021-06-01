### 使用纯代码启动App

1. 删除工程配置中的story board

2. 增加`main.swift`

```swift
import Foundation
import Cocoa

autoreleasepool {
    let app =   NSApplication.shared //创建应用
    let delegate = AppDelegate()
    app.delegate =  delegate //配置应用代理
//    app.run() //启动应用
    _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
}
```

3. 修改`AppDelegate.swift`

```swift
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
```

4. 修改`ViewController.swift`

```swift
import Cocoa

class ViewController: NSViewController {
    // 必须重写 loadView 方法，并且创建view和frame，否则运行时会出错
    override func loadView() {
        view = NSView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```





