import SwiftUI

struct TabMainView: View {
    @Environment(\.strings) var constantsStore // Environment variable for accessing localized strings
    
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {
                        Label(
                            constantsStore.tabBarWalletTitle,
                            image: constantsStore.tabBarWalletIcon
                        )
                        .fontWeight(.semibold)
                        .font(.headline)
                    }
                
                ProductsView()
                    .tabItem {
                        Label(
                            constantsStore.tabBarProductsTitle,
                            image: constantsStore.tabBarProductsIcon
                        )
                        .fontWeight(.semibold)
                        .font(.headline)
                    }
            }
        }
    }
}

// Preview for TabMainView with dependencies
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
            .environmentObject(HomeViewModel(modelContext: nil)) // Provide a mock HomeViewModel without modelContext
            .modelContainer(previewContainer) // Use the previewContainer for preview data
    }
}
