//
//  ResultView.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 16/08/2023.
//

import SwiftUI

struct ResultView: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReading()
            }
    }
    
    func fetchReading() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        do {
            output = try result.get()
        } catch {
            output = "Error: \(error.localizedDescription)"
        }
        
        // OR
        
        /*
             switch result {
                case .success(let str):
                    output = str
                case .failure(let error):
                    output = "Error: \(error.localizedDescription)"
             }
         */
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
