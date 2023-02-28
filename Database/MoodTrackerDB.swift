//
//  MoodTrackerDB.swift
//  Mood-Tracker
//
//  Created by Rudra Pratap Singh on 2/27/23.
//

import UIKit
import SQLite3

//Varaible to store the location of the DB.
var dbURL = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String


class MoodTrackerDB: UIResponder, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    func createAndOpenDatabase() -> OpaquePointer?
    {
        var db: OpaquePointer?
        
        let url = NSURL(fileURLWithPath: dbURL) // sets the url to the db
        
        if let pathComponent = url.appendingPathComponent("MoodTracker.sqlite") //DB name
        {
            let filePath = pathComponent.path
            
            if sqlite3_open(filePath, &db) == SQLITE_OK
            {
                print("Successfully opened the database :) at \(filePath)")
                
                return db
            }
            else
            {
                print("Could not open the database")
            }
        }
        else
        {
            print("File path is not available.")
        }
        
        let createTableString = """
        CREATE TABLE Mood(Date TEXT, Mood TEXT, Reason TEXT)
        """
        
        func createTable() {
            var createTableStatement: OpaquePointer?
            
            if sqlite3_prepare(db, createTableString, -1, &createTableStatement, nil) ==
                SQLITE_OK {
                if sqlite3_step(createTableStatement) == SQLITE_DONE {
                    print("\nMood table created.")
                } else{
                    print("\nMood table is not created")
                }
            } else{
                print("\nCREATE TABLE statement is not prepared.")
            }
            sqlite3_finalize(createTableStatement)
        }
        
        if sqlite3_open("MoodTrackerDB", &db) == SQLITE_OK {
            print("Successfully opened connection to database.")
        } else {
            print("Unable to open database.")
        }
        
        let createTable1 = """
            CREATE TABLE IF NOT EXISTS Saddest (
                Date TEXT,
                Mood Text,
                Reason Text
            );
        """
        
        
        let createTable2 = """
            CREATE TABLE IF NOT EXISTS Sad (
                Date TEXT,
                Mood Text,
                Reason Text
            );
        """
        
        let createTable3 = """
            CREATE TABLE IF NOT EXISTS Neutral (
                Date TEXT,
                Mood Text,
                Reason Text
            );
        """
        
        let createTable4 = """
            CREATE TABLE IF NOT EXISTS Happy (
                Date TEXT,
                Mood Text,
                Reason Text
            );
        """
        
        let createTable5 = """
            CREATE TABLE IF NOT EXISTS Happiest (
                Date TEXT,
                Mood Text,
                Reason Text
            );
        """
        
        let createTable6 = """
            CREATE TABLE IF NOT EXISTS Angriest (
                Date TEXT,
                Mood Text,
                Reason Text
            );
        """
        
        let createTable7 = """
            CREATE TABLE IF NOT EXISTS ALLMOODS (
                Date TEXT,
                Mood Text,
                Reason Text
            );
        """
        
        var errorMessage: UnsafeMutablePointer<Int8>?
        if sqlite3_exec(db, createTable1, nil, nil, &errorMessage) == SQLITE_OK {
            print("Table 1 created successfully")
        } else {
            print("Error creating Table1: String(cString: errorMessage)")
            sqlite3_free(errorMessage)
        }
        
        if sqlite3_exec(db, createTable2, nil, nil, &errorMessage) == SQLITE_OK {
            print("Table 2 created successfully")
        } else {
            print("Error creating Table2: String(cString: errorMessage)")
            sqlite3_free(errorMessage)
        }
        
        if sqlite3_exec(db, createTable3, nil, nil, &errorMessage) == SQLITE_OK {
            print("Table 3 created successfully")
        } else {
            print("Error creating Table3: String(cString: errorMessage)")
            sqlite3_free(errorMessage)
        }
        
        if sqlite3_exec(db, createTable4, nil, nil, &errorMessage) == SQLITE_OK {
            print("Table 4 created successfully")
        } else {
            print("Error creating Table4: String(cString: errorMessage)")
            sqlite3_free(errorMessage)
        }
        
        if sqlite3_exec(db, createTable5, nil, nil, &errorMessage) == SQLITE_OK {
            print("Table 5 created successfully")
        } else {
            print("Error creating Table5: String(cString: errorMessage)")
            sqlite3_free(errorMessage)
        }
        
        if sqlite3_exec(db, createTable6, nil, nil, &errorMessage) == SQLITE_OK {
            print("Table 6 created successfully")
        } else {
            print("Error creating Table6: String(cString: errorMessage)")
            sqlite3_free(errorMessage)
        }
        
        if sqlite3_exec(db, createTable7, nil, nil, &errorMessage) == SQLITE_OK {
            print("Table 7 created successfully")
        } else {
            print("Error creating Table7: String(cString: errorMessage)")
            sqlite3_free(errorMessage)
        }
        
        if sqlite3_close(db) == SQLITE_OK {
            print("Successfully closed connection to database")
        } else {
            print("Unable to close database")
        }
        
        return db
        
    }
}
