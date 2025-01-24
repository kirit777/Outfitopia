import SwiftUI

struct PinterestGridView: View {
    let images = Array(repeating: "img23", count: 20) // Replace with your actual image names

    var body: some View {
        ScrollView {
            PinterestLayout(images: images)
        }
        .padding(.horizontal, 10)
    }
}

struct PinterestLayout: View {
    let images: [String]
    
    @State private var columnHeights: [CGFloat] = [0.0, 0.0] // Two columns
    
    init(images: [String]) {
        self.images = images
    }
    
    var body: some View {
        GeometryReader { geometry in
            let columnWidth = (geometry.size.width - 30) / 2 // Two columns with spacing between them
            
            HStack(alignment: .top, spacing: 15) {
                // First column
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(0..<images.count / 2, id: \.self) { index in
                        let imageName = images[index]
                        let randomHeight = CGFloat([150, 200, 250, 300].randomElement() ?? 250)
                        PinterestCard(imageName: imageName, height: randomHeight, columnIndex: 0, columnHeights: $columnHeights)
                    }
                }
                .frame(width: columnWidth)
                
                // Second column
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(images.count / 2..<images.count, id: \.self) { index in
                        let imageName = images[index]
                        let randomHeight = CGFloat([150, 200, 250, 300].randomElement() ?? 250)
                        PinterestCard(imageName: imageName, height: randomHeight, columnIndex: 1, columnHeights: $columnHeights)
                    }
                }
                .frame(width: columnWidth)
            }
            .padding(.horizontal, 10)
        }
    }
}

struct PinterestCard: View {
    let imageName: String
    let height: CGFloat
    let columnIndex: Int
    @Binding var columnHeights: [CGFloat]
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: height)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 4)
            
            Text("Image \(imageName)")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
        .frame(width: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .onAppear {
            self.columnHeights[columnIndex] += height + 15 // Update column height dynamically
        }
    }
}

#Preview {
    PinterestGridView()
}
