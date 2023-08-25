class AppError {
  final AppErrorType type;
  late String errorMessage;

  final int? errorCode;

  AppError({required this.type, String? errorMessage, this.errorCode}) {
    if (errorMessage != null) {
      this.errorMessage = errorMessage;
      return;
    }
    switch (type) {
      case AppErrorType.network:
        this.errorMessage = 'No Network';
      case AppErrorType.api:
        this.errorMessage = 'Oops! something went wrong';
      case AppErrorType.timeout:
        this.errorMessage =
            'It seems connection is slow or response is taking too long! Please try again later.';
      case AppErrorType.unknown:
        this.errorMessage = 'Something went wrong';
    }
  }
}

enum AppErrorType {
  network,
  api,
  timeout,
  unknown;
}
