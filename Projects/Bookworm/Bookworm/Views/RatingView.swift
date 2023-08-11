//
//  RatingView.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 31/07/2023.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    
    // Images
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    // Colors
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor: onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
        .accessibilityElement()
        .accessibilityLabel(label)
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < maximumRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }
    }
    
    /// Function that returns an image depending on the number greater, equal or less than the current rating
    /// - Parameter number: used to compare the current rating
    /// - Returns: an image (star)
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
