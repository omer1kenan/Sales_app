
# Sales App

Sales App is a Flutter application designed for product browsing, profile management, and a streamlined checkout experience. This app is structured following the **Data/Domain/Presentation** architecture to maintain clean, maintainable code. Users can browse products, view details, manage their profile, and simulate login functionality.

## Project Structure

The project is organized into three main layers to follow a **Clean Architecture** approach:

1. **Data Layer**: Responsible for API communication, data models, and data sources.
2. **Domain Layer**: Contains use cases that interact with the Data Layer and provide the necessary operations for the Presentation Layer.
3. **Presentation Layer**: Includes controllers and UI screens, utilizing the Domain Layer to present and manipulate data.

### Folder Structure

```
lib/
├── data/
│   ├── datasources/
│   │   └── user_remote_data_source.dart
│   ├── models/
│   │   └── user.dart
│   └── repositories/
│       └── user_repository.dart
├── domain/
│   └── usecases/
│       └── get_user.dart
└── presentation/
    ├── profile/
    │   ├── profile_controller.dart
    │   └── profile_screen.dart
    └── auth/
        └── auth_controller.dart
```

### Features

- **Product Browsing**: Users can view a list of available products with details.
- **User Authentication**: Simulated login using a predefined username and password.
- **Profile Management**: Users can view and edit their profile details such as name, address, email, and phone.
- **Clean Architecture**: Implements **Data/Domain/Presentation** structure for improved code organization and scalability.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An IDE like [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/sales_app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd sales_app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## Usage

### Login Credentials

Use the following credentials to log in:

- **Username**: `johnd`
- **Password**: `m38rmF$`

Upon successful login, you will be redirected to the product browsing section. You can then navigate to your profile to view and edit user details.

### Key Screens

- **Login Screen**: Users enter their credentials to log in.
- **Product List Screen**: Displays available products.
- **Profile Screen**: Displays user information (name, address, email, phone) and allows for profile updates.

### Architecture Overview

- **Data Layer**: Contains the `UserRemoteDataSource` for API requests and the `UserRepository` for managing data.
- **Domain Layer**: Includes `GetUser`, a use case that communicates with the data layer.
- **Presentation Layer**: Manages user interactions through `ProfileController` and displays information using `ProfileScreen`.

## Contributing

If you'd like to contribute, please fork the repository and make changes as you'd like. Pull requests are warmly welcome.

## License

This project is open-source and available under the [MIT License](LICENSE).

---

### Notes

- **For testing purposes**, use the credentials provided in the "Login Credentials" section.
- **API**: This app currently uses the [Fake Store API](https://fakestoreapi.com/) for simulating product data.
