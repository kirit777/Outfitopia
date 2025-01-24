//
//  CustomerSupportScreen.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 17/01/25.
//

import SwiftUI

struct CustomerSupportScreen: View {
    // MARK: - Properties
    @State private var subject = ""
    @State private var message = ""
    @State private var isLiveChatActive = false
    @State private var selectedFAQ = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Title Section
                Text("Customer Support")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Theme.thirdColor)
                    .padding(.top, 32)

                // Contact Form Section
                supportFormSection

                // FAQs Section
                faqSection

                // Live Chat Section
                liveChatSection

                // Phone/Email Support Section
                contactInformationSection
            }
            .padding()
            .background(Theme.mainBackground.edgesIgnoringSafeArea(.all))
        }
    }

    private var supportFormSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Contact Form")
                .font(.headline)
                .foregroundColor(Theme.thirdColor)

            TextField("Enter Subject", text: $subject)
                .padding(12)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.2), radius: 4)

            TextEditor(text: $message)
                .frame(height: 100)
                .padding(12)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.2), radius: 4)

            Button(action: handleSubmit) {
                Text("Submit")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Theme.thirdColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }

    private var faqSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("FAQs")
                .font(.headline)
                .foregroundColor(Theme.thirdColor)

            ForEach(faqs, id: \ .self) { faq in
                HStack {
                    Text(faq)
                        .font(.body)
                        .foregroundColor(Theme.secondaryColor)
                        .onTapGesture {
                            self.selectedFAQ = faq
                        }

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundColor(Theme.thirdColor)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.1), radius: 4)
            }
        }
    }

    private var liveChatSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            if !isLiveChatActive {
                Text("Need Instant Help?")
                    .font(.headline)
                    .foregroundColor(Theme.thirdColor)

                Button(action: { isLiveChatActive.toggle() }) {
                    Text("Start Live Chat")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Theme.secondaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            } else {
                Text("Live Chat")
                    .font(.headline)
                    .foregroundColor(Theme.thirdColor)

                Text("You are now chatting with a support agent.")
                    .font(.body)
                    .foregroundColor(Theme.secondaryColor)

                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Support Agent: How can I assist you today?")
                            .foregroundColor(Theme.thirdColor)
                        Text("You: I need help with my return request.")
                            .foregroundColor(Theme.secondaryColor)
                    }
                }
                .padding(.horizontal)

                TextField("Type your message...", text: $message)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: .gray.opacity(0.2), radius: 4)

                Button(action: handleSendMessage) {
                    Text("Send")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Theme.thirdColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
    }

    private var contactInformationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Contact Us")
                .font(.headline)
                .foregroundColor(Theme.thirdColor)

            contactRow(label: "Phone: +91-123-456-7890", icon: "phone.fill")
            contactRow(label: "Email: support@rentalapp.com", icon: "envelope.fill")
        }
    }

    private func contactRow(label: String, icon: String) -> some View {
        HStack {
            Text(label)
                .foregroundColor(Theme.secondaryColor)
            Spacer()
            Image(systemName: icon)
                .foregroundColor(Theme.thirdColor)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.1), radius: 4)
    }

    // MARK: - Actions
    private func handleSubmit() {
        print("Subject: \(subject), Message: \(message)")
    }

    private func handleSendMessage() {
        print("Message sent: \(message)")
    }
}

struct CustomerSupportScreen_Previews: PreviewProvider {
    static var previews: some View {
        CustomerSupportScreen()
    }
}

// Sample FAQ data
let faqs = [
    "How to rent clothes?",
    "How to return an item?",
    "How to pay for rentals?",
    "What if the item is damaged?"
]
