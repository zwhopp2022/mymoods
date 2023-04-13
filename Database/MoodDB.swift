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
    public var happiest: Table!
    public var saddest: Table!
    public var sad: Table!
    public var neutral: Table!
    public var angriest: Table!
    public var happy: Table!
    public var experience: Table!
    var everything: Table!
    var mood: Expression<String>!
    var reason: Expression<String>!
    var totalXP: Expression<Int>!
    
    
    init () {
        do {
            // create database in user's documents directory
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            moodDB = try! Connection("\(path)/moodDB.sqlite3")
            
            // create column names and their associated attribute type
            mood = Expression<String>("mood")
            reason = Expression<String>("reason")
            totalXP = Expression<Int>("totalXP")
            
            
            // create 6 mood tables and one everything table and experience table
            
            happiest = Table("happiest")
            saddest = Table("saddest")
            sad = Table("sad")
            neutral = Table("neutral")
            angriest = Table("angriest")
            happy = Table("happy")
            everything = Table("everything")
            experience = Table("experience")
            
            if (!UserDefaults.standard.bool(forKey: "databaseCreated")) {
                
                try moodDB.run(experience.create { t in
                    t.column(totalXP)
                })
                
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
    
//    public func everythingInput(moodValue: String, inputValue: String){
//            do {
//                try self.moodDB.run(everything.insert(mood <- moodValue, reason <- inputValue))
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
    
    public func addInput(moodValue: String, inputValue: String, moodTable: Table!, date: String, hour: String, minute: String){
            do {
                try self.moodDB.run(moodTable.insert(mood <- moodValue, reason <- inputValue))
                try self.moodDB.run(self.everything.insert(mood <- moodValue, reason <- inputValue))
                userLevel.addExperience()
            } catch {
                print(error.localizedDescription)
            }
        }
    public func retrieveReasons(moodTable: String) -> [FeelingInput]{
            var feelingInputs: [FeelingInput] = []
            do {
                if moodTable == "everything" {
                    for inputs in try moodDB.prepare(everything) {
                        // create feeling input object
                        var feelingInput: FeelingInput = FeelingInput(initreason: inputs[reason], initmood: inputs[mood])
                        // if in the everything table, add the mood to accurately show the user what mood they had
                        // if not in the everything table, retrieving the mood is not necessary
                        // regardless of the table, retrieve the reason
                        feelingInputs.append(feelingInput)
                    }
                }
                else if moodTable == "happy" {
                    for inputs in try moodDB.prepare(happy) {
                        // create feeling input object
                        var feelingInput: FeelingInput = FeelingInput(initreason: inputs[reason], initmood: "")
                        // if not in the everything table, retrieving the mood is not necessary
                        // retrieve the reason
                        feelingInputs.append(feelingInput)
                    }

                }
                else if moodTable == "happiest" {
                    for inputs in try moodDB.prepare(happiest) {
                        // create feeling input object
                        var feelingInput: FeelingInput = FeelingInput(initreason: inputs[reason], initmood: "")                        // if not in the everything table, retrieving the mood is not necessary
                        // retrieve the reason
                        feelingInputs.append(feelingInput)
                    }

                }
                else if moodTable == "neutral" {
                    for inputs in try moodDB.prepare(neutral) {
                        // create feeling input object
                        var feelingInput: FeelingInput = FeelingInput(initreason: inputs[reason], initmood: "")                             // if not in the everything table, retrieving the mood is not necessary
                        // retrieve the reason
                        feelingInputs.append(feelingInput)
                    }

                }
                else if moodTable == "sad" {
                    for inputs in try moodDB.prepare(sad) {
                        // create feeling input object
                        var feelingInput: FeelingInput = FeelingInput(initreason: inputs[reason], initmood: "")                             // if not in the everything table, retrieving the mood is not necessary
                        // retrieve the reason
                        feelingInputs.append(feelingInput)
                    }

                }
                else if moodTable == "saddest" {
                    for inputs in try moodDB.prepare(saddest) {
                        // create feeling input object
                        var feelingInput: FeelingInput = FeelingInput(initreason: inputs[reason], initmood: "")                             // if not in the everything table, retrieving the mood is not necessary
                        // retrieve the reason
                        feelingInputs.append(feelingInput)
                    }

                }
                else if moodTable == "angriest" {
                    for inputs in try moodDB.prepare(angriest) {
                        // create feeling input object
                        var feelingInput: FeelingInput = FeelingInput(initreason: inputs[reason], initmood: "")                             // if not in the everything table, retrieving the mood is not necessary
                        // retrieve the reason
                        feelingInputs.append(feelingInput)
                    }

                }





            }
            catch{
                print(error.localizedDescription)
            }
            
            // return the array of feelingsInputs
            return feelingInputs
        }
    
    public func displayMoodTableData(moodTable: Table!) {
        do {
            for inputs in try moodDB.prepare(moodTable) {
                let moodValue = inputs[mood]
                let reasonValue = inputs[reason]
                print("\(moodValue): \(reasonValue)")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func addExperienceForInput(newXpLevel: Int) {
        do {
            try self.moodDB.run(experience.update(totalXP <- newXpLevel))
        } catch {
            print(error.localizedDescription)
        }
    }

}





