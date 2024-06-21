# Ebury Test App

This is a Test App made in SwiftUI, Combine, MVVM and Swift Data.

### Summary
The app follows the MVVM architecture pattern, utilizing SwiftUI for the user interface. It incorporates Combine for reactive programming, enabling asynchronous data handling and state management. SwiftData provides local data persistence capabilities, enhancing the app's ability to store and manage transactional data effectively. This architecture ensures clear separation of concerns: models encapsulate data logic, view models manage business logic, and views handle user interface presentation. Together, these technologies support a structured and scalable application with efficient data flow management.

It consumes an API built by myself using `Next.JS`, `Vercel` for deployment and `Prisma`+ `Postgres` for data storage.

You can reach the api at this repository here:
    [Test API with NextJS](https://github.com/JFSene/test-api-nextjs)
    
You can also use these links to access it here:
https://test-api-nextjs.vercel.app/   <<< To add new transactions
https://test-api-nextjs.vercel.app/api/transactions <<< GET all the transactions
 

## Installation

Clone the repo and run on your simulator or device.

```bash
    https://github.com/JFSene/testApp.git
```

## Classes
##### - NetworkService
The `NetworkService` singleton handles API requests using the `Combine` framework. It includes a fetchTransactions method that retrieves transaction data, decodes the JSON response into `TransactionsModel` objects, and returns it as a publisher, facilitating smooth integration with reactive programming paradigms.

##### - TransactionsModel
The `TransactionsModel` class represents transaction data, conforming to `Identifiable` and `Codable` for easy identification and JSON handling. The `CodingKeys` enum maps JSON keys to properties, while the initializer and `encode` function manage JSON serialization and deserialization. This setup ensures smooth integration with network services for fetching and sending transaction data.

##### - HomeView
The `HomeView` struct serves as the main view, combining a `HeaderView` and an `AccountsListView`. It uses environment objects and constants for dynamic content and styling. It also handles loading states and error alerts, providing a comprehensive and responsive user interface. A preview container and mock `HomeViewModel` are used to simulate data for SwiftUI previews.

##### - HomeViewModel
The `HomeViewModel` class manages the application's business logic related to fetching and handling transactions data. It utilizes `Combine` for asynchronous data handling and `SwiftData` for data persistence operations through modelContext. The class exposes published properties for error handling (errorMessage and showAlert) and loading state (isLoading), ensuring integration with SwiftUI views for a responsive user experience.

##### - TabMainView
The `TabMainView` struct represents the main view of the application, utilizing a `TabView` to navigate between HomeView and `ProductsView`. This setup facilitates navigation and user interaction within different sections of the app.

##### - MainApp
The `MainApp` struct serves as the entry point for the SwiftUI application, initializing necessary dependencies and configuring the main view hierarchy. It creates a `ModelContainer` to manage data of type `TransactionsModel`, enabling data persistence and management throughout the app. The `TabMainView` is set as the root view, utilizing the container for data operations and integrating `HomeViewModel` as an environment object for managing business logic related to transaction data. 

## Components
##### - HeaderView
The HeaderView struct creates a header with dynamic images and text based on the color scheme and environment constants. It uses SwiftUI views like ZStack, HStack, and VStack to layout images and text, ensuring responsiveness and adaptability to different themes. This design allows for a consistent and customizable header component.

##### - AccountsListView
The `AccountsListView` struct displays a list of transactions using a vertical stack with a header. It adapts to the current color scheme and uses environment constants for styling. The list is non-scrollable and limited to a set number of transactions for preview purposes. This design ensures a consistent and customizable transaction list view. A PreviewContainer class provides example data for SwiftUI previews.

##### - ListItem
The `ListItem` struct represents a single item view displaying transaction details. It dynamically adjusts its appearance based on the environment's color scheme and uses localized strings for currency display. Each item includes an image representing the currency, the currency code and full name, and the transaction amount formatted to two decimal places. The design ensures clarity and consistency across different data entries in a list format.

##### - NoNetworkView
The `NoNetworkView` class displays a message to the user when there is no network connection. It dynamically adapts its appearance based on the current color scheme, ensuring a consistent look in both light and dark modes. The view includes a message, an icon indicating the absence of a network, and a detailed text description. 

##### - NetworkMonitor
The `NetworkMonitor` class is responsible for monitoring the network connectivity status. It utilizes the NWPathMonitor from the Network framework to continuously check the network status and update the isConnected property accordingly. This class allows other parts of the application to respond to changes in network connectivity in real-time.

##### - ProductsView
The `ProductsView` class is designed to display the products page with dynamic styling based on the current color scheme (light or dark mode). It fetches constants from the environment for configuring its layout and content, providing a visually consistent and adaptive user interface.
