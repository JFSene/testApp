import Foundation
import SwiftData

// Protocol defining required methods for a model context
protocol ModelContextProtocol {
    func insert(_ transaction: TransactionsModel)
}

// Adapter class conforming to ModelContextProtocol, wrapping ModelContext
class ModelContextAdapter: ModelContextProtocol {
    private let modelContext: ModelContext // Wrapped ModelContext instance

    // Initializer accepting a ModelContext instance
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    // Conformance to ModelContextProtocol by delegating insert operation
    func insert(_ transaction: TransactionsModel) {
        // Delegate insertion to the wrapped ModelContext instance
        self.modelContext.insert(transaction)
    }
}
