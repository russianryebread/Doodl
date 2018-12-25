//
//  Constants.swift
//  Doodl
//
//  Created by Ryan Hoshor on 12/21/18.
//  Copyright © 2018 Ryan  Hoshor. All rights reserved.
//

import Foundation
import Cocoa

struct Constants {
    static let PreferencesView = "PreferencesView"
}

struct UserDefaultsKey {
    static let LineColorKey = "lineColorKey"
    static let LineWidthKey = "lineWidthKey"
}

struct NotificationKey {
    static let MouseDown = "mouseDown"
    static let MouseUp = "mouseUp"
    static let MouseDragged = "mouseDragged"
    
    static let PrefsChanged = "PrefsChanged"
}

let PencilCursor: NSCursor = NSCursor(image: NSImage(named:NSImage.Name("cursor.png"))!, hotSpot: NSPoint(x: 0, y: 30))

