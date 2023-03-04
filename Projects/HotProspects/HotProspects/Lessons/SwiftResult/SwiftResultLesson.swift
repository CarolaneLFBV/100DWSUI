    //
    //  SwiftResultLesson.swift
    //  HotProspects
    //
    //  Created by Carolane LEFEBVRE on 04/03/2023.
    //

import SwiftUI

struct SwiftResultLesson: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev.readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        /*do {
            let url = URL(string: "https://hws.dev.readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            output = "Found \(readings.count) readings"
        } catch {
            print("Download error")
        }*/
    }
}

struct SwiftResultLesson_Previews: PreviewProvider {
    static var previews: some View {
        SwiftResultLesson()
    }
}
