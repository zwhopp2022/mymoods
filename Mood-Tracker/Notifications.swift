//
//  Notifications.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 5/31/23.
//

import Foundation

import UserNotifications

public class NotificationHandler {
    
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
        let title = "Happy to see you here!"
        let body = "Feel free to write down anything you're feeling!"
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let date = Date().addingTimeInterval(10)
        let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        notificationCenter.add(request)
        
        
    }
}
