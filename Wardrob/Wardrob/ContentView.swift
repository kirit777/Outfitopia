//
//  ContentView.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 16/01/25.
//

import SwiftUI



struct WelcomeScreen: View {
    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)
            VStack {
                Image("user_profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Ellipse())
                    .frame(width: 250, height: 350)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.pink.opacity(0.3))
                    )

                Text("Welcome to your")
                    .font(.title)
                    .foregroundColor(.white)
                Text("Waredrobe")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(.white)

                Button(action: {
                    print("Continue pressed")
                }) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "arrow.right")
                                .foregroundColor(.purple)
                        )
                }
                .padding(.top, 20)
            }
        }
    }
}

struct WardrobeScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0..<5) { _ in
                            Image("look_image")
                                .resizable()
                                .frame(width: 150, height: 200)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
                HStack {
                    Text("T-Shirts")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Button("View all") {}
                }
                .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0..<5) { _ in
                            Image("tshirt_image")
                                .resizable()
                                .frame(width: 120, height: 150)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle("Waredrobe")
        }
    }
}

struct ProfileScreen: View {
    var body: some View {
        VStack {
            Image("profile")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()

            Text("Tina Barton")
                .font(.title)
                .bold()

            Text("Member from April, 2021")
                .font(.subheadline)
                .foregroundColor(.gray)

            VStack(spacing: 20) {
                ProfileOption(icon: "hand.thumbsup.fill", title: "Style Preferences")
                ProfileOption(icon: "target", title: "Body Parameters")
                ProfileOption(icon: "house.fill", title: "Location & Currency")
                ProfileOption(icon: "bell.fill", title: "Notifications")
            }
            .padding(.top)

            Spacer()
        }
        .padding()
    }
}

struct ProfileOption: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.pink)
                .frame(width: 30, height: 30)

            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
        )
    }
}

struct InspirationScreen: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<5) { _ in
                        Image("inspiration")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)

            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(0..<8) { _ in
                        Image("fashion_item")
                            .resizable()
                            .frame(height: 200)
                            .cornerRadius(12)
                    }
                }
                .padding()
            }

            Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Welcome")
                }
            WardrobeScreen()
                .tabItem {
                    Image(systemName: "tshirt.fill")
                    Text("Wardrobe")
                }
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            InspirationScreen()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Inspiration")
                }
        }
    }
}




#Preview {
    ContentView()
}

