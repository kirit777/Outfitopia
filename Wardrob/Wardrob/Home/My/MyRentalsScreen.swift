//
//  MyRentalsScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct MyRentalsScreen: View {
    // Demo Data for My Rentals
    @State private var rentalHistory = [
        RentalItem(image: "item_image_1", title: "Stylish Summer Dress", rentStartDate: "1st Jan 2025", rentEndDate: "5th Jan 2025", status: "Ongoing"),
        RentalItem(image: "item_image_2", title: "Casual T-shirt", rentStartDate: "15th Dec 2024", rentEndDate: "20th Dec 2024", status: "Completed"),
        RentalItem(image: "item_image_3", title: "Party Dress", rentStartDate: "10th Jan 2025", rentEndDate: "14th Jan 2025", status: "Cancelled")
    ]
    
    @State private var filterStatus = "All"
    
    var body: some View {
        VStack {
            // Filter Options
            HStack {
                FilterButton(title: "All", isActive: filterStatus == "All") {
                    filterStatus = "All"
                }
                FilterButton(title: "Ongoing", isActive: filterStatus == "Ongoing") {
                    filterStatus = "Ongoing"
                }
                FilterButton(title: "Completed", isActive: filterStatus == "Completed") {
                    filterStatus = "Completed"
                }
                FilterButton(title: "Cancelled", isActive: filterStatus == "Cancelled") {
                    filterStatus = "Cancelled"
                }
            }
            .padding()
            .background(Theme.mainBackground)
            
            // Rental History List
            ScrollView {
                ForEach(rentalHistory.filter { filterStatus == "All" || $0.status == filterStatus }, id: \.id) { rental in
                    RentalItemView(rental: rental)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                }
            }
        }
        .background(Theme.mainBackground)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct FilterButton: View {
    var title: String
    var isActive: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.bold)
                .padding()
                .background(isActive ? Theme.thirdColor : Theme.mainBackground)
                .foregroundColor(isActive ? .white : Theme.thirdColor)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .padding(.horizontal, 5)
    }
}

struct RentalItemView: View {
    var rental: RentalItem
    
    var body: some View {
        VStack {
            HStack {
                Image(rental.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text(rental.title)
                        .font(.headline)
                        .foregroundColor(Theme.thirdColor)
                    
                    Text("Rent Dates: \(rental.rentStartDate) - \(rental.rentEndDate)")
                        .font(.subheadline)
                        .foregroundColor(Theme.thirdColor)
                    
                    Text("Status: \(rental.status)")
                        .font(.subheadline)
                        .foregroundColor(rental.status == "Ongoing" ? .green : rental.status == "Completed" ? .blue : .red)
                }
                
                Spacer()
                
                if rental.status == "Ongoing" {
                    Button(action: {
                        print("Return Item Action")
                    }) {
                        Text("Return")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .background(Theme.thirdColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}

struct MyRentalsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MyRentalsScreen()
    }
}

// Rental Item Model
struct RentalItem {
    var id = UUID()
    var image: String
    var title: String
    var rentStartDate: String
    var rentEndDate: String
    var status: String
}
