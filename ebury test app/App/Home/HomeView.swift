import SwiftUI
import SwiftData

struct HomeView: View {
    // Access the view model and constants from the environment
    @EnvironmentObject var viewModel: HomeViewModel
    // Access constants and strings from the environment
    @Environment(\.strings) var constantsStore
    // Access the network monitor environment object
    @Environment(NetworkMonitor.self) private var networkMonitor
    
    var body: some View {
        VStack {
            // Add the HeaderView and handle loading state overlay
            HeaderView()
                .ignoresSafeArea()
                .frame(height: constantsStore.headerViewHeight)
                .overlay {
                    if viewModel.isLoading {
                        LoaderView()
                            .frame(alignment: .center)
                    }
                }
            // check for network conection and presents the right view
            if networkMonitor.isConnected {
                // Add the AccountsListView with top padding
                AccountsListView()
                    .padding(.top, constantsStore.accountsListViewTopPadding)
            } else {
                NoNetworkView()
                    .padding(.top, constantsStore.accountsListViewTopPadding)
            }
        }
        // Fetch transactions list when the view appears
        .onAppear {
            if networkMonitor.isConnected {
                viewModel.fetchTransactionsList()
            }
        }
        // Show an alert if there's an error
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
        }
    }
}

// Preview for the HomeView with a mock HomeViewModel
#Preview {
    HomeView()
        .environmentObject(HomeViewModel(modelContext: .none))
        .modelContainer(previewContainer)
}

