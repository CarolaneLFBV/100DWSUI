//
//  ActivityCard.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 20/12/2022.
//

import SwiftUI

struct ActivityCard: View {
    @State var activity: Activity
    
    var body: some View {
        VStack {
            HStack {
                Text(activity.name)
                    .titleStyle()
                
                Spacer()
                    .frame(height: 40)
                
                Image(systemName: activity.isDone ? "checkmark.square.fill" : "square")
                    .font(.system(size: 25))
                    .foregroundColor(activity.isDone ? Color("EtonBlue") : Color("EtonBlue"))
                    .onTapGesture {
                        self.activity.isDone.toggle()
                        UserDefaults.standard.set(activity.isDone, forKey: "\(activity.name)isDone")
                    }
            }
            
            HStack {
                Text(activity.description)
                    .captionStyle()
                Spacer()
            }

            HStack {
                HStack {
                    Text(activity.category.name)

                    activity.category.image?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .cardTag()
                
                Spacer()
            }
            
        }
        .cardbackground()
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard(activity : Activity.allActivities[0])
    }
}
