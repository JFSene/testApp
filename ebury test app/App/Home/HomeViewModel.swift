import Foundation
import Combine
import SwiftData

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var errorMessage: String?
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    
    var modelContext: ModelContext? // Context for data persistence
    
    private var cancellables = Set<AnyCancellable>()
    
    init(modelContext: ModelContext?) {
        self.modelContext = modelContext
    }
    
    func fetchTransactionsList() {
        isLoading = true
        errorMessage = nil
        
        NetworkService.shared.fetchTransactions()
            .receive(on: DispatchQueue.main) // Ensure UI updates are on the main thread
            .sink { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    self.handleFetchError(error)
                }
            } receiveValue: { transactions in
                self.handleFetchSuccess(transactions)
            }
            .store(in: &cancellables)
    }
    
    private func handleFetchSuccess(_ transactions: [TransactionsModel]) {
        transactions.forEach {
            print("Fetched transaction ---->: \($0)")
            self.modelContext?.insert($0)
        }
    }
    
    private func handleFetchError(_ error: Error) {
        if let customError = error as? CustomError {
            self.errorMessage = customError.localizedDescription
        } else {
            self.errorMessage = "An unexpected error occurred"
        }
        self.showAlert = true
        self.isLoading = false
    }
}
