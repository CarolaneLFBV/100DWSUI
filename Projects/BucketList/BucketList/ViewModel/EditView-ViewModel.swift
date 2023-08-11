//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Carolane LEFEBVRE on 11/08/2023.
//

import SwiftUI

extension EditView {
    @MainActor class ViewModel: ObservableObject {
        enum LoadingState {
            case loading, loaded, failed
        }
        
        var location: Location
        @Published var name: String
        @Published var description: String
        
        @Published var loadingState = LoadingState.loading
        @Published var pages = [Page]()
        
        init(location: Location) {
            name = location.name
            description = location.description
            self.location = location
        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                // got some data back
                let items = try JSONDecoder().decode(Result.self, from: data)
                
                // success - convert the array values to pages array
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                // load failed
                loadingState = .failed
            }
        }
    }
}
