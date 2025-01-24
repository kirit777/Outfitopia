//
//  SearchResultsScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct SearchResultsScreen: View {
    // MARK: - Properties
    @State private var searchQuery = "Dress"
    @State private var sortBy = "Popularity"
    @State private var items = [
        ClothingItem(title: "Casual T-shirt", image: "tshirt", rentPrice: 199),
        ClothingItem(title: "Summer Dress", image: "dress", rentPrice: 499),
        ClothingItem(title: "Party Blouse", image: "blouse", rentPrice: 299),
        ClothingItem(title: "Evening Gown", image: "gown", rentPrice: 799)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Search Bar
            HStack {
                TextField("Search for items...", text: $searchQuery)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Spacer()
                            if !searchQuery.isEmpty {
                                Button(action: { searchQuery = "" }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                                .padding(.trailing, 8)
                            }
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 8)
                    )

                Button(action: performSearch) {
                    Text("Search")
                        .font(.subheadline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                        .background(Theme.secondaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding([.horizontal, .top])

            // Sorting Options
            HStack {
                Text("Sort By:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Picker("Sort By", selection: $sortBy) {
                    Text("Popularity").tag("Popularity")
                    Text("Price").tag("Price")
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.horizontal)

            // Search Results List
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0..<items.count) { i in
                        SearchResultRow(item: items[i])
                            .padding(.horizontal)
                    }
                }
            }
        }
        .background(Theme.mainBackground.edgesIgnoringSafeArea(.all))
    }

    // MARK: - Methods
    private func performSearch() {
        print("Searching for: \(searchQuery)")
        // Add search logic here
    }
}

struct SearchResultRow: View {
    let item: ClothingItem

    var body: some View {
        HStack(spacing: 16) {
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(Theme.thirdColor)

                Text("₹\(item.rentPrice)")
                    .font(.subheadline)
                    .foregroundColor(Theme.secondaryColor)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: {
                print("Rent \(item.title)")
            }) {
                Text("Rent Now")
                    .font(.footnote)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(Theme.secondaryColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct ClothingItem {
    let id:UUID = UUID()
    let title: String
    let image: String
    let rentPrice: Int
}

struct SearchResultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsScreen()
    }
}
