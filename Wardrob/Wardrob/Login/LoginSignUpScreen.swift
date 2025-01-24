//
//  LoginSignUpScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct LoginSignUpScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLogin = true
    
    var body: some View {
        VStack {
            // Header Section
            VStack {
                Text(isLogin ? "Login to Your Account" : "Create a New Account")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Theme.thirdColor)
                    .padding(.top, 50)
                
                Text(isLogin ? "Welcome back! Please log in to continue." : "Join us! Please create your account.")
                    .foregroundColor(Theme.thirdColor)
                    .padding(.top, 5)
            }
            .padding(.bottom, 50)

            // Input Fields
            VStack(spacing: 20) {
                // Email Input
                TextField("Email or Mobile Number", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .foregroundColor(Theme.thirdColor)
                
                // Password Input
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .foregroundColor(Theme.thirdColor)
                
                // Login/Sign Up Button
                Button(action: {
                    // Action for login/sign up (demo)
                    print("\(isLogin ? "Login" : "Sign Up") with email: \(email) and password: \(password)")
                }) {
                    Text(isLogin ? "Login" : "Sign Up")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Theme.thirdColor)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 30)
            
            // Forgot Password Link
            HStack {
                Spacer()
                Button(action: {
                    // Forgot Password action (demo)
                    print("Forgot Password clicked")
                }) {
                    Text("Forgot Password?")
                        .fontWeight(.bold)
                        .foregroundColor(Theme.secondaryColor)
                }
                .padding(.top, 10)
            }
            
            // Social Media Login Section
            VStack {
                Text("Or login with")
                    .foregroundColor(Theme.thirdColor)
                    .padding(.top, 40)
                
                // Google Login Button
                Button(action: {
                    // Google login action (demo)
                    print("Login with Google")
                }) {
                    HStack {
                        Image(systemName: "google")
                            .foregroundColor(.white)
                        Text("Login with Google")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Theme.secondaryColor)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                }
                .padding(.top, 20)
                
                // Facebook Login Button
                Button(action: {
                    // Facebook login action (demo)
                    print("Login with Facebook")
                }) {
                    HStack {
                        Image(systemName: "facebook")
                            .foregroundColor(.white)
                        Text("Login with Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Theme.secondaryColor)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.mainBackground)
    }
}

struct LoginSignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignUpScreen()
    }
}
