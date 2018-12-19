//
//  AppDelegate.swift
//  Doozle
//
//  Created by Ryan Hoshor on 12/9/18.
//  Copyright © 2019 Ryan Hoshor. All rights reserved.
//

import Cocoa
import Carbon
import Carbon.HIToolbox
//import HotKey
import Magnet

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let cursorImage = NSImage(named:NSImage.Name("cursor.png"))

    var timer: Timer = Timer.init()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        constructMenu()
        setupHotkeys()
        deactivate()
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

    func activate() {
        self.timer.invalidate()
        NSApp.activate(ignoringOtherApps: true)
        setCursor()
        setTimer()
    }
    
    @objc func objc_activate() {
        activate()
    }
    
    func deactivate() {
         NSApp.hide(self);
    }
    
    func setupHotkeys() {
        // Setup global hot key for ⌥⌘⇧D
//        let hotKey = HotKey(key: .d, modifiers: [.control, .option])
//        hotKey.keyDownHandler = {
//            print("Doodl hotkey activate!")
//            NSApp.activate(ignoringOtherApps: true)
//        }
        
        //if let keyCombo = KeyCombo(doubledCarbonModifiers: controlKey) {
        if let keyCombo = KeyCombo(keyCode: kVK_ANSI_D, cocoaModifiers: [.shift, .command]) {
            let hotKey = HotKey(identifier: "CommandShiftD", keyCombo: keyCombo) { hotKey in
                self.activate()
            }
            hotKey.register()
        }
        
        // Don't hide the app when drawing
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(objc_resetTimer),
            name: Notification.Name("mouseDown"),
            object: nil
        )
        
        // Don't hide the app when drawing
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(objc_setTimer),
            name: Notification.Name("mouseUp"),
            object: nil
        )
    }
    
    @objc func objc_resetTimer() {
        timer.invalidate()
    }
    
    func setTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            self.deactivate()
        }
    }
    
    @objc func objc_setTimer() {
        setTimer()
    }
    
    @objc func objc_about() {
        NSApplication.shared.orderFrontStandardAboutPanel()
        NSApp.activate(ignoringOtherApps: true)
    }
    
    
    func constructMenu() {
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
        }
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Draw", action: #selector(objc_activate), keyEquivalent: "D"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "About", action: #selector(objc_about), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Quit Doodl", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
}  // end class

