//
//  Resort.swift
//  SnowSeeker
//
//  Created by Carolane Lefebvre on 01/09/2023.
//

import Foundation

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    // Requires typecasting because the decode() extension method needs to know what type of data it's decoding
    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
}
