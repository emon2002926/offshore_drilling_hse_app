lib/
├── core/
│   ├── api/
│   │   └── api_client.dart
│   ├── constants/
│   │   └── api_constants.dart
│   ├── error/
│   │   └── failures.dart
│   └── network/
│       └── network_info.dart
├── features/
│   └── auth/
│       ├── data/
│       │   ├── models/
│       │   │   ├── login_request_model.dart
│       │   │   └── login_response_model.dart
│       │   ├── datasources/
│       │   │   └── auth_remote_data_source.dart
│       │   └── repositories/
│       │       └── auth_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── login_request.dart
│       │   │   └── user.dart
│       │   ├── repositories/
│       │   │   └── auth_repository.dart
│       │   └── usecases/
│       │       └── login_usecase.dart
│       └── presentation/
│           ├── bloc/
│           │   ├── login_bloc.dart
│           │   ├── login_event.dart
│           │   └── login_state.dart
│           ├── pages/
│           │   └── login_page.dart
│           └── widgets/
│               ├── email_field.dart
│               └── password_field.dart
└── main.dart