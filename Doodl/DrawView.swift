//
//  DrawView.swift
//  Doozle
//
//  Created by Ryan Hoshor on 12/18/18.
//  Copyright © 2018 Ryan  Hoshor. All rights reserved.
//  From: https://stackoverflow.com/a/47778503/810360

import Cocoa

class DrawView: NSView {

    var path: NSBezierPath = NSBezierPath()
    var drawing = false
    var timer: Timer?
    var color: NSColor = Defaults().GetColor()
    var lineWidth: CGFloat = Defaults().GetLineWidth()
    var cursor: NSCursor?
    
    override func mouseDown(with event: NSEvent) {
        NotificationCenter.default.post(name: Notification.Name(NotificationKey.MouseDown), object: nil)
        path.move(to: convert(event.locationInWindow, from: nil))
        needsDisplay = true
        drawing = true
        timer?.invalidate()
    }
    
    override func mouseDragged(with event: NSEvent) {
        NotificationCenter.default.post(name: Notification.Name(NotificationKey.MouseDragged), object: nil)
        path.line(to: convert(event.locationInWindow, from: nil))
        needsDisplay = true
        drawing = true
    }
    
    override func mouseUp(with event: NSEvent) {
        NotificationCenter.default.post(name: Notification.Name(NotificationKey.MouseUp), object: nil)
        drawing = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
            self.path.removeAllPoints()
            self.needsDisplay = true
        }
        
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        color.set()
        path.lineJoinStyle = .round
        path.lineCapStyle = .round
        path.lineWidth = lineWidth
        path.stroke()
    }
    
    func setLineColor() {
        color = Defaults().GetColor()
    }
    
    func setLineWidth() {
        lineWidth = Defaults().GetLineWidth()
    }
    
//    override func viewWillMove(toWindow newWindow: NSWindow?) {
//        let ta = NSTrackingArea(rect: self.bounds, options: [.mouseEnteredAndExited, .activeAlways, .inVisibleRect], owner: self, userInfo: nil)
//        self.addTrackingArea(ta)
//    }
//
//    override func mouseEntered(with event: NSEvent) {
//        PencilCursor.set()
//    }
//
//    override func mouseExited(with event: NSEvent) {
//        NSCursor.pointingHand.set()
//    }
    
}
