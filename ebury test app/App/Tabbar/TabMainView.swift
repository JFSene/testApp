//
//  TabMainView.swift
//  ebury test app
//
//  Created by Joel Sene on 14/06/2024.
//

import SwiftUI

struct TabMainView: View {
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                
                ContentView()
                    .tabItem {
                        Label("Order", systemImage: "square.and.pencil")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
