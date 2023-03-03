//
//  DataBase_Manager.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 3/3/23.
//

import Foundation

import SQLite

class DataBase_Manager {
    private let moodDBInstance: MoodTrackerDB = MoodTrackerDB()
    let moodDB: OpaquePointer?
    init () {
        self.moodDB = moodDBInstance.createAndOpenDatabase()
    }
    
    
    
}
