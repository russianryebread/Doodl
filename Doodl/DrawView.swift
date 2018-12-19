//
//  DrawView.swift
//  Doozle
//
//  Created by Ryan Hoshor on 12/18/18.
//  Copyright © 2018 Ryan  Hoshor. All rights reserved.
//  From: https://stackoverflow.com/a/47778503/810360

import Cocoa

let LINE_COLOR: NSColor = NSColor.init(red:0.60, green:0.89, blue:0.40, alpha:1.0)
let LINE_WIDTH: CGFloat = 6.0

class DrawView: NSView {

    var path: NSBezierPath = NSBezierPath()
    var drawing = false
    var timer: Timer?
    
    override func mouseDown(with event: NSEvent) {
        path.move(to: convert(event.locationInWindow, from: nil))
        needsDisplay = true
        drawing = true
        timer?.invalidate()
    }
    
    override func mouseDragged(with event: NSEvent) {
        path.line(to: convert(event.locationInWindow, from: nil))
        needsDisplay = true
        drawing = true
    }
    
    override func mouseUp(with event: NSEvent) {
        drawing = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
            self.path.removeAllPoints()
            self.needsDisplay = true
        }
        
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        LINE_COLOR.set()
        
        path.lineJoinStyle = .round
        path.lineCapStyle = .round
        path.lineWidth = LINE_WIDTH
        path.stroke()
        
    }
    
}
