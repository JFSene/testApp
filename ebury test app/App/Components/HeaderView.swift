import SwiftUI

struct HeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            Image(colorScheme == .light ? "bg-light" : "bg-dark")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: 350)
                .clipped()
                .overlay {
                    VStack(alignment: .leading) {
                        Image("accountIcon")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Spacer()
                        Text("Welcome")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(height: 40)
                        
                        Text("Company Name")
                            .fontWeight(.semibold)
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(height: 40)
                        Spacer()
                    }
                    .offset(x: -100, y: 50)
                }
        }
        .frame(height: 350) // Ensure the height is fixed as before
    }
}

#Preview {
    HeaderView()
}
