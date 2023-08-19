//
//  MainView.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 16/08/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
