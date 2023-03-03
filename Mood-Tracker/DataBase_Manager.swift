//
//  DataBase_Manager.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 3/3/23.
//

import Foundation

import SQLite3

class DataBase_Manager {
    
    private var db: Connection!
    
    private var table: Table!
    
    private var mood: Expression<String>!
}
