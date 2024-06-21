import Combine
import XCTest
import SwiftData
@testable import ebury_test_app

// Mock ModelContext conforming to ModelContextProtocol
class MockModelContext: ModelContextProtocol {
    var insertedTransactions: [TransactionsModel] = []

    // Mock implementation of insert method to store transactions locally
    func insert(_ transaction: TransactionsModel) {
        insertedTransactions.append(transaction)
    }
}

class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel! // The view model under test
    var mockModelContext: MockModelContext! // Mock model context for dependency injection
    var cancellables = Set<AnyCancellable>() // Store for Combine subscriptions

    // Setup method executed before each test case
    @MainActor override func setUp() {
        super.setUp()
        mockModelContext = MockModelContext() // Initialize mock model context
        viewModel = HomeViewModel(modelContext: mockModelContext) // Initialize view model with mock context
    }

    // Teardown method executed after each test case
    override func tearDown() {
        viewModel = nil // Clean up view model instance
        mockModelContext = nil // Clean up mock model context instance
        super.tearDown()
    }

    // Test case to verify successful fetchTransactionsList() method
    @MainActor func testFetchTransactionsSuccess() {
        let expectation = XCTestExpectation(description: "Fetch transactions successfully")
        
        viewModel.fetchTransactionsList() // Trigger fetching of transactions
        
        // Subscribe to isLoading changes to verify loading state
        viewModel.$isLoading
            .dropFirst() // Ignore initial state
            .sink { isLoading in
                XCTAssertFalse(isLoading, "isLoading should be false after successful fetch")
                XCTAssertEqual(self.mockModelContext.insertedTransactions.count, 6, "Two transactions should be inserted") // Verify transactions were inserted
                expectation.fulfill() // Fulfill expectation upon completion
            }
            .store(in: &cancellables) // Store subscription for lifecycle management
        
        wait(for: [expectation], timeout: 5.0) // Wait for expectations to fulfill
    }
}

