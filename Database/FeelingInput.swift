//
//  FeelingInput.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 3/5/23.
//

import Foundation

class FeelingInput: Identifiable {
    var reason: String = ""
    var mood: String = ""
    
    public init (initreason: String, initmood: String){
        self.reason = initreason
        self.mood = initmood
    }
}
