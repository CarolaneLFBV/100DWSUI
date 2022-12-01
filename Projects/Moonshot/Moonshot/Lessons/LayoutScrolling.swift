//
//  LayoutScrolling.swift
//  Moonshot
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct LayoutScrolling: View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    let layoutHGRid = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        /*ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }*/
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layoutHGRid) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct LayoutScrolling_Previews: PreviewProvider {
    static var previews: some View {
        LayoutScrolling()
    }
}
