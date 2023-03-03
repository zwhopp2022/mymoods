//
//  UserDefaultsChecker.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 3/2/23.
//

import Foundation

class UserDefaultsChecker {
    private static let databaseCreatedVal = "databaseCreated"
    
    static func setDatabaseCreatedVal() {
        UserDefaults.standard.bool(forKey: databaseCreatedVal)
    }
    
    static func databaseCreated() -> Bool {
        return UserDefaults.standard.bool(forKey: databaseCreatedVal)
    }
    
}
