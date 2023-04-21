//
//  Streaks.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 4/19/23.
//

import Foundation

struct Streaks: Hashable {
    var streak: Int = 0
    
    public init() {
        self.streak = streaks()
    }
    
    public mutating func streaks() -> Int{
        let listOfDate = moodDB.retrieveReasons(moodTable: "everything")
        let lastTwo = listOfDate.suffix(2)
        let lastLog = lastTwo.first
        let recentLog = lastTwo.last
        let lastMonth = lastLog?.numMonth
        let recentMonth = recentLog?.numMonth
        let lastDay = lastLog?.numDay
        let recentDay = recentLog?.numDay
        
        if lastMonth == recentMonth {
            if lastDay == recentDay {
                return self.streak
            }
            if ((lastDay ?? 0) + 1) == (recentDay ?? 0) {
                self.streak += 1
                return self.streak
            }
            else {
                self.streak = 0
                return self.streak
            }
        }
        else {
            self.streak = 0
            return self.streak
        }
    }
}

