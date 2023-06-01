//
//  Notifications.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 5/31/23.
//

import Foundation

import UserNotifications

public class NotificationHandler {
    
    var level: Level
    
    init(initLevel: Level) {
        self.level = initLevel
    }
    
    func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.sendNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.sendNotification()
                    }
                }
            default:
                return
            }
        }
        
    }
    
    func sendNotification() {
        let uuidString = UUID().uuidString
        
        var bodyChoice: [String] = []
        bodyChoice.append("Feel free to come back anytime and write how you're feeling!")
        bodyChoice.append("Smile or Cry, don't let those feelings pass by!")
        bodyChoice.append("You're level \(self.level.getCurrentLevel()), keep at it and see yourself increase!")
        
        
        let title = "MyMoods"
        let body = bodyChoice.randomElement()
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body!
        content.sound = .default
        
        let date = Date().addingTimeInterval(10)
        let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        notificationCenter.add(request)
        
        
    }
}
