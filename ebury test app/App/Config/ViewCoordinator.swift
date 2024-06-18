import SwiftUI
import Combine

struct ViewCoordinator: View {
    @State private var isActive = false
    
    
    var body: some View {
        if isActive {
            TabMainView()
        } else {
            SplashScreen(isActive: $isActive)
        }
    }
}
