//
//  AnotherView.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 16/08/2023.
//

import SwiftUI

struct AnotherView: View {
    @StateObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct AnotherView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherView()
    }
}
