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
    var numMonth: Int = 0
    var numDay: Int = 0
    
    public init (inittimeDate: String, initreason: String, initmood: String, initnumMonth: Int, initnumDay: Int){
        self.reason = initreason
        self.mood = initmood
        self.timeDate = inittimeDate
        self.numMonth = initnumMonth
        self.numDay = initnumDay
    }

}
