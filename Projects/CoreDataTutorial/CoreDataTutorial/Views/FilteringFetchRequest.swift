//
//  FilteringFetchRequest.swift
//  CoreDataTutorial
//
//  Created by Carolane LEFEBVRE on 01/08/2023.
//

import SwiftUI
import CoreData

struct FilteringFetchRequest: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe === %@", "Star Wars")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Eaxmples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
    }
}

struct FilteringFetchRequest_Previews: PreviewProvider {
    static var previews: some View {
        FilteringFetchRequest()
    }
}
