//
//  Streaks.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 4/19/23.
//

import Foundation

struct Streaks: Hashable {
    private var defaultStreak: Int = 0
    private var streak: Int = 0
    
    private var streakIncrement = 1
    private var incrementTest = 20
    private var reset = 0
    
    public init() {
        self.streak = 0
        self.defaultStreak = 0
        self.streakIncrement = 1
        self.incrementTest = 20
        self.reset = 0
        if (!UserDefaults.standard.bool(forKey: "databaseCreated")) {
            self.streak = self.defaultStreak
        }
    }
    
    public mutating func streaks() {
        let listOfDate = moodDB.retrieveReasons(moodTable: "everything")
        let lastTwo = listOfDate.suffix(2)
        let lastLog = lastTwo.first
        let recentLog = lastTwo.last
        let lastMonth = lastLog?.numMonth
        let recentMonth = recentLog?.numMonth
        let lastDay = lastLog?.numDay
        let recentDay = recentLog?.numDay
        print(lastDay)
        print(lastLog)
        
        if lastMonth == recentMonth {
            if lastDay == recentDay {
                self.streak += incrementTest
                moodDB.addStreak(newStreak: self.streak)
            }
            if ((lastDay ?? 0) + 1) == (recentDay ?? 0) {
                self.streak += streakIncrement
                moodDB.addStreak(newStreak: self.streak)
            }
            else {
                self.streak = reset
                moodDB.addStreak(newStreak: self.streak)
            }
        }
        else {
            self.streak = reset
            moodDB.addStreak(newStreak: self.streak)
        }
    }
    
    public func getStreak() -> Int {
        return self.streak
    }
}

