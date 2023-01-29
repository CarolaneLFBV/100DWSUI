//
//  BookExtension.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 27/01/2023.
//

import SwiftUI

extension Book  {
    // Rating
    func isWorstRating() -> Bool {
        if self.rating == 1 { return true }
        return false
    }
}
