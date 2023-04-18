//
//  Levels.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 4/14/23.
//

import Foundation

public struct Level : Hashable {
    private let defaultXp: Int
    private var currentXp: Int
    
    private var noStreakXpIncrement: Int = 10
    
    // have levels become longer to reach sequentially
    
    init () {
        self.defaultXp = 0
        self.noStreakXpIncrement = 10
        self.currentXp = 0
        if (!UserDefaults.standard.bool(forKey: "databaseCreated")) {
            self.currentXp = self.defaultXp
        }

    }
    
    public func getCurrentXp() -> Int {
        return self.currentXp
    }
    
    public mutating func addExperience() {
        self.currentXp += noStreakXpIncrement
        moodDB.addExperienceForInput(newXpLevel: self.currentXp)
    }
    
    public func calculateLevel() {
        return self.currentXp /
    }
    

    var xp = 90

    func determineLevel() -> Int {
        var level: Int
        var threshold: Int
        if (xp < 10) {
            level = 0
        }
        
        threshold = 2 * xp + 30 + xp
        
        
        return threshold
    }
}
