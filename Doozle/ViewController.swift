
import Cocoa
//import HotKey
import Carbon

class ViewController: NSViewController {
    
    let webViewController = WebViewController()  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup hot key for ⌥⌘D
//        let hotKey = HotKey(key: .d, modifiers: [.command, .option])
//
//        hotKey.keyDownHandler = {
//            print("Pressed at \(Date())")
//        }
    }

}
