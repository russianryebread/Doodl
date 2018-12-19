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
    let cursorImage = NSImage(named:NSImage.Name("cursor.png"))

    func applicationDidFinishLaunching(_ notification: Notification) {
        
        constructMenu()

        // Setup global hot key for ⌥⌘⇧D
        let hotKey = HotKey(key: .d, modifiers: [.control, .option])
        hotKey.keyDownHandler = {
            print("Doodl hotkey activate!")
            NSApp.activate(ignoringOtherApps: true)
        }
        
    }
    
    func applicationDidUnhide(_ notification: Notification) {
        setCursor()
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationDidBecomeActive(_ notification: Notification) {
        setCursor()
    }
    
    func applicationWillResignActive(_ notification: Notification) {
        
    }
    
    func setCursor(){
        NSCursor(image: cursorImage!, hotSpot: NSPoint(x: 0, y: 30)).set()
    }
    
    @objc func activate() {
        NSApp.activate(ignoringOtherApps: true)
        setCursor()
    }
    
    func constructMenu() {
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(activate)
        }
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Draw", action: #selector(activate), keyEquivalent: "D"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Doodl", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
}  // end class

