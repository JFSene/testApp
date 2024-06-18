import SwiftUI

struct AccountsListView: View {
    @State var account: [TransactionsModel]
    
    var body: some View {
        VStack {
            // The list container with corner radius
            VStack {
                ScrollView {
                    Color.white.ignoresSafeArea()
                    LazyVStack(spacing: 8) {
                        // List header
                        HStack {
                            Text("Your currencies")
                                .font(.headline)
                                .padding(.leading, 24)
                            Spacer()
                            Text("View all")
                                .foregroundColor(.blue)
                                .padding(.trailing)
                        }
                        .padding(.top)
                        
                        ForEach(account, id: \.self) { transaction in
                            ListItem(account: transaction)
                                .frame(height: 100)
                                .padding(.horizontal, 12)
                        }
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .shadow(radius: 10)
        }
        .edgesIgnoringSafeArea(.bottom) // Ignore bottom safe area to fit the list properly
    }
}
