//
//  TimeAndDate.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 4/19/23.
//

import Foundation

struct TimeAndDate: Hashable {
    var userDay: String = ""
    var userMonth: String = ""
    var userYear: String = ""
    var combinedDate: String = ""
    var combinedHour: String = ""
    var hourAndDate: String = ""
    var numDay: Int = 0

    
    public init(){
        let now = Date()
        let dateFormatter = DateFormatter()
        let calender = Calendar.current
        self.numDay = calender.component(.day, from: now)
        self.userDay = String(calender.component(.day, from: now))
        let month = calender.component(.month, from: now)
        self.userMonth = String(DateFormatter().monthSymbols[month - 1])
        self.userYear = String(calender.component(.year, from:now))
        self.combinedDate = "\(userMonth) \(userDay) \(userYear)"
        dateFormatter.dateFormat = "hh:mm a"
        self.combinedHour = String(dateFormatter.string(from: now))
        self.hourAndDate = "\(combinedDate), \(combinedHour)"
    }
}
