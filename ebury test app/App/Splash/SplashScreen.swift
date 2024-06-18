//
//  SplashScreen.swift
//  ebury test app
//
//  Created by Joel Sene on 14/06/2024.
//

import SwiftUI

struct SplashScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var scale = 0.7
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            Image(colorScheme == .light ? .ssLight : .ssDark)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            // Your content view
            Text("Test App")
                .font(.system(size: 40))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

extension String {
    static let ssLight: String = "splashscreen-light"
    static let ssDark: String = "splashscreen-dark"
}
