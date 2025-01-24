//
//  NotificationsScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct NotificationsScreen: View {
    // Demo data for notifications
    let notifications = [
        NotificationItem(title: "Rental Confirmation", message: "Your Blue Party Dress has been successfully rented!", isRead: false),
        NotificationItem(title: "Delivery Status", message: "Your order is out for delivery and will arrive by 5 PM today.", isRead: true),
        NotificationItem(title: "New Offers", message: "Get 20% off on your next rental! Use code: RENT20.", isRead: false)
    ]

    var body: some View {
        VStack {
            // Title Section
            Text("Notifications")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(Theme.thirdColor)
                .padding(.top, 40)

            // Notification List
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(notifications) { notification in
                        NotificationRow(notification: notification)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
        .background(Theme.mainBackground.edgesIgnoringSafeArea(.all))
    }
}

struct NotificationRow: View {
    var notification: NotificationItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Circle()
                .fill(notification.isRead ? Theme.secondaryColor.opacity(0.5) : Theme.thirdColor)
                .frame(width: 12, height: 12)

            VStack(alignment: .leading, spacing: 6) {
                Text(notification.title)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(Theme.thirdColor)
                
                Text(notification.message)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .foregroundColor(Theme.secondaryColor)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if !notification.isRead {
                Button(action: {
                    print("Notification marked as read")
                }) {
                    Text("Mark as Read")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(Theme.thirdColor)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(notification.isRead ? Color.white : Theme.secondaryColor.opacity(0.1))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

struct NotificationItem: Identifiable {
    var id = UUID()
    var title: String
    var message: String
    var isRead: Bool
}

struct NotificationsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsScreen()
    }
}
