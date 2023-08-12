//
//  FileManager-DocumentsDirectory.swift
//  MilestoneSeventySeven
//
//  Created by Carolane LEFEBVRE on 12/08/2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        // find all possible docs directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // send back the first one
        return paths[0]
    }
}
