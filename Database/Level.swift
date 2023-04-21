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
    private var threeStreakXp: Int = 15
    private var sevenStreakXp: Int = 25
    private var twentyStreakXp: Int = 30
    
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
        if Streaks().streak < 3 {
            self.currentXp += noStreakXpIncrement
            moodDB.addExperienceForInput(newXpLevel: self.currentXp)
        }
        if Streaks().streak >= 3 {
            self.currentXp += threeStreakXp
            moodDB.addExperienceForInput(newXpLevel: self.currentXp)
        }
        if Streaks().streak >= 7 {
            self.currentXp += sevenStreakXp
            moodDB.addExperienceForInput(newXpLevel: self.currentXp)
        }
        if Streaks().streak >= 28 {
            self.currentXp += twentyStreakXp
            moodDB.addExperienceForInput(newXpLevel: self.currentXp)
        }
    }
    

    public func getCurrentLevel() -> Int {
        var level: Int
        if (self.currentXp < 10) {
            level = 0
        }
        
        // for every 100 xp, level will increase by 1
        
        level = self.currentXp / 100
        
        
        return level
    }
}
