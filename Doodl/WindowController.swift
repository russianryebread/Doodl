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
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(cursor),
            name: NSWindow.didBecomeKeyNotification,
            object: nil
        )
        
    }
    
    @objc func cursor() {
        print("key")
        if let image = NSImage(named:NSImage.Name("cursor.png")) {
            NSCursor(image: image, hotSpot: NSPoint(x: 0, y: 30)).set()
        }
    }
    
    func windowDidBecomeKey(_ notification: Notification) {
        print("windowDidBecomeKey")
        if let image = NSImage(named:NSImage.Name("cursor.png")) {
            NSCursor(image: image, hotSpot: NSPoint(x: 0, y: 30)).set()
        }
    }

}
