# Infinite Scrolling and Searchable Product List

This is a Flutter application that allows users to view, search, and manage a list of products. The app features product fetching with infinite scrolling, search functionality, and a favorites system. The app is built using Clean Architecture, BLoC/Cubit state management, and Hive for local storage.

## Features

- **Product Listing**: Fetch and display a list of products with infinite scrolling.
- **Search**: Search for products by query with instant results.
- **Favorites**: Add and remove products from favorites. View all favorite products in a separate screen.
- **Network Checking**: Handle no internet connection scenarios with appropriate error messages.

## Architecture

### Clean Architecture

The project is structured using Clean Architecture principles:

- **Presentation Layer**: Contains the UI and state management logic using Flutter's BLoC/Cubit.
- **Domain Layer**: Contains business logic and use cases.
- **Data Layer**: Handles data sources (remote and local) and repository implementations.

### State Management

State management is handled using Flutter's Cubit. The `ProductCubit` manages the state for fetching and searching products, while the `FavoriteCubit` handles the state for managing favorite products.

### Dependencies

#### Flutter SDK
- **flutter**: Core Flutter SDK.
- **cupertino_icons**: Icons for iOS.

#### State Management
- **flutter_bloc**: BLoC library for state management.
- **equatable**: Library for value-based object comparison.

#### Networking and API
- **dio**: HTTP client library for network requests.

#### Dependency Injection
- **get_it**: Dependency Injection library.

#### Data Storage
- **hive**: Lightweight NoSQL database for Flutter.
- **hive_flutter**: Hive integration with Flutter.

#### Serialization
- **json_annotation**: Library for annotating classes for JSON serialization and deserialization.
- **json_serializable**: Code generation tool for serialization based on annotations.

#### Image Handling
- **cached_network_image**: Library for loading and caching images from URLs.

#### Connectivity
- **connectivity_plus**: Library for checking network connectivity.

#### Localization
- **intl**: Library for internationalization and date/time formatting.

#### Toast Notifications
- **fluttertoast**: Library for showing toast notifications.

### Dev Dependencies

#### Code Generation
- **build_runner**: Build tool for code generation tasks.

#### JSON Serialization
- **json_serializable**: Used for automatic code generation for JSON serialization.

#### Testing
- **flutter_test**: Official Flutter testing library.

#### Linting
- **flutter_lints**: Linting rules for Flutter code.
## Setup

1. **Clone the Repository**

    ```bash
    git clone https://github.com/your-repository/product-management-app.git
    cd product-management-app
    ```

2. **Install Dependencies**

    ```bash
    flutter pub get
    ```

3. **Setup Dependencies**

    Ensure you have the required dependencies in your `pubspec.yaml`:

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      dio: ^4.0.0
      hive: ^2.0.4
      fluttertoast: ^8.0.8
      connectivity: ^3.0.6
      flutter_bloc: ^8.0.0
    ```

4. **Setup Hive**

    Initialize Hive in your `main.dart`:

    ```dart
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Hive.initFlutter();
      // Register Hive adapters here
      runApp(MyApp());
    }
    ```

5. **Network Information**

    Ensure `NetworkInfo` is properly initialized and injected using GetIt for network connectivity checks.

## Usage

### Fetching Products

Products are fetched and displayed with infinite scrolling. Use the `ProductCubit` to handle fetching and searching products.

### Search Products

Use the `searchProducts` method in `ProductCubit` to search for products based on user input.

### Manage Favorites

Add and remove products from favorites using the `FavoriteCubit`. The favorites are stored locally using Hive and can be viewed in the Favorites screen.

## Error Handling

- **Network Errors**: Display toast messages when there is no internet connection.
- **Fetch Errors**: Show error messages in the UI if product fetching fails.

## Example

```dart
// Fetch products
context.read<ProductCubit>().fetchProducts();

// Search products
context.read<ProductCubit>().searchProducts('query');

// Add to favorites
context.read<FavoriteCubit>().addFavorite(product);

// Remove from favorites
context.read<FavoriteCubit>().removeFavorite(productId);
