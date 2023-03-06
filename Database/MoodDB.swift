//
//  MoodDB.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 3/5/23.
//

import SQLite
// create database in documents directory

class MoodDatabase {
    
    // initialize variables needed for an instance of MoodDatabase
    var moodDB: Connection!
    var happiest: Table!
    public var saddest: Table!
    var sad: Table!
    var neutral: Table!
    var angriest: Table!
    var happy: Table!
    var everything: Table!
    var mood: Expression<String>!
    var reason: Expression<String>!
    
    
    init () {
        do {
            // create database in user's documents directory
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            moodDB = try! Connection("\(path)/moodDB.sqlite3")
            
            // create column names and their associated attribute type
            mood = Expression<String>("mood")
            reason = Expression<String>("reason")
            
            
            // create 6 mood tables and one everything table
            happiest = Table("happiest")
            saddest = Table("saddest")
            sad = Table("sad")
            neutral = Table("neutral")
            angriest = Table("angriest")
            happy = Table("happy")
            everything = Table("everything")
            if (!UserDefaults.standard.bool(forKey: "databaseCreated")) {
                try moodDB.run(happiest.create { t in
                    t.column(mood)
                    t.column(reason)
                })
                
                try moodDB.run(saddest.create { t in
                    t.column(mood)
                    t.column(reason)
                })
                
                try moodDB.run(sad.create { t in
                    t.column(mood)
                    t.column(reason)
                })
                
                try moodDB.run(neutral.create { t in
                    t.column(mood)
                    t.column(reason)
                })
                
                try moodDB.run(angriest.create { t in
                    t.column(mood)
                    t.column(reason)
                })
                
                try moodDB.run(happy.create { t in
                    t.column(mood)
                    t.column(reason)
                })
                
                try moodDB.run(everything.create { t in
                    t.column(mood)
                    t.column(reason)
                })
                UserDefaults.standard.set(true, forKey: "databaseCreated")
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    public func everythingInput(moodValue: String, inputValue: String){
            do {
                try self.moodDB.run(everything.insert(mood <- moodValue, reason <- inputValue))
            } catch {
                print(error.localizedDescription)
            }
        }
    
    public func addInput(moodValue: String, inputValue: String, moodTable: Table!){
            do {
                try self.moodDB.run(moodTable.insert(mood <- moodValue, reason <- inputValue))
            } catch {
                print(error.localizedDescription)
            }
        }
}





