//
//  GroupsLayoutContainers.swift
//  SnowSeeker
//
//  Created by Carolane Lefebvre on 01/09/2023.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct GroupsLayoutContainers: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            VStack {
                UserView()
            }
        } else {
            HStack {
                UserView()
            }
        }
    }
}


struct GroupsLayoutContainers_Previews: PreviewProvider {
    static var previews: some View {
        GroupsLayoutContainers()
    }
}
