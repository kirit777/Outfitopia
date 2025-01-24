//
//  ProductDetailScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct ProductDetailScreen: View {
    // Demo Data
    let product = (
        title: "Stylish Summer Dress",
        images: ["item_image_1", "item_image_2", "item_image_3"],
        price: "$20/day",
        sizeOptions: ["S", "M", "L", "XL"],
        colorOptions: ["Red", "Blue", "Green"],
        description: "This stylish summer dress is perfect for any occasion. Made from lightweight, breathable fabric, it ensures comfort while keeping you in style.",
        reviews: [
            ("Jane D.", 5, "I love this dress! It's comfortable and looks great."),
            ("John S.", 4, "Great dress, but the fit is a bit tight."),
            ("Emily A.", 5, "Perfect for summer, highly recommend!")
        ]
    )
    
    @State private var selectedSize = "M"
    @State private var selectedColor = "Red"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Clothing Image Carousel (Zoom functionality)
                TabView {
                    ForEach(product.images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(20)
                            .padding()
                            
                    }
                }
                .frame(height: 350)
                .tabViewStyle(PageTabViewStyle())
                
                // Product Title
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Theme.thirdColor)
                    .padding([.horizontal, .top])
                
                // Rent Price
                Text(product.price)
                    .font(.headline)
                    .foregroundColor(Theme.secondaryColor)
                    .padding([.horizontal])
                
                // Size Options
                VStack(alignment: .leading) {
                    Text("Size")
                        .font(.headline)
                        .foregroundColor(Theme.thirdColor)
                        .padding(.top, 20)
                    
                    HStack {
                        ForEach(product.sizeOptions, id: \.self) { size in
                            Button(action: {
                                selectedSize = size
                            }) {
                                Text(size)
                                    .fontWeight(.bold)
                                    .padding()
                                    .foregroundColor(selectedSize == size ? .white : Theme.thirdColor)
                                    .background(selectedSize == size ? Theme.thirdColor : Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .padding(5)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                // Color Options (if applicable)
                if !product.colorOptions.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Color")
                            .font(.headline)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.top, 20)
                        
                        HStack {
                            ForEach(product.colorOptions, id: \.self) { color in
                                Button(action: {
                                    selectedColor = color
                                }) {
                                    Text(color)
                                        .fontWeight(.bold)
                                        .padding()
                                        .foregroundColor(selectedColor == color ? .white : Theme.thirdColor)
                                        .background(selectedColor == color ? Theme.thirdColor : Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .padding(5)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Detailed Description
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(Theme.thirdColor)
                        .padding(.top, 20)
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(Theme.thirdColor)
                        .padding(.horizontal)
                }
                
                // User Reviews & Ratings
                VStack(alignment: .leading) {
                    Text("User Reviews")
                        .font(.headline)
                        .foregroundColor(Theme.thirdColor)
                        .padding(.top, 20)
                    
                    ForEach(product.reviews, id: \.0) { review in
                        HStack {
                            HStack {
                                ForEach(0..<5) { index in
                                    Image(systemName: index < review.1 ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                }
                            }
                            Text("- \(review.0)")
                                .italic()
                                .foregroundColor(Theme.thirdColor)
                        }
                        Text(review.2)
                            .font(.body)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.top, 5)
                    }
                }
                .padding(.horizontal)
                
                // Rent Now Button
                Button(action: {
                    print("Rent Now clicked")
                }) {
                    Text("Rent Now")
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Theme.thirdColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.top, 20)
                }
                .padding(.horizontal)
            }
        }
        .background(Theme.mainBackground)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ProductDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailScreen()
    }
}
