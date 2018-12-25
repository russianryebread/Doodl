//
//  Defaults.swift
//  Doodl
//
//  Created by Ryan Hoshor on 12/22/18.
//  Copyright © 2018 Ryan  Hoshor. All rights reserved.
//

import Foundation
import Cocoa

class Defaults: NSObject {
    let userDefaults: UserDefaults = UserDefaults.standard
    
    let LINE_COLOR: NSColor = NSColor.init(red:0.60, green:0.89, blue:0.40, alpha:1.0)
    let LINE_WIDTH: CGFloat = 6.0
    
    func GetColor() -> NSColor {
        if let data = userDefaults.object(forKey: UserDefaultsKey.LineColorKey) as? Data {
           return (NSUnarchiver.unarchiveObject(with: data) as? NSColor ?? LINE_COLOR)
        }
        return LINE_COLOR
    }
    
    func SetColor(color: NSColor) {
        let c: Data = NSArchiver.archivedData(withRootObject: color)
        userDefaults.set(c, forKey: UserDefaultsKey.LineColorKey)
    }
    
    func GetLineWidth() -> CGFloat {
        return (userDefaults.object(forKey: UserDefaultsKey.LineWidthKey) as? CGFloat ?? LINE_WIDTH)
    }
    
    func SetLineWidth(width: CGFloat) {
        userDefaults.set(width, forKey: UserDefaultsKey.LineWidthKey)
    }
}

