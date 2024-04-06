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
   <!-- In case you have fvm installed -->
   fvm use
   flutter pub get
   ```

4. Run the app on a connected device or emulator:

   ```bash
   flutter run --flavor development --target lib/main_development.dart
   ```

Obs:

- Created a makefile to make it easier to generate the code(Riverpod).

  ```bash
  make gen
  ```

- The app uses the [User API](https://dummyjson.com/users/${id}) to fetch random user data.
- The app uses the [Products API](https://dummyjson.com/products/) to fetch products data.

## Screenshots

![image](https://github.com/ramirezsebas/products_app/assets/61977214/50da300c-5961-4a5e-8b63-446c2745a9c7)

![image](https://github.com/ramirezsebas/products_app/assets/61977214/ef8c2e23-c5fa-492d-b2ec-6d3604afd9d4)

![image](https://github.com/ramirezsebas/products_app/assets/61977214/478b2f1f-f404-44ee-99f2-678df8a42e41)

![image](https://github.com/ramirezsebas/products_app/assets/61977214/528ec467-c237-478e-afd8-0784909431b3)

![image](https://github.com/ramirezsebas/products_app/assets/61977214/e869600e-2061-43e0-b233-5b0c33062e9b)

![image](https://github.com/ramirezsebas/products_app/assets/61977214/89c9c7c1-091e-4693-9b7f-c927d0bb2d0f)

![image](https://github.com/ramirezsebas/products_app/assets/61977214/5ea93a7c-7e1c-40f9-951d-fde766926956)


## Videos


https://github.com/ramirezsebas/products_app/assets/61977214/524791b7-b94e-49ee-bb02-b22b34ee862f


