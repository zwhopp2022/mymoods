//
//  FeelingInput.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 3/5/23.
//

import Foundation

struct FeelingInput: Hashable {
    var reason: String = ""
    var mood: String = ""
    var timeDate: String = ""
    
    public init (inittimeDate: String, initreason: String, initmood: String){
        self.reason = initreason
        self.mood = initmood
        self.timeDate = inittimeDate
    }
}
