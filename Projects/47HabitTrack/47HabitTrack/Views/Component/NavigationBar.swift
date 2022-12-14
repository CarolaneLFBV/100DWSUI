//
//  NavigationBar.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 22/12/2022.
//

import SwiftUI

struct NavigationBar: View {
    @State private var selectedIndex = 0
    
    let icons = [
        "house",
        "plus",
        "list.bullet.rectangle"
    ]
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                switch selectedIndex {
                    case 0:
                        HomeView(activities: Activity.allActivities)

                    case 1:
                        ContentView()

                    default:
                        HomeView(activities: Activity.allActivities)

                        
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<3, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        self.selectedIndex = number
                    }, label: {
                        if number == 1 {
                            Image(systemName: icons[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color("EtonBlue"))
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 10)
                            
                        } else {
                            Image(systemName: icons[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(selectedIndex == number ? Color("EtonBlue") : Color(UIColor.lightGray))
                        }
                    })
                    Spacer()
                }
            }
            .padding(.top)
            .background(Color("MidnightGreen"))
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
