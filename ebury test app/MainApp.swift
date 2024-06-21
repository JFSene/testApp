import SwiftUI
import SwiftData

@main
struct MainApp: App {
    // Create a ModelContainer to manage the data of type TransactionsModel
    let container: ModelContainer
    // Monitor for Network connection
    @State private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            TabMainView()
                // Set the model container for the entire app
                .modelContainer(container)
                // Set viewModel as an environment object
                .environmentObject(HomeViewModel(modelContext: container.mainContext))
                .environment(\.strings, ConstantsStore())
                .environment(networkMonitor)
        }
    }
    
    init() {
        do {
            // Create a ModelContainer for managing data of type TransactionsModel
            container = try ModelContainer(for: TransactionsModel.self)
        } catch {
            fatalError("Failed to create ModelContainer for TransactionsModel")
        }
    }
}
