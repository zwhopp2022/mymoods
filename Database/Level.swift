//
//  Levels.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 4/14/23.
//

import Foundation

struct Level : Hashable {
    let defaultXp = 0
    let currentXp: Int
    public init () {
        if (!UserDefaults.standard.bool(forKey: "appHasBeenLaunchedBefore")) {
            this.currentXp = defaultXp
        }
    }
    
    public func addExperienceForInput () {
        
    }
}
