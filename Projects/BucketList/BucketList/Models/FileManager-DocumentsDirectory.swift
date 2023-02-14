//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Carolane LEFEBVRE on 14/02/2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
