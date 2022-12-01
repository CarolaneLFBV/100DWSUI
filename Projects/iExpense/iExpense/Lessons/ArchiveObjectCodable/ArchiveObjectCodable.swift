//
//  ArchiveObjectCodable.swift
//  iExpense
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct ArchiveObjectCodable: View {
    @State private var user = User()
    var body: some View {
        Button("Save User") {
            //let encoder = JSONEncoder()

            /*if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }*/
        }
    }
}

struct ArchiveObjectCodable_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveObjectCodable()
    }
}
