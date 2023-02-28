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
        
        return db
    }
}
