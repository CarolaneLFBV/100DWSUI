//
//  AddActivityView.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 15/01/2023.
//

import SwiftUI

struct AddActivityView: View {
    @State var name: String = ""
    @State var category: Category
    @State var description: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Activity name", text: $name)
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(category: Category.allCategories[0])
    }
}
