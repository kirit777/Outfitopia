//
//  Custome.swift
//  Wardrob
//
//  Created by HKinfoway Tech. on 16/01/25.
//

import SwiftUI

enum AppColors {
    static let b3d5f1 = Color(hex:"#B3D5F1")
    static let c35233d = Color(hex:"#35233D")
    static let f3a9a8 = Color(hex:"#F3A9A8")
    static let c431752 = Color(hex:"#431752")
    static let c4c1f5b = Color(hex:"#4C1F5B")
}

extension Color {
    // Initialize Color from Hex string (e.g., "#FF5733" or "FF5733")
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Remove the hash sign (#) if it's included
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }

        // Ensure it's exactly 6 characters long
        if hexSanitized.count == 6 {
            // Extract RGB components
            let scanner = Scanner(string: hexSanitized)
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)

            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0

            self.init(red: red, green: green, blue: blue)
        } else {
            // Default to black if the hex string is invalid
            self.init(.black)
        }
    }
}
