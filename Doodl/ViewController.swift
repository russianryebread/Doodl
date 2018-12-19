
import Cocoa

class ViewController: NSViewController {
    
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
        
    }

}
