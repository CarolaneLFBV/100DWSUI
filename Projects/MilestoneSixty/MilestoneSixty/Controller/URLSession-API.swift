//
//  URLSessionJSON.swift
//  MilestoneSixty
//
//  Created by Carolane LEFEBVRE on 02/08/2023.
//

import Foundation

class URLSessionAPI : ObservableObject {
    @Published var users = [User]()
    
    func loadData(completion:@escaping ([User]) -> ()) {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("URL invalide.")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let users = try! JSONDecoder().decode([User].self, from: data!)
            DispatchQueue.main.async {
                completion(users)
            }
        }.resume()
        
    }
}
