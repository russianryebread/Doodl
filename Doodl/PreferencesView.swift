//
//  PreferencesView.swift
//  Doodl
//
//  Created by Ryan Hoshor on 12/21/18.
//  Copyright © 2018 Ryan  Hoshor. All rights reserved.
//

import Cocoa

class PreferencesView: NSViewController {
    let defaults: Defaults = Defaults()
    
    @IBOutlet weak var colorWell: NSColorWell?
    @IBOutlet weak var lineWidth: NSTextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        colorWell!.color = defaults.GetColor()
        lineWidth!.stringValue = NSString(format: "%.2f", defaults.GetLineWidth()) as String
        
    }
    
    override func viewWillDisappear() {
        save(sender: nil)
    }
    
    @IBAction func save(sender: Any?) {
        guard let width = NumberFormatter().number(from: lineWidth!.stringValue) as? CGFloat else { return }
        
        defaults.SetColor(color: colorWell!.color)
        defaults.SetLineWidth(width: width)
        NotificationCenter.default.post(name: Notification.Name(NotificationKey.PrefsChanged), object: [colorWell!.color, lineWidth!.stringValue])
    }
    
}
