//
//  ReviewRatingScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct ReviewRatingScreen: View {
    // Demo data
    @State private var rating: Int = 3
    @State private var reviewText: String = ""
    
    let itemName = "Blue Party Dress" // Example item name
    
    var body: some View {
        VStack {
            // Title Section
            Text("Review & Rate \(itemName)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Theme.thirdColor)
                .padding(.top, 40)
            
            // Rating Section
            RatingView(rating: $rating)
                .padding(.top, 40)
            
            // Review Text Section
            TextEditor(text: $reviewText)
                .frame(height: 150)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Theme.thirdColor, lineWidth: 1))
                .foregroundColor(Theme.thirdColor)
                .padding(.top, 20)
                .padding(.horizontal)
            
            // Submit Button
            Button(action: {
                // Action to submit the review
                print("Review submitted: \(reviewText), Rating: \(rating)")
            }) {
                Text("Submit Review")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Theme.thirdColor)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .background(Theme.mainBackground)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct RatingView: View {
    @Binding var rating: Int
    
    let maxRating = 5
    
    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1, id: \.self) { index in
                Image(systemName: index <= self.rating ? "star.fill" : "star")
                    .foregroundColor(index <= self.rating ? Theme.thirdColor : Theme.secondaryColor)
                    .onTapGesture {
                        self.rating = index
                    }
                    .font(.system(size: 40))
            }
        }
        .padding(.horizontal)
    }
}

struct ReviewRatingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReviewRatingScreen()
    }
}
