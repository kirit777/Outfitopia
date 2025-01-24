
import SwiftUI

struct OrderConfirmationScreen: View {
    // Demo Data for Order Confirmation
    @State private var orderNumber = "ORD123456789"
    @State private var shippingAddress = "123, Baker Street, London"
    @State private var expectedDeliveryDate = "2nd Feb 2025"
    @State private var cartItems = [
        CartItem(image: "item_image_1", title: "Stylish Summer Dress", quantity: 2, pricePerItem: 20),
        CartItem(image: "item_image_2", title: "Casual T-shirt", quantity: 1, pricePerItem: 15)
    ]
    
    var totalRentPrice: Double {
        return cartItems.reduce(0) { $0 + (Double($1.quantity) * $1.pricePerItem) }
    }
    
    var orderTotal: Double {
        return totalRentPrice + 50 // Including demo shipping cost
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // Order Confirmation Title
                    Text("Order Confirmed")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Theme.thirdColor)
                        .padding(.top, 40)
                        .padding(.horizontal)
                    
                    // Order Number
                    HStack {
                        Text("Order Number: ")
                            .font(.headline)
                            .foregroundColor(Theme.thirdColor)
                        Text(orderNumber)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Theme.secondaryColor)
                    }
                    .padding(.horizontal)
                    
                    // Delivery Details
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Delivery Details")
                            .font(.headline)
                            .foregroundColor(Theme.thirdColor)
                            .padding(.top)
                        
                        Text("Shipping Address: \(shippingAddress)")
                            .font(.body)
                            .foregroundColor(Theme.thirdColor)
                        
                        Text("Expected Delivery Date: \(expectedDeliveryDate)")
                            .font(.body)
                            .foregroundColor(Theme.thirdColor)
                    }
                    .padding(.horizontal)
                    
                    // Order Summary
                    VStack(alignment: .leading) {
                        Text("Summary of Rented Items")
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
                    }
                    
                    // Total Order Price
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Total Order Price")
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
                    
                    // Track Order Button
                    Button(action: {
                        print("Track Order")
                    }) {
                        Text("Track Order")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .background(Theme.thirdColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.top, 20)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .background(Theme.mainBackground)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct OrderConfirmationScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationScreen()
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
