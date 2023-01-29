//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Carolane LEFEBVRE on 28/01/2023.
//

import SwiftUI
import CoreData


struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var results: FetchedResults<T> { fetchRequest.wrappedValue }

    let content: (T) -> Content

    var body: some View {
        List(results, id: \.self) { result in
            self.content(result)
        }
    }
    
    enum FilterType: String {
        case beginsWith = "BEGINSWITH"
        case beginsWithCaseInsensitive = "BEGINSWITH[c]"
        case contains = "CONTAINS"
        case containsCaseInsensitive = "CONTAINS[c]"
        case endsWith = "ENDSWITH"
        case endsWithCaseInsensitive = "ENDSWITH[c]"
    }

    init(filterKey: String,
         filterType: FilterType,
         filterValue: String,
         sortDescriptors: [NSSortDescriptor] = [],
         @ViewBuilder content: @escaping (T) -> Content) {

        fetchRequest = FetchRequest<T>(entity: T.entity(),
                                       sortDescriptors: sortDescriptors,
                                       predicate: NSPredicate(format: "%K \(filterType.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
