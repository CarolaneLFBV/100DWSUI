//
//  ShowHideView.swift
//  iExpense
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Hello \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ShowHideView: View {
    @State private var isShowing: Bool = false
    var body: some View {
        Button("Show second view") {
            isShowing.toggle()
        }
        .sheet(isPresented: $isShowing) {
            SecondView(name: "Carolane")
        }
    }
}

struct ShowHideView_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideView()
    }
}
