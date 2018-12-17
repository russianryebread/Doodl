//
//  AppDelegate.swift
//  Doozle
//
//  Created by Ryan Hoshor on 12/9/18.
//  Copyright © 2019 Ryan Hoshor. All rights reserved.
//

import Cocoa
//import Carbon
//import HotKey

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        // Setup global hot key for ⌥⌘D
//        let hotKey = HotKey(key: .d, modifiers: [.command, .option])
//
//        hotKey.keyDownHandler = {
//            print("Pressed at \(Date())")
//        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }  // end func
    
}  // end class

