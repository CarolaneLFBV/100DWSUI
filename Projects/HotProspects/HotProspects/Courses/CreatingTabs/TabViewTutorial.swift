//
//  TabViewTutorial.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 16/08/2023.
//

import SwiftUI

struct TabViewTutorial: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            
            Text("2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

struct TabViewTutorial_Previews: PreviewProvider {
    static var previews: some View {
        TabViewTutorial()
    }
}
