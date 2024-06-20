import SwiftUI
import SwiftData

// Define a PreviewContainer class to manage preview data for transactions
let previewContainer: ModelContainer = {
    do {
        // Create an in-memory ModelContainer for TransactionsModel
        let container = try ModelContainer(
            for: TransactionsModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        Task { @MainActor in
            let context = container.mainContext
            
            // Insert example transactions into the context for preview purposes
            let exampleTransaction1 = TransactionsModel(
                accountId: "123456789",
                companyName: "Example Company 1",
                amount: Amount(amount: "100.0", currency: "USD"),
                creditDebitIndicator: "credit",
                datetime: "2024-06-20T12:00:00Z"
            )
            context.insert(exampleTransaction1)
            
            let exampleTransaction2 = TransactionsModel(
                accountId: "987654321",
                companyName: "Example Company 2",
                amount: Amount(amount: "200.0", currency: "USD"),
                creditDebitIndicator: "debit",
                datetime: "2024-06-21T12:00:00Z"
            )
            context.insert(exampleTransaction2)
        }
        return container
    } catch {
        fatalError("Failed to create container with error: \(error.localizedDescription)")
    }
}()
