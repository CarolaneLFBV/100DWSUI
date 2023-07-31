//
//  EmojiRating.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 31/07/2023.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            Text("🤮")
        case 2:
            Text("🤒")
        case 3:
            Text("🧐")
        case 4:
            Text("🙂")
        case 5:
            Text("🤩")
        default:
            Text("🤩")
        }
    }
}

struct EmojiRating_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
