//
//  ProductListingScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct ProductListingScreen: View {
    // Demo Data
    let clothingItems = [
        ("Casual T-shirt", "item_image_1", "$10/day"),
        ("Party Dress", "item_image_2", "$20/day"),
        ("Ethnic Kurta", "item_image_3", "$15/day"),
        ("Formal Suit", "item_image_4", "$25/day"),
        ("Sports Jacket", "item_image_5", "$18/day")
    ]
    
    // Sort and Filter options
    @State private var selectedSortOption = "Price"
    @State private var selectedSize = "M"
    
    var body: some View {
        VStack {
            // Sorting and Filtering Section
            HStack {
                // Sort by option
                Menu {
                    Button(action: {
                        selectedSortOption = "Price"
                    }) {
                        Text("Price")
                    }
                    Button(action: {
                        selectedSortOption = "Brand"
                    }) {
                        Text("Brand")
                    }
                    Button(action: {
                        selectedSortOption = "Size"
                    }) {
                        Text("Size")
                    }
                } label: {
                    Text("Sort by: \(selectedSortOption)")
                        .foregroundColor(Theme.thirdColor)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                
                // Size Filter Dropdown
                Menu {
                    Button(action: {
                        selectedSize = "S"
                    }) {
                        Text("S")
                    }
                    Button(action: {
                        selectedSize = "M"
                    }) {
                        Text("M")
                    }
                    Button(action: {
                        selectedSize = "L"
                    }) {
                        Text("L")
                    }
                    Button(action: {
                        selectedSize = "XL"
                    }) {
                        Text("XL")
                    }
                } label: {
                    Text("Size: \(selectedSize)")
                        .foregroundColor(Theme.thirdColor)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            // Product List
            ScrollView {
                LazyVStack {
                    ForEach(clothingItems, id: \.0) { item in
                        ProductItemView(item: item)
                    }
                }
            }
            .padding(.top, 20)
            
            // Pagination (Demo purpose)
            HStack {
                Spacer()
                Button(action: {
                    print("Load more items")
                }) {
                    Text("Load More")
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Theme.thirdColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                Spacer()
            }
            .padding(.top, 30)
        }
        .background(Theme.mainBackground)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ProductItemView: View {
    let item: (String, String, String) // (Title, Image, Rent Price)
    
    var body: some View {
        VStack {
            Image(item.1) // Demo image name
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(10)
                .padding()
            
            Text(item.0) // Item Title
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Theme.thirdColor)
                .padding(.bottom, 5)
            
            Text(item.2) // Rent Price
                .font(.headline)
                .foregroundColor(Theme.secondaryColor)
                .padding(.bottom, 10)
            
            Button(action: {
                print("Item selected: \(item.0)")
            }) {
                Text("Rent Now")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Theme.thirdColor)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal)
    }
}

struct ProductListingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductListingScreen()
    }
}
