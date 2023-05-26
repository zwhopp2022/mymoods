//
//  Streaks.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 4/19/23.
//

import Foundation

struct Streaks: Hashable {
    private var defaultStreak: Int
    private var streak: Int
    
    private var streakIncrement = 1
    private var incrementTest = 3
    private var reset = 0
    
    public init() {
        self.streak = 0
        self.defaultStreak = 0
        self.streakIncrement = 1
        self.incrementTest = 3
        self.reset = 0
        if (!UserDefaults.standard.bool(forKey: "databaseCreated")) {
            self.streak = self.defaultStreak
        }
        else {
            if moodDB.retrieveStreak().count == 0 {
                self.streak = 0
                moodDB.addStreakFirstStart()
            }
            else {
                self.streak = moodDB.retrieveStreak()[0].streak
            }
        }
    }
    
    public mutating func streaks() {
        let listOfDate = moodDB.retrieveReasons(moodTable: "everything")
        let lastTwo = listOfDate.suffix(2)
        let lastLog = lastTwo.first
        let recentLog = lastTwo.last
        let lastMonth = lastLog?.numMonth ?? 0
        let recentMonth = recentLog?.numMonth ?? 0
        let lastDay = lastLog?.numDay ?? 0
        let recentDay = recentLog?.numDay ?? 0
        
        if Int(lastMonth) == Int(recentMonth) {
            if Int(lastDay) == Int(recentDay) {
                moodDB.addStreak(newStreak: self.streak)
            }
            if (Int(lastDay) + 1) == Int(recentDay ) {
                self.streak += self.streakIncrement
                moodDB.addStreak(newStreak: self.streak)
            }
            if Int(lastDay) != Int(recentDay) {
                self.streak = reset
                moodDB.addStreak(newStreak: self.streak)
            }
        }
        if Int(lastMonth) != Int(recentMonth){
            self.streak = reset
            moodDB.addStreak(newStreak: self.streak)
        }
    }
    
    public func getStreak() -> Int {
        return self.streak
    }
}

