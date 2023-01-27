//
//  RatingView.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 27/01/2023.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label: String = ""
    var maximumRating: Int = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var onColor = Color.orange
    var offColor = Color.gray
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
