//
//  HomeScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct HomeScreen: View {
    let categories = ["Casual", "Party Wear", "Ethnic Wear", "Formal", "Sportswear"]
    let featuredItems = ["Featured 1", "Featured 2", "Featured 3", "Featured 4"]
    let recommendedItems = ["Recommended 1", "Recommended 2", "Recommended 3", "Recommended 4"]
    
    var body: some View {
        VStack {
            // Search Bar and Category Filter
            HStack {
                // Search Bar
                TextField("Search for clothes...", text: .constant(""))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .foregroundColor(Theme.thirdColor)
                    .padding(.leading, 20)
                
                // Category Filter Dropdown (Just demo)
                Menu {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            print("Selected category: \(category)")
                        }) {
                            Text(category)
                        }
                    }
                } label: {
                    Image(systemName: "line.horizontal.3.decrease.circle.fill")
                        .foregroundColor(Theme.thirdColor)
                        .font(.title)
                        .padding(.trailing, 20)
                }
            }
            .padding(.top, 20)
            
            // Featured Clothing Carousel
            VStack(alignment: .leading) {
                Text("Featured Clothing")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Theme.thirdColor)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                TabView {
                    ForEach(featuredItems, id: \.self) { item in
                        VStack {
                            Image("item_image_\(item)") // Replace with actual image name
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                                .cornerRadius(20)
                                .padding(.horizontal)
                            
                            Text(item)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Theme.thirdColor)
                        }
                    }
                }
                .frame(height: 300)
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            .padding(.bottom, 30)
            
            // Recommended Clothing Section
            VStack(alignment: .leading) {
                Text("Recommended for You")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Theme.thirdColor)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(recommendedItems, id: \.self) { item in
                            VStack {
                                Image("item_image_\(item)") // Replace with actual image name
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(10)
                                    .padding(.bottom, 5)
                                
                                Text(item)
                                    .font(.headline)
                                    .foregroundColor(Theme.thirdColor)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 30)
            
            // Navigation Bar
            HStack {
                Spacer()
                NavigationLink(destination: Text("Home")) {
                    VStack {
                        Image(systemName: "house.fill")
                            .font(.title)
                            .foregroundColor(Theme.thirdColor)
                        Text("Home")
                            .font(.caption)
                            .foregroundColor(Theme.thirdColor)
                    }
                }
                Spacer()
                
                NavigationLink(destination: Text("Cart")) {
                    VStack {
                        Image(systemName: "cart.fill")
                            .font(.title)
                            .foregroundColor(Theme.thirdColor)
                        Text("Cart")
                            .font(.caption)
                            .foregroundColor(Theme.thirdColor)
                    }
                }
                Spacer()
                
                NavigationLink(destination: Text("Profile")) {
                    VStack {
                        Image(systemName: "person.fill")
                            .font(.title)
                            .foregroundColor(Theme.thirdColor)
                        Text("Profile")
                            .font(.caption)
                            .foregroundColor(Theme.thirdColor)
                    }
                }
                Spacer()
            }
            .padding()
            .background(Theme.mainBackground)
            .cornerRadius(10)
            .padding(.horizontal)
            .shadow(radius: 5)
        }
        .background(Theme.mainBackground)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
