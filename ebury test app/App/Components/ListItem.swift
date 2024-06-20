import SwiftUI

struct ListItem: View {
    @State var account: TransactionsModel
    @Environment(\.strings) var constantsStore // Environment variable for accessing localized strings
    @Environment(\.colorScheme) var colorScheme // Environment variable for accessing color scheme
    
    var body: some View {
        HStack {
            // Display currency image based on account's currency
            Image(account.amount.currency.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: constantsStore.itemImageFrame, height: constantsStore.itemImageFrame)
                .padding(constantsStore.itemPadding)
                .cornerRadius(constantsStore.itemCornerRadius)
                .padding(.leading)
            
            VStack(alignment: .leading) {
                // Display currency code and full name
                Text(account.amount.currency.uppercased())
                    .font(.headline)
                Text(account.amount.currencyFullName)
                    .font(.subheadline)
            }
            
            Spacer()
            
            // Display amount with currency formatted to two decimal places
            Text("\(Double(account.amount.amount) ?? 0.00, specifier: "%.2f")")
                .font(.headline)
                .padding(.trailing)
        }
        .padding(constantsStore.itemPadding) // Inner padding within the item
        .background(colorScheme == .light ? constantsStore.lightMode : constantsStore.darkMode) // Background color based on color scheme
        .cornerRadius(constantsStore.itemCornerRadius) // Corner radius for rounded corners
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Outer shadow
        .padding(.horizontal, constantsStore.itemHStackHorizontalPadding) // Horizontal padding to control item width
        .padding(.vertical, constantsStore.itemHStackVerticalPadding) // Vertical padding for spacing between items
    }
}
