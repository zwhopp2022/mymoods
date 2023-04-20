//
//  Streaks.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 4/19/23.
//

import Foundation

public func streaks() -> String{
   // let _: String = moodDB.retrieveReasons(moodTable: "everything").last?.timeDate ?? "<no date>"
    let listOfDate = moodDB.retrieveReasons(moodTable: "everything")
    var lastTwo = listOfDate.suffix(2)
    var date = lastTwo.first
    var secondToLastDate = date?.timeDate
    return secondToLastDate ?? "<no date>"
}

