
import Cocoa

class ViewController: NSViewController {
    
    var cursorView: CursorView!
    var drawView: DrawView!
    
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
        
        // Cursor
        cursorView = CursorView(frame: self.view.frame)
        cursorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cursorView)
        
        [cursorView.topAnchor.constraint(equalTo: view.topAnchor),
         cursorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         cursorView.leftAnchor.constraint(equalTo: view.leftAnchor),
         cursorView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach  {
            anchor in
            anchor.isActive = true
        }
        
    }

}
