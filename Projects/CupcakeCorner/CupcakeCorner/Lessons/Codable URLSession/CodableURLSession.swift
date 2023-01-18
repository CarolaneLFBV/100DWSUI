//
//  CodableURLSession.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 15/01/2023.
//

import SwiftUI

struct CodableURLSession: View {
    @State private var results = [Result]()
    
    /*
     * 1. Creating URL
     * 2. Fetching data
     * 3. Decoding result into Response struct
     */
    func loadData() async {
        // 1.
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        // 2. data.from - Takes URL and returns Data object. Return tuple with data of URL
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // 3.
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
        
    }
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
}

struct CodableURLSession_Previews: PreviewProvider {
    static var previews: some View {
        CodableURLSession()
    }
}
