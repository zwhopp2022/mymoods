//
//  XPStreakInput.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 5/26/23.
//

import Foundation

struct XPInput: Hashable {
    var XP: Int = 0
    
    public init (initXP: Int){
        self.XP = initXP
    }

}

struct StreakInput: Hashable {
    var streak: Int = 0
    
    public init (initStreak: Int){
        self.streak = initStreak
    }

}

