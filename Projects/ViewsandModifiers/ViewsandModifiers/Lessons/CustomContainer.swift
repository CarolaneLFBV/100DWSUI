//
//  CustomContainer.swift
//  ViewsandModifiers
//
//  Created by Carolane LEFEBVRE on 23/11/2022.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct CustomContainer: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
                    .frame(width: 50, height: 25)
                    .background(.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

struct CustomContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainer()
    }
}
