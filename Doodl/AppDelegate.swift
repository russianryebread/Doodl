//
//  AppDelegate.swift
//  Doozle
//
//  Created by Ryan Hoshor on 12/9/18.
//  Copyright © 2019 Ryan Hoshor. All rights reserved.
//

import Cocoa
import Carbon
import HotKey

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let pencil: NSCursor = NSCursor(image: NSImage(named: "cursor.png")!, hotSpot: NSPoint(x: 0, y: 30))
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        constructMenu()

        // Setup global hot key for ⌥⌘⇧D
        let hotKey = HotKey(key: .d, modifiers: [.control, .option])
        hotKey.keyDownHandler = {
            print("Doozle Activate!")
            NSApp.activate(ignoringOtherApps: true)
        }
        
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationDidBecomeActive(_ notification: Notification) {

        // Custom Cursor
        if let image = NSImage(named:NSImage.Name("cursor.png")) {
            let customCursor = NSCursor(image: image, hotSpot: NSPoint(x: 0, y: 30))
            customCursor.set()
        }
    }
    
    func applicationWillResignActive(_ notification: Notification) {
        NSCursor.arrow.set()
    }
    
    @objc func activate() {
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func constructMenu() {
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            //button.action = #selector(activate)
        }
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Draw", action: #selector(activate), keyEquivalent: "D"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Doozle", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
}  // end class

