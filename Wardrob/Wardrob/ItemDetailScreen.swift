//
//  ItemDetailScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//
import SwiftUI

struct ItemDetailScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Carousel View for Images
                TabView {
                    ForEach(1..<4) { index in
                        Image("item_image_\(index)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            .shadow(radius: 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.purple, lineWidth: 3)
                            )
                    }
                }
                .frame(height: 320)
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                // Item Title with vibrant colors and shadows
                Text("Stylish Summer Dress")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                // Item Description with playful background
                Text("This stylish summer dress is perfect for any occasion. Made from lightweight, breathable fabric, it ensures comfort while keeping you in style.")
                    .font(.body)
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.purple.opacity(0.1))
                            .padding(.horizontal, -20)
                    )
                    .cornerRadius(10)
                
                // Specifications
                VStack(alignment: .leading, spacing: 5) {
                    Text("Specifications")
                        .font(.headline)
                        .foregroundColor(.purple)
                        .padding(.top, 10)
                    
                    Text("• Material: 100% Cotton")
                    Text("• Available Sizes: S, M, L, XL")
                    Text("• Colors: Red, Blue, Green")
                }
                .padding(.horizontal)
                
                // Size Guide with unique background
                VStack(alignment: .leading, spacing: 5) {
                    Text("Size Guide")
                        .font(.headline)
                        .foregroundColor(.purple)
                        .padding(.top, 10)
                    
                    Text("S: Bust 34\", Waist 26\", Length 36\"")
                    Text("M: Bust 36\", Waist 28\", Length 37\"")
                    Text("L: Bust 38\", Waist 30\", Length 38\"")
                    Text("XL: Bust 40\", Waist 32\", Length 39\"")
                }
                .padding(.horizontal)
                
                // Customer Reviews
                VStack(alignment: .leading, spacing: 5) {
                    Text("Customer Reviews")
                        .font(.headline)
                        .foregroundColor(.purple)
                        .padding(.top, 10)
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.leadinghalf.filled")
                    }
                    .foregroundColor(.yellow)
                    
                    Text("\"I love this dress! It's comfortable and looks great.\" - Jane D.")
                        .italic()
                        .foregroundColor(.purple)
                }
                .padding(.horizontal)
                
                // Shipping Information with creative icons
                VStack(alignment: .leading, spacing: 5) {
                    Text("Shipping Information")
                        .font(.headline)
                        .foregroundColor(.purple)
                        .padding(.top, 10)
                    
                    HStack {
                        Image(systemName: "truck.fill")
                        Text("• Standard Shipping: 5-7 business days")
                    }
                    HStack {
                        Image(systemName: "airplane")
                        Text("• Express Shipping: 2-3 business days")
                    }
                    HStack {
                        Image(systemName: "arrow.uturn.left.circle.fill")
                        Text("• Free returns within 30 days")
                    }
                }
                .padding(.horizontal)
                
                // Buttons with gradient background and more style
                HStack(spacing: 20) {
                    Button(action: {
                        // Buy Now action
                    }) {
                        Text("Buy Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    }
                    
                    Button(action: {
                        // Add to Cart action
                    }) {
                        Text("Add to Cart")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    }
                }
                .padding(.top, 20)
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
            .padding()
        }
        .background(Color.purple.opacity(0.05))
        .cornerRadius(25)
    }
}


#Preview {
    ItemDetailScreen()
}
