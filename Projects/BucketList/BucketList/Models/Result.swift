//
//  File.swift
//  BucketList
//
//  Created by Carolane LEFEBVRE on 10/08/2023.
//

import SwiftUI

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    // terms dictionary might not be there, and if it's there it might not have a description key,
    // and if it has a descrition key it might be an emmpty array rather than an array with some text
    var description: String {
        terms?["description"]?.first ?? "No futher information"
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}


