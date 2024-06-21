import SwiftUI
import SwiftData

struct AccountsListView: View {
    // Fetch the list of transactions
    @Query var transactionsListStore: [TransactionsModel]
    // Access constants and color scheme from the environment
    @Environment(\.colorScheme) var colorScheme
    // Access constants and strings from the environment
    @Environment(\.strings) var constantsStore
    
    var body: some View {
        VStack {
            VStack {
                ScrollView {
                    LazyVStack(spacing: constantsStore.lazyVStackSpacing) {
                        // Header with title and "View All" button
                        HStack {
                            Text(constantsStore.listTitle)
                                .foregroundColor(colorScheme == .light ? constantsStore.darkMode : constantsStore.lightMode)
                                .padding(.leading, constantsStore.titlePaddingLeading)
                                .font(.headline)
                            Spacer()
                            Text(constantsStore.viewAllButton)
                                .foregroundColor(.blue)
                                .padding(.trailing)
                        }
                        .padding(.top)
                        .frame(height: constantsStore.internalHstackHeight)
                        
                        // Display the list of transactions, limited to a prefix value
                        ForEach(transactionsListStore.prefix(constantsStore.listPrefixValue), id: \.self) { transaction in
                            ListItem(account: transaction)
                                .lineSpacing(constantsStore.listItemLineSpacing)
                                .padding(.horizontal, constantsStore.listItemPaddingHorizontal)
                        }
                    }
                }
                .scrollDisabled(true) // Disable scrolling
            }
            .background(colorScheme == .light ? constantsStore.lightMode : .black)
            .cornerRadius(constantsStore.listCornerRadius, corners: [.topLeft, .topRight])
            .shadow(radius: constantsStore.listShadowRadius)
        }
        .edgesIgnoringSafeArea(.bottom) // Ignore bottom safe area to fit the list properly
    }
}

// Preview for the AccountsListView
#Preview {
    AccountsListView()
        .modelContainer(previewContainer)
}
