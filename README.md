# clario_test

Clario test project

## Information
Flutter project with form validation and web page showcase. Web version is included in the package  for easy access.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/clario-test.git
   cd clario-test
   
   ```
## Project Structure

The project is organized as follows:

lib/
├── common/
│   ├── bloc/          # BLoC classes for state management
│   ├── consts/        # Constant values (e.g., color constants)
│   ├── pages/         # Common pages for the app
│   ├── utils/         # Utility functions
│   └── widgets/       # Shared widgets
├── features/
│   └── sign_in/       # Feature-specific code for sign-in functionality
        ├──screens/
        ├──widgets/
├── theme/             # Theme and styling related code
└── web/               # Web-specific code
    └──features/
        └──fields/
            ├──screens/
            ├──widgets/

## Features and Packages used
- Form validation
- Web page showcase
- Flutter Bloc
- formz

## Getting Started
To run web version, run 

`flutter run -d chrome `