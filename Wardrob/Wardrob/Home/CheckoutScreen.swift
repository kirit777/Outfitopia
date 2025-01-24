//
//  CheckoutScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct CheckoutScreen: View {
    // Demo Data for Order Summary
    @State private var name = "John Doe"
    @State private var address = "123, Baker Street, London"
    @State private var contactInfo = "+91 123 456 7890"
    
    @State private var selectedPaymentMethod = "Credit/Debit Card"
    
    @State private var cartItems = [
        CartItem(image: "item_image_1", title: "Stylish Summer Dress", quantity: 2, pricePerItem: 20),
        CartItem(image: "item_image_2", title: "Casual T-shirt", quantity: 1, pricePerItem: 15)
    ]
    
    var totalRentPrice: Double {
        return cartItems.reduce(0) { $0 + (Double($1.quantity) * $1.pricePerItem) }
    }
    
    var shippingCost: Double {
        return 50 // Fixed shipping cost for demo
    }
    
    var orderTotal: Double {
        return totalRentPrice + shippingCost
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // Shipping Address Form
                    VStack(alignment: .leading) {
                        Text("Shipping Address")
                            .font(.headline)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.top)
                        
                        TextField("Full Name", text: $name)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.horizontal)
                        
                        TextField("Address", text: $address)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.horizontal)
                        
                        TextField("Contact Info", text: $contactInfo)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.horizontal)
                    }
                    
                    // Payment Method
                    VStack(alignment: .leading) {
                        Text("Payment Method")
                            .font(.headline)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.top)
                        
                        Picker("Select Payment Method", selection: $selectedPaymentMethod) {
                            Text("Credit/Debit Card").tag("Credit/Debit Card")
                            Text("UPI").tag("UPI")
                            Text("Wallets").tag("Wallets")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                    }
                    
                    // Order Summary
                    VStack(alignment: .leading) {
                        Text("Order Summary")
                            .font(.headline)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.top)
                        
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
                        
                        // Shipping Cost
                        HStack {
                            Text("Shipping Cost")
                                .font(.body)
                                .foregroundColor(Theme.thirdColor)
                            
                            Spacer()
                            
                            Text("₹\(shippingCost, specifier: "%.2f")")
                                .font(.body)
                                .foregroundColor(Theme.secondaryColor)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Total Order Price
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Total")
                                .font(.headline)
                                .foregroundColor(Theme.thirdColor)
                            
                            Spacer()
                            
                            Text("₹\(orderTotal, specifier: "%.2f")")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Theme.secondaryColor)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Rent Now Button
                    Button(action: {
                        print("Proceed to Payment")
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

struct CheckoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutScreen()
    }
}

