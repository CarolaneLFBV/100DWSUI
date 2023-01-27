//
//  StringExtension.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 27/01/2023.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
