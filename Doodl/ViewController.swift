
import Cocoa
import HotKey
import Carbon

class ViewController: NSViewController {
    
    var drawView: DrawView!
    var cursorImage: NSImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawView = DrawView(frame: self.view.frame)
        drawView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(drawView)
        
        [drawView.topAnchor.constraint(equalTo: view.topAnchor),
         drawView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         drawView.leftAnchor.constraint(equalTo: view.leftAnchor),
         drawView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach  {
            anchor in
            anchor.isActive = true
        }

        // Move to the active screen whenever we activate
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(objc_prefsChanged),
            name: Notification.Name(NotificationKey.PrefsChanged),
            object: nil
        )
    }
    
    @objc func objc_prefsChanged() {
        drawView.setLineColor()
        drawView.setLineWidth()
    }
    

}
