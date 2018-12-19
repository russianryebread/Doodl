//
//  CursorView.swift
//  Doozle
//
//  Created by Ryan Hoshor on 12/17/18.
//  Copyright © 2018 Ryan  Hoshor. All rights reserved.
//

import Cocoa

class CursorView: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        if let image = NSImage(named:NSImage.Name("cursor.png")) {
            let pencil = NSCursor(image: image, hotSpot: NSPoint(x: 0, y: 30))
            self.addCursorRect(self.frame, cursor: pencil)
        }
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
}
