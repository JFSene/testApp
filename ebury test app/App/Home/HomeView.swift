import SwiftUI
import SwiftData

struct HomeView: View {
    // ViewModel for managing product data and state
    @EnvironmentObject var viewModel: HomeViewModel
    @Environment(\.colorScheme) var colorScheme
    @Query var transactionsListStore: [TransactionsModel]
    
    var body: some View {
        VStack {
            HeaderView(colorScheme: _colorScheme)
                .ignoresSafeArea()
                .overlay {
                    if viewModel.isLoading {
                        LoaderView()
                            .frame(alignment: .center)
                    }
                }
            AccountsListView(account: transactionsListStore)
                .padding(.top, -100)
            
        }
        .onAppear {
            if transactionsListStore.isEmpty {
                viewModel.fetchTransactionsList()
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    HomeView()
}
