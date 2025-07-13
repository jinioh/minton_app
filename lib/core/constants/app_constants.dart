class AppConstants {
  // App Info
  static const String appName = '운동갈래';
  static const String appVersion = '1.0.0';

  // API Endpoints
  static const String baseUrl = 'https://api.undonggallae.com';
  static const String apiVersion = '/v1';

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String settingsKey = 'app_settings';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Validation
  static const int minNicknameLength = 2;
  static const int maxNicknameLength = 20;
  static const int maxDescriptionLength = 500;

  // Matching
  static const int minParticipants = 2;
  static const int maxParticipants = 20;
  static const int maxLocations = 2;

  // Review
  static const int maxReviewLength = 200;
  static const int maxPhotos = 3;

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
}
