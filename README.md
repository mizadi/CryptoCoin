# CryptoCoin - iOS Application

**CryptoCoin** is an iOS app that displays cryptocurrency prices, supports searching, sorting by price, and includes offline storage using Core Data.

---

## Features

- **View Coins**: Displays cryptocurrency prices fetched from an API.
- **Search**: Users can search by coin name or symbol.
- **Sort**: Coins can be sorted by price in ascending/descending order.
- **Offline Access**: Stores data locally using Core Data.
- **Error Handling**: Network errors are handled with retry logic using exponential backoff.
- **Dependency Injection**: Used throughout the app for decoupling and testability.

---

## Architecture

### MVVM (Model-View-ViewModel)
- **Model**: `CryptoCurrency` represents a coin.
- **View**: `MainView` displays the UI and binds to the ViewModel.
- **ViewModel**: Handles business logic, communicates with the service, and binds to the View.

### Key Components
- **CryptoService**: Fetches data from the API, handles network retries with exponential backoff.
- **CryptoRepository**: Abstracts data access and interacts with the service.
- **Core Data**: Persists cryptocurrency data locally for offline access.
- **Error Handling**: Uses a custom `AppError` enum for consistent error management.

---

## Technologies

- **SwiftUI**: UI framework for building the interface.
- **Combine**: For data binding and reactivity.
- **Core Data**: Local persistence for storing cryptocurrency data.
- **Dependency Injection**: For injecting services and repositories into the ViewModel.
- **Repository Pattern**: Abstracts the data layer to keep the app modular.

---

## How to Run

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/CryptoCoin.git
    ```

2. Open the project in **Xcode**:
    ```bash
    open CryptoCoin.xcworkspace
    ```

3. Build and run the app on a simulator or device.

---

## Contact

Developed by **Adi Mizrahi**  
GitHub: [https://github.com/your-username](https://github.com/your-username)
