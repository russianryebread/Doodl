//
//  WindowController.swift
//  Doozle
//
//  Created by Ryan Hoshor on 12/9/18.
//  Copyright © 2019 Ryan Hoshor. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController, NSWindowDelegate {

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
        
        // Move to the active screen whenever we activate
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(objc_active),
            name: NSApplication.didBecomeActiveNotification,
            object: nil
        )
    }
    
    @objc func objc_active() {
        print("Active Notif")
        if(self.window?.screen != NSScreen.main) {
            if let s = NSScreen.main {
                self.window?.setFrame(s.frame, display: true)
            }
        }
    }

}
