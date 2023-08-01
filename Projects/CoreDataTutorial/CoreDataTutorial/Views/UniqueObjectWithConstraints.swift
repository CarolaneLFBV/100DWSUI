//
//  UniqueObjectWithConstraints.swift
//  CoreDataTutorial
//
//  Created by Carolane LEFEBVRE on 01/08/2023.
//

import SwiftUI

struct UniqueObjectWithConstraints: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct UniqueObjectWithConstraints_Previews: PreviewProvider {
    static var previews: some View {
        UniqueObjectWithConstraints()
    }
}
