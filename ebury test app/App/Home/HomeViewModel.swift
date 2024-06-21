import Foundation
import Combine
import SwiftData

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var errorMessage: String? // Published property for error message to be shown in UI
    @Published var showAlert: Bool = false // Published property to control visibility of alert
    @Published var isLoading: Bool = false // Published property to indicate loading state
    
    private var cancellables = Set<AnyCancellable>() // Store for Combine subscriptions
    
    var modelContext: ModelContextProtocol?  // Context for data persistence
    
    init(modelContext: ModelContextProtocol?) {
        self.modelContext = modelContext
    }
    
    func fetchTransactionsList() {
        isLoading = true // Start loading indicator
        errorMessage = nil // Clear any previous error message
        
        NetworkService.shared.fetchTransactions()
            .receive(on: DispatchQueue.main) // Ensure UI updates are on the main thread
            .sink { completion in
                switch completion {
                case .finished:
                    self.isLoading = false // Stop loading indicator on successful completion
                case .failure(let error):
                    self.handleFetchError(error) // Handle error if fetch fails
                }
            } receiveValue: { transactions in
                self.handleFetchSuccess(transactions) // Handle successful fetch
            }
            .store(in: &cancellables) // Store the subscription to manage its lifecycle
    }
    
    private func handleFetchSuccess(_ transactions: [TransactionsModel]) {
        transactions.forEach {
            self.modelContext?.insert($0) // Insert fetched transactions into the model context for persistence
        }
    }
    
    private func handleFetchError(_ error: Error) {
        if let customError = error as? CustomError {
            self.errorMessage = customError.localizedDescription // Set specific error message if it's a custom error
        } else {
            self.errorMessage = "An unexpected error occurred" // Default error message for unexpected errors
        }
        self.showAlert = true // Display alert to user
        self.isLoading = false // Stop loading indicator
    }
}
