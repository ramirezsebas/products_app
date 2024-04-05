# Flutter Products Riverpod App

This is a Flutter app that demonstrates the usage of Riverpod for state management, Dio for HTTP requests, and various features such as fetching random user data, listing products, pagination, adding favorites, and showing product details.

## Features

- Fetches random user data.
- Lists products with pagination.
- Allows users to add products to favorites.
- Shows more details of a product.

## Requirements

- Flutter SDK 3.19.2

## How to Run

1. Clone this repository:

   ```bash
   git clone git@github.com:ramirezsebas/products_app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd products_app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app on a connected device or emulator:

   ```bash
   flutter run
   ```

Obs:

- Created a makefile to make it easier to generate the code(Riverpod).

  ```bash
  make gen
  ```
  
- The app uses the [User API](https://dummyjson.com/users/${id}) to fetch random user data.
- The app uses the [Products API](https://dummyjson.com/products/) to fetch products data.

## Screenshots
