//
//  PaymentScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct PaymentScreen: View {
    // Demo Data for Payment Options and Total Payment Summary
    @State private var paymentMethods = [
        PaymentMethod(type: "Credit Card", number: "**** **** **** 1234"),
        PaymentMethod(type: "Debit Card", number: "**** **** **** 5678"),
        PaymentMethod(type: "UPI", number: "johndoe@upi")
    ]
    
    @State private var totalRent: Double = 1200.00
    @State private var taxes: Double = 100.00
    @State private var discounts: Double = 150.00
    
    var body: some View {
        VStack {
            // Payment Methods Section
            SectionTitle(title: "Payment Methods")
            List(paymentMethods, id: \.id) { method in
                PaymentMethodRow(paymentMethod: method)
            }
            .listStyle(PlainListStyle())
            
            // Add New Card Button
            Button(action: {
                // Action to add a new card
                print("Adding a new card...")
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Theme.thirdColor)
                    Text("Add New Card")
                        .fontWeight(.bold)
                        .foregroundColor(Theme.thirdColor)
                }
                .padding()
                .background(Theme.secondaryColor)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .padding(.top, 20)
            
            // Payment Summary Section
            SectionTitle(title: "Payment Summary")
            PaymentSummary(totalRent: totalRent, taxes: taxes, discounts: discounts)
            
            // Pay Now Button
            Button(action: {
                // Action to complete the payment
                print("Proceeding with payment...")
            }) {
                Text("Pay Now")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Theme.thirdColor)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .background(Theme.mainBackground)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SectionTitle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(Theme.thirdColor)
            .padding(.leading)
            .padding(.top, 20)
    }
}

struct PaymentMethodRow: View {
    var paymentMethod: PaymentMethod
    
    var body: some View {
        HStack {
            Image(systemName: "creditcard.fill")
                .foregroundColor(Theme.thirdColor)
            Text("\(paymentMethod.type) - \(paymentMethod.number)")
                .foregroundColor(Theme.thirdColor)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct PaymentSummary: View {
    var totalRent: Double
    var taxes: Double
    var discounts: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Rent")
                    .foregroundColor(Theme.thirdColor)
                Spacer()
                Text("₹\(String(format: "%.2f", totalRent))")
                    .foregroundColor(Theme.thirdColor)
            }
            HStack {
                Text("Taxes")
                    .foregroundColor(Theme.thirdColor)
                Spacer()
                Text("₹\(String(format: "%.2f", taxes))")
                    .foregroundColor(Theme.thirdColor)
            }
            HStack {
                Text("Discounts")
                    .foregroundColor(Theme.thirdColor)
                Spacer()
                Text("₹\(String(format: "%.2f", discounts))")
                    .foregroundColor(Theme.thirdColor)
            }
            Divider()
            HStack {
                Text("Total")
                    .fontWeight(.bold)
                    .foregroundColor(Theme.thirdColor)
                Spacer()
                Text("₹\(String(format: "%.2f", totalRent + taxes - discounts))")
                    .fontWeight(.bold)
                    .foregroundColor(Theme.thirdColor)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

// Payment Method Model
struct PaymentMethod {
    var id = UUID()
    var type: String
    var number: String
}

struct PaymentScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaymentScreen()
    }
}
