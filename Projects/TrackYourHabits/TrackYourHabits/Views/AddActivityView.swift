    //
    //  AddActivityView.swift
    //  TrackYourHabits
    //
    //  Created by Carolane LEFEBVRE on 31/01/2023.
    //

import SwiftUI

struct AddActivityView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @FetchRequest(entity: CachedCategory.entity(), sortDescriptors: []) var cachedCategory: FetchedResults<CachedActivity>
    @State private var name: String = ""
    @State private var aboutActivity: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Activity Information") {
                    TextField("Activity's Name", text: $name)
                }
                
                Section("Write a description") {
                    TextEditor(text: $aboutActivity)
                }
                
                /*Picker("Category", selection: $cachedCategory) {
                    ForEach(cachedCategory, id: \.self) { category in
                        Text("\(category.wrappedName)")
                    }
                }*/
                
                
                Section {
                    Button("Save") {
                        let newActivity = CachedActivity(context: moc)
                        newActivity.id = UUID()
                        newActivity.name = name
                        newActivity.aboutActivity = aboutActivity
                        
                        try? moc.save()
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
            .navigationTitle("New Activity")
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}
