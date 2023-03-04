    //
    //  CustomSwipActionListLesson.swift
    //  HotProspects
    //
    //  Created by Carolane LEFEBVRE on 04/03/2023.
    //

import SwiftUI

struct CustomSwipActionListLesson: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Hi")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                    
                    //Add btn here to get more btns
                }
                // Swipe on the other side
                .swipeActions(edge: .leading) {
                    Button {
                        print("Hi")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct CustomSwipActionListLesson_Previews: PreviewProvider {
    static var previews: some View {
        CustomSwipActionListLesson()
    }
}
