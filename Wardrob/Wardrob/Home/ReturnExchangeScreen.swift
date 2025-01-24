//
//  ReturnExchangeScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct ReturnExchangeScreen: View {
    // MARK: - Properties
    @State private var selectedItem = "Red Dress"
    @State private var reason = ""
    @State private var returnDate = Date()
    @State private var isImagePickerPresented = false
    @State private var uploadedImage: Image? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Title Section
                Text("Return/Exchange Request")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Theme.thirdColor)
                    .padding(.top, 32)

                // Selected Item
                VStack(alignment: .leading, spacing: 8) {
                    Text("Item")
                        .font(.headline)
                        .foregroundColor(Theme.thirdColor)
                    Text(selectedItem)
                        .font(.body)
                        .foregroundColor(Theme.secondaryColor)
                }

                // Reason for Return/Exchange
                VStack(alignment: .leading, spacing: 8) {
                    Text("Reason for Return/Exchange")
                        .font(.headline)
                        .foregroundColor(Theme.thirdColor)
                    TextField("Enter reason...", text: $reason)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }

                // Return Date Picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("Return Date")
                        .font(.headline)
                        .foregroundColor(Theme.thirdColor)
                    DatePicker("Select date", selection: $returnDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }

                // Upload Image Option
                VStack(alignment: .leading, spacing: 8) {
                    Text("Upload Image (optional)")
                        .font(.headline)
                        .foregroundColor(Theme.thirdColor)
                    Button(action: {
                        self.isImagePickerPresented.toggle()
                    }) {
                        Text("Choose Image")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Theme.secondaryColor)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(uploadedImage: $uploadedImage)
                    }

                    if let uploadedImage = uploadedImage {
                        uploadedImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                            .padding(.top, 10)
                    }
                }

                // Confirm Return Button
                Button(action: {
                    print("Return/Exchange request submitted")
                }) {
                    Text("Confirm Return")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Theme.thirdColor)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .background(Theme.mainBackground)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

// Image Picker for demo purposes
struct ImagePicker: View {
    @Binding var uploadedImage: Image?

    var body: some View {
        VStack(spacing: 24) {
            Text("Select an image for your return/exchange request")
                .font(.headline)
                .padding()

            Button(action: {
                uploadedImage = Image("sample_image")
            }) {
                Text("Select Sample Image")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Theme.secondaryColor)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
    }
}

struct ReturnExchangeScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReturnExchangeScreen()
    }
}
