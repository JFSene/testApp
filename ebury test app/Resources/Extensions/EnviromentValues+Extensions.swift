import SwiftUI

extension EnvironmentValues {
    var strings: ConstantsStore {
        get { self[ConstantsStore.self] }
        set { self[ConstantsStore.self] = newValue }
    }
}
