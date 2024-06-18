//
//  ListItem.swift
//  ebury test app
//
//  Created by Joel Sene on 18/06/2024.
//

import SwiftUI

struct ListItem: View {
    @State var account: TransactionsModel
    
    var body: some View {
        HStack {
            // Image with placeholder text
            Image(account.amount.currency.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text(account.amount.currency)
                    .font(.headline)
                Text(account.amount.currencyFullName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("\(Double(account.amount.amount) ?? 00, specifier: "%.2f")")
                .font(.headline)
                .padding(.trailing)
        }
        .padding(8) // Inner padding within the item
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Outer shadow
        .padding(.horizontal, 8) // Horizontal padding to control item width
        .padding(.vertical, 4) // Vertical padding for spacing between items
    }
}
