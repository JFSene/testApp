import SwiftUI

struct NoNetworkView: View {
    // Access the network monitor environment object
    @Environment(NetworkMonitor.self) private var networkMonitor
    // Access constants and strings from the environment
    @Environment(\.strings) var constantsStore
    // Access the current color scheme (light or dark mode)
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .center, spacing: constantsStore.noNetworkVStackSpacing) {
            // Spacer rectangle with dynamic height and color based on the color scheme
            Rectangle()
                .frame(height: constantsStore.spacerHeight)
                .foregroundStyle(colorScheme == .light ? constantsStore.lightMode : .black)
            
            // Text label for the internet status
            Text(constantsStore.titleText)
                .font(.title)
            
            // Image indicating no network connection
            Image(systemName: constantsStore.noWifiImage)
                .font(.title)
                .foregroundStyle(.red)
            
            // Text label indicating a network connection problem
            Text(constantsStore.noWifiMainText)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(width: constantsStore.noNetworkWidth)
            
            // Spacer to push content to the top
            Spacer()
        }
        // Background color based on the current color scheme
        .background(colorScheme == .light ? constantsStore.lightMode : .black)
        // Rounded corners on the top left and top right
        .cornerRadius(constantsStore.listCornerRadius, corners: [.topLeft, .topRight])
        // Shadow effect with a specified radius
        .shadow(radius: constantsStore.listShadowRadius)
        // Extend the view to ignore safe area at the bottom
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    NoNetworkView()
        .environment(NetworkMonitor())
}
