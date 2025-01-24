//
//  OnboardingScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct OnboardingScreen: View {
    @State private var currentIndex = 0
    @State private var isActive = false
    
    // Demo onboarding data
    let onboardingData = [
        OnboardingItem(imageName: "shirt.fill", title: "Rent Clothes", description: "Browse and rent clothes for any occasion, from casual to party wear."),
        OnboardingItem(imageName: "leaf.fill", title: "Eco-Friendly", description: "Renting clothes helps reduce waste and promotes sustainability."),
        OnboardingItem(imageName: "cart.fill", title: "Easy Shopping", description: "Browse through various categories, add items to your cart, and rent with just a few taps!")
    ]
    
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
                // Onboarding Slide Content
                VStack {
                    // Onboarding Image
                    Image(systemName: onboardingData[currentIndex].imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Theme.thirdColor)
                        .padding(.top, 50)
                    
                    // Title
                    Text(onboardingData[currentIndex].title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Theme.thirdColor)
                        .padding(.top, 20)
                    
                    // Description Text
                    Text(onboardingData[currentIndex].description)
                        .font(.body)
                        .foregroundColor(Theme.thirdColor)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    // Buttons: Skip & Next
                    HStack {
                        // Skip Button
                        Button(action: {
                            withAnimation {
                                isActive = true
                            }
                        }) {
                            Text("Skip")
                                .fontWeight(.bold)
                                .foregroundColor(Theme.secondaryColor)
                                .padding(.leading)
                        }
                        
                        Spacer()
                        
                        // Next Button
                        Button(action: {
                            if currentIndex < onboardingData.count - 1 {
                                currentIndex += 1
                            } else {
                                withAnimation {
                                    isActive = true
                                }
                            }
                        }) {
                            Text(currentIndex == onboardingData.count - 1 ? "Start" : "Next")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Theme.thirdColor)
                                .cornerRadius(10)
                                .padding(.trailing)
                        }
                    }
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Theme.mainBackground)
            }
        }
    }
}

struct OnboardingItem {
    var imageName: String
    var title: String
    var description: String
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
