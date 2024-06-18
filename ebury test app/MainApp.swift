//
//  MainApp.swift
//  ebury test app
//
//  Created by Joel Sene on 14/06/2024.
//

import SwiftUI
import SwiftData

@main
struct MainApp: App {
    // Create a ModelContainer to manage the data of type Product
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ViewCoordinator()
            // Set the model container for the entire app
                .modelContainer(container)
            // Set viewModel as an enviroment object
                .environmentObject(HomeViewModel(modelContext: container.mainContext))
        }
    }
    
    init() {
        do {
            // Create a ModelContainer for managing data of type 
            container = try ModelContainer(for: TransactionsModel.self)
        } catch {
            fatalError("Failed to create ModelContainer for TransactionsModel")
        }
    }
}
