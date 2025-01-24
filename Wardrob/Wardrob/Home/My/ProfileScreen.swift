
import SwiftUI

struct ProfileScreen: View {
    // Demo Data for User Profile
    @State private var userName = "John Doe"
    @State private var userEmail = "johndoe@gmail.com"
    @State private var userPhone = "+91 9876543210"
    @State private var userProfileImage = "profile_image" // Replace with your own profile image name
    @State private var wishlistItems = [
        WishlistItem(image: "item_image_1", title: "Stylish Summer Dress"),
        WishlistItem(image: "item_image_2", title: "Casual T-shirt")
    ]
    
    var body: some View {
        VStack {
            // Profile Section
            HStack {
                Image(userProfileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Theme.thirdColor, lineWidth: 4))
                    .shadow(radius: 10)
                
                VStack(alignment: .leading) {
                    Text(userName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Theme.thirdColor)
                    Text(userEmail)
                        .font(.subheadline)
                        .foregroundColor(Theme.thirdColor)
                    Text(userPhone)
                        .font(.subheadline)
                        .foregroundColor(Theme.thirdColor)
                }
                .padding(.leading)
                
                Spacer()
            }
            .padding()
            
            // Address Book Section
            SectionTitle(title: "Address Book")
            AddressRow(address: "123, Baker Street, London")
            
            // Payment Methods Section
            SectionTitle(title: "Payment Methods")
            PaymentMethodRow(paymentMethod: "Credit Card - **** **** **** 1234")
            
            // Wishlist Section
            SectionTitle(title: "Wishlist")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(wishlistItems, id: \.id) { item in
                        WishlistItemView(item: item)
                    }
                }
                .padding()
            }
            
            // Logout Button
            Button(action: {
                // Logout action
                print("Logging out...")
            }) {
                Text("Logout")
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

struct AddressRow: View {
    var address: String
    
    var body: some View {
        HStack {
            Image(systemName: "house.fill")
                .foregroundColor(Theme.thirdColor)
            Text(address)
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

struct PaymentMethodRow: View {
    var paymentMethod: String
    
    var body: some View {
        HStack {
            Image(systemName: "creditcard.fill")
                .foregroundColor(Theme.thirdColor)
            Text(paymentMethod)
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

struct WishlistItemView: View {
    var item: WishlistItem
    
    var body: some View {
        VStack {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            Text(item.title)
                .font(.subheadline)
                .foregroundColor(Theme.thirdColor)
                .padding(.top, 5)
        }
        .frame(width: 120)
        .padding(.horizontal, 5)
    }
}

// Wishlist Item Model
struct WishlistItem {
    var id = UUID()
    var image: String
    var title: String
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
