//
//  SchedulingLocalNotifLesson.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import SwiftUI
import UserNotifications

struct SchedulingLocalNotifLesson: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Schedule Notification") {
                // content = what should be shown (title, subtitle, sound, img, etc)
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                // trigger = determines when the notif should be shown (nb of secs, from now, etc.)
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // requet = content + trigger and add UUID
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // add notif request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct SchedulingLocalNotifLesson_Previews: PreviewProvider {
    static var previews: some View {
        SchedulingLocalNotifLesson()
    }
}
