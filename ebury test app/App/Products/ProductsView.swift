//
//  ProductsView.swift
//  ebury test app
//
//  Created by Joel Sene on 18/06/2024.
//

import SwiftUI

struct ProductsView: View {
    var body: some View {
        VStack {
            HeaderView()
                .ignoresSafeArea()
                .frame(height: 340)
        }
    }
}

#Preview {
    ProductsView()
}
