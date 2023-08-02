//
//  DynamicallyFilteringFR.swift
//  CoreDataTutorial
//
//  Created by Carolane LEFEBVRE on 01/08/2023.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    // Store the FR so that we can loop over it inside the body
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    // Content closure; it's called once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    // Will inherint the moc context from the first view
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

struct DynamicallyFilteringFR: View {
    @Environment(\.managedObjectContext) var moc
    @State private var nameFilter = "A"
    @State private var filterParamSelected = "lastName"
    @State private var filterParam = ["lastName", "firstName"]
    
    var body: some View {
        VStack {
            Picker("Choose your filter", selection: $filterParamSelected) {
                ForEach(filterParam, id: \.self) { param in
                    Text("\(param)")
                }
            }
            FilteredList(filterKey: filterParam, filterValue: nameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                nameFilter = "A"
            }
            
            Button("Show S") {
                nameFilter = "S"
            }
        }
    }
}

struct DynamicallyFilteringFR_Previews: PreviewProvider {
    static var previews: some View {
        DynamicallyFilteringFR()
    }
}
