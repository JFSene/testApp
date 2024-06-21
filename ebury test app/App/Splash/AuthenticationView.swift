import SwiftUI

struct AuthenticationView: View {
    @ObservedObject var biometricAuthManager: BiometricAuthManager
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.strings) var constantsStore
    
    var body: some View {
        ZStack {
            Image(
                colorScheme ==
                    .light ?
                constantsStore.ssLight
                : constantsStore.ssDark
            )
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Text("Please authenticate to continue")
                    .font(.title)
                    .padding()
                Button("Authenticate") {
                    biometricAuthManager.authenticateUser()
                }
                .padding()
            }
        }
    }
}
