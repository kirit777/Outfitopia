//
//  HomeFragment.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 16/01/25.
//

import SwiftUI

struct HomeFragment: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {

                // Navigation Bar
                HStack {
                    Text("Wardrob")
                        .font(.title)
                        .bold()
                        .foregroundColor(AppColors.c35233d)
                    Spacer()
                    Button(action: {
                        // Cart button action
                    }) {
                        Image(systemName: "cart")
                            .font(.title2)
                            .foregroundColor(AppColors.c4c1f5b)
                            .padding(10)
                            .background(AppColors.c431752)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                }
                .padding(.horizontal, 20)

                // Horizontal Category List with padding, rounded corners, and gradient effect
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<5, id: \..self) { index in
                            Text("Category \(index + 1)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(AppColors.c431752)
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [AppColors.b3d5f1, AppColors.f3a9a8]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                    }
                    .padding(.horizontal, 20)
                }

                // First Section with Horizontal List
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Trending Now")
                            .font(.headline)
                            .foregroundColor(AppColors.c431752)
                            .padding(.leading, 20)
                        Spacer()
                        Button("See All") {
                            // See all action
                        }
                        .foregroundColor(AppColors.c4c1f5b)
                        .padding(.trailing, 20)
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<5, id: \..self) { index in
                                Image("img23")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(12)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }

                // Second Section with Vertical List
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("New Arrivals")
                            .font(.headline)
                            .foregroundColor(AppColors.c431752)
                            .padding(.leading, 20)
                        Spacer()
                        Button("See All") {
                            // See all action
                        }
                        .foregroundColor(AppColors.c4c1f5b)
                        .padding(.trailing, 20)
                    }

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 15) {
                            ForEach(0..<10, id: \..self) { index in
                                Image("img23")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(12)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [AppColors.b3d5f1, AppColors.c4c1f5b]), startPoint: .topLeading, endPoint: .bottomTrailing))
            //.edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeFragment()
}
