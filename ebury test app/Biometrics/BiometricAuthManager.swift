import LocalAuthentication

/// Manages biometric authentication state and actions.
class BiometricAuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false
    
    /// Attempts to authenticate user using biometric authentication.
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        #if targetEnvironment(simulator)
        // Bypass authentication on simulator
        self.isAuthenticated = true
        #else
        // Authenticate using biometrics on device
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate to access your account") { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                    } else {
                        // Handle authentication failure
                        self.isAuthenticated = false
                    }
                }
            }
        } else {
            // Handle no biometrics available
            self.isAuthenticated = false
        }
        #endif
    }
}
