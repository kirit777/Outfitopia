//
//  CartScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct CartScreen: View {
    // Demo Data for Cart Items
    @State private var cartItems = [
        CartItem(image: "item_image_1", title: "Stylish Summer Dress", quantity: 2, pricePerItem: 20),
        CartItem(image: "item_image_2", title: "Casual T-shirt", quantity: 1, pricePerItem: 15)
    ]
    
    @State private var promoCode = ""
    @State private var discountApplied = false
    @State private var rentDurationStart = Date()
    @State private var rentDurationEnd = Date().addingTimeInterval(86400 * 7) // 1 week later
    
    var totalRentPrice: Double {
        return cartItems.reduce(0) { $0 + (Double($1.quantity) * $1.pricePerItem) }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // Cart Items List
                    ForEach(cartItems, id: \.id) { item in
                        HStack {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                    .foregroundColor(Theme.thirdColor)
                                HStack {
                                    Text("Qty: \(item.quantity)")
                                        .font(.subheadline)
                                        .foregroundColor(Theme.thirdColor)
                                    Text("₹\(item.pricePerItem, specifier: "%.2f")/day")
                                        .font(.subheadline)
                                        .foregroundColor(Theme.thirdColor)
                                }
                            }
                            
                            Spacer()
                            
                            Text("₹\(Double(item.quantity) * item.pricePerItem, specifier: "%.2f")")
                                .font(.headline)
                                .foregroundColor(Theme.secondaryColor)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    }
                    
                    // Rent Duration (Start and End Date)
                    VStack(alignment: .leading) {
                        Text("Rent Duration")
                            .font(.headline)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.top)
                        
                        HStack {
                            DatePicker("Start Date", selection: $rentDurationStart, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(maxWidth: .infinity)
                            
                            DatePicker("End Date", selection: $rentDurationEnd, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Promo Code Option
                    VStack(alignment: .leading) {
                        Text("Promo Code")
                            .font(.headline)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.top)
                        
                        TextField("Enter promo code", text: $promoCode)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.horizontal)
                        
                        Button(action: {
                            if promoCode.lowercased() == "discount" {
                                discountApplied = true
                            }
                        }) {
                            Text("Apply Promo Code")
                                .fontWeight(.bold)
                                .foregroundColor(Theme.mainBackground)
                                .padding()
                                .background(Theme.thirdColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .padding(.horizontal)
                        }
                    }
                    
                    // Total Rent Price
                    VStack(alignment: .leading) {
                        Text("Total Rent Price")
                            .font(.headline)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.top)
                        
                        HStack {
                            Text("₹\(totalRentPrice, specifier: "%.2f")")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Theme.secondaryColor)
                            
                            if discountApplied {
                                Text(" - 10% Off")
                                    .font(.body)
                                    .foregroundColor(.green)
                                    .padding(.leading, 10)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Rent Now Button
                    Button(action: {
                        print("Proceed to Rent Now")
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
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
    }
}

// Cart Item Model
struct CartItem {
    var id = UUID()
    var image: String
    var title: String
    var quantity: Int
    var pricePerItem: Double
}
