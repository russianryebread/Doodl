//
//  WindowController.swift
//  Doozle
//
//  Created by Ryan Hoshor on 12/9/18.
//  Copyright © 2019 Ryan Hoshor. All rights reserved.
//

import Cocoa
import HotKey

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.isOpaque = false
        window?.backgroundColor = NSColor.clear
//        window?.level = NSWindow.Level.floating
        window?.hidesOnDeactivate = true
        window?.ignoresMouseEvents = false

        // Full-screen window
        if let screen = window?.screen ?? NSScreen.main {
            window?.setFrame(screen.visibleFrame, display: true)
        }
    }

}
