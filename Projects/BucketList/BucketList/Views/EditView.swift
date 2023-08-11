//
//  EditView.swift
//  BucketList
//
//  Created by Carolane LEFEBVRE on 10/08/2023.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    
    // Asks for a function that accepts a single location and returns notion.
    var onSave: (Location) -> Void
    
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby…") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading…")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save", action: save)
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        _viewModel = StateObject(wrappedValue: ViewModel(location: location))
        self.onSave = onSave
    }
    
    func save(){
        var newLocation = viewModel.location
        newLocation.id = UUID()
        newLocation.name = viewModel.name
        newLocation.description = viewModel.description
        
        onSave(newLocation)
        dismiss()
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) { _ in }
    }
}
