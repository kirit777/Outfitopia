//
//  SplashScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//
import SwiftUI

struct SplashScreen: View {
    // State variable for handling the navigation after splash screen
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                // Navigate to the next screen or Home Screen
                Text("Welcome to the App!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Theme.thirdColor)
                    .transition(.slide)
            } else {
                // Splash screen content
                VStack {
                    // Logo (can replace with actual image)
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Theme.thirdColor)
                        .padding()

                    // App Name
                    Text("ClothRent")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Theme.thirdColor)

                    // Loading Indicator
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Theme.secondaryColor))
                        .padding(.top, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Theme.mainBackground)
                .onAppear {
                    // Simulate a delay before transitioning to the next screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

