//
//  BundleDecorator.swift
//  Moonshot
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

// Will convert astronauts.json into a dictionary of Astronaut instances

extension Bundle {

    func decode<T: Codable>(_ file: String) -> T {
        // Find the path to the file
//        guard let url = self.url(forResource: file, withExtension: nil) else{
//            fatalError("Failed to locate \(file) in bundle.")
//        }
        
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // Load that into an instance of Data
        // Data(contentsOf:) is used because AstronautsData are Codable.
        guard let data = try? Data(contentsOf: paths[0]) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // Pass it through a JSONDecoder
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
    
    
}
