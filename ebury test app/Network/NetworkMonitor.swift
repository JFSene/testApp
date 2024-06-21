import Foundation
import Network

@Observable
final class NetworkMonitor {
    // NWPathMonitor instance to monitor network changes
    private let networkMonitor = NWPathMonitor()
    
    // DispatchQueue for the network monitor to run on
    private let workerQueue = DispatchQueue(label: "Monitor")
    
    // Boolean property to indicate network connectivity status
    var isConnected = false
    
    init() {
        // Set the path update handler to update the isConnected property
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        
        // Start the network monitor on the worker queue
        networkMonitor.start(queue: workerQueue)
    }
}
