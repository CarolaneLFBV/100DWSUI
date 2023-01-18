//
//  URLSessionDetails.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 15/01/2023.
//

import Foundation

/*
 * Stores array of results
 */
struct Response: Codable {
    var results: [Result]
}


/*
 * Stores infos abt a music
 */
struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
